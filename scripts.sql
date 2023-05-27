USE photo_print_service;

-- 6 скриптов характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы)

-- 1) вывести товары по акциям, начавшимся в 2022 году
SELECT p.name, c.id AS catalog_id, promo.name, promo.started_at 
FROM products p
JOIN catalogs c 
ON p.catalog_id = c.id 
JOIN promo 
ON promo.catalog_id = c.id 
WHERE promo.started_at >= '2022-01-01';

-- 2) вывести пользователей, у которых есть незавершенные заказы за период: 2021 год (в хронологическом порядке)
SELECT u.id, u.name, o.id, o.created_at, o.status 
FROM users u
JOIN orders o 
ON u.id = o.user_id 
WHERE YEAR(created_at) = '2021' AND status != 'выполнен'
ORDER BY o.created_at;

-- 3) среди выполненных заказов найти заказ с максимальной суммой (с учётом скидки)
SELECT o.id, o.created_at, pr.started_at, pr.finished_at, pr.id, pr.discount, 
	SUM(IF(o.created_at > pr.started_at AND o.created_at < pr.finished_at, (pf.price*op.quantity)*((100-pr.discount)/100), pf.price*op.quantity)) AS summ
FROM orders o 
JOIN orders_products op 
	ON o.id = op.order_id 
JOIN products_features pf 
	ON pf.id = op.products_features_id
JOIN promo pr 
	ON op.discount_id = pr.id 
	WHERE op.is_deleted = 0 AND o.status = 'выполнен' 
GROUP BY o.id
ORDER BY summ DESC
LIMIT 1; 

-- 4) найти пользователя, у которого больше всего завершенных заказов
SELECT u.id, u.name, COUNT(o.id) AS orders 
FROM users u 
JOIN orders o 
ON u.id = o.user_id 
WHERE o.status = 'выполнен'
GROUP BY u.id 
ORDER BY orders DESC 
LIMIT 1;

-- 5)  для каждого вида фотокалендарей, если в данный момент на них действует акция, вывести стандартную цену, размер скидки и цену с учетом скидки
SELECT p.id, p.name, pf.price, pr.discount,  
	pf.price*((100-discount)/100) AS discount_price
FROM products p 
JOIN products_features pf
	ON pf.product_id = p.id 
JOIN promo pr 
	ON p.catalog_id = pr.catalog_id 
WHERE p.name = 'Фотокалендарь' AND NOW() > pr.started_at AND NOW() < pr.finished_at;

-- 6) из раздела каталога "Фотокниги" вывести все возможные варианты товаров с их характеристиками
SELECT p.name, pf.`size`, paper.density, paper.cover, pf.price 
FROM products p 
JOIN products_features pf 
ON p.id = pf.product_id 
JOIN paper 
ON pf.paper_id = paper.id 
JOIN catalogs c 
ON c.id = p.catalog_id 
WHERE c.name = 'Фотокниги';



-- представления

-- 1) данные для страницы заказов (названия товаров, количество, цена, цена со скидкой, статус заказа) 
CREATE OR REPLACE VIEW v_cart 
AS 
SELECT u.id AS user_id, u.name AS user_name, o.id AS order_id, o.created_at, p.name AS prod_name, pf.price AS prod_price, op.quantity, 
IF(NOW() > pr.started_at AND NOW() < pr.finished_at, pr.discount, NULL) AS discount, 
IF(NOW() > pr.started_at AND NOW() < pr.finished_at, pf.price*((100-discount)/100), pf.price) AS discount_price, 
o.status
FROM orders o
JOIN orders_products op 
	ON op.order_id = o.id 
JOIN users u 
	ON o.user_id = u.id 
JOIN products_features pf 
	ON pf.id = op.products_features_id
JOIN products p 
	ON pf.product_id = p.id  
JOIN promo pr
	ON p.catalog_id = pr.catalog_id 
WHERE op.is_deleted = 0 
GROUP BY pf.id 
ORDER BY o.created_at DESC;

SELECT * FROM v_cart WHERE user_id = 1;

-- 2) показать все личные альбомы пользователя и файлы фотографий в них
CREATE OR REPLACE VIEW v_user_personal 
AS
SELECT ul.user_id, lp.layout_id, lp.photo_id, up.filename  
FROM layouts_photo lp 
JOIN user_layouts ul 
	ON ul.id = lp.layout_id 
JOIN user_photo up 
	ON up.id = lp.photo_id 
ORDER BY layout_id;

SELECT * FROM v_user_personal WHERE user_id = 1;




-- хранимая процедура, функция

-- 1) хранимая процедура: добавить новый товар и описание его особенностей (размер, цена...)
DROP PROCEDURE IF EXISTS photo_print_service.sp_product_add;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `photo_print_service`.`sp_product_add`(
catalog_id INT, name VARCHAR(255), 
`size` VARCHAR(100), paper_id BIGINT, price INT, 
OUT tran_result VARCHAR(255))
BEGIN
	
	DECLARE `_rollback` BIT DEFAULT b'0';
	DECLARE err_code VARCHAR(100);
	DECLARE err_string VARCHAR(100);

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		SET `_rollback` = b'1';
		GET stacked DIAGNOSTICS CONDITION 1 
		err_code = RETURNED_SQLSTATE, err_string = MESSAGE_TEXT;
		SET tran_result = CONCAT('Ошибка ', err_code, 'Текст ошибки: ', err_string);
	END;

	START TRANSACTION;
		INSERT INTO products (catalog_id, name) 
		VALUES (catalog_id, name);
	
		SET @last_product_id = last_insert_id();
	
		INSERT INTO products_features (product_id, `size`, paper_id, price) 
		VALUES (last_insert_id(), `size`, paper_id, price);

	IF `_rollback` 
	THEN 
		-- SET tran_result = 'ERROR';
		ROLLBACK;
	ELSE 
		SET tran_result = 'OK';
		COMMIT;
	END IF;
	
END$$
DELIMITER ;

CALL sp_product_add(7, 'Магнит с фото малый', '60*40', NULL, 150, @tran_result);
SELECT @tran_result;

-- 2) функция: вывести цену товара на текущий момент с учетом скидки 
DROP FUNCTION IF EXISTS photo_print_service.calc_discount_price;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` FUNCTION `photo_print_service`.`calc_discount_price`(prod_features_id BIGINT) RETURNS DECIMAL(9,2)
    NO SQL
BEGIN 
	DECLARE discount_price DECIMAL(9,2);

	SET discount_price = (
		SELECT pf.price*((100-pr.discount)/100) AS discount_price
		FROM products p 
		JOIN catalogs c 
			ON c.id = p.catalog_id 
		JOIN products_features pf 
			ON pf.product_id = p.id 
		JOIN promo pr 
			ON pr.catalog_id = c.id
		WHERE pf.id = prod_features_id AND curdate() > pr.started_at AND curdate() < pr.finished_at);
	
	RETURN discount_price;
END$$
DELIMITER ;

SELECT calc_discount_price(35);





-- 2 триггера

-- 1) при изменении в promo.started_at даты позже текущей уведомлять об ошибке
DROP TRIGGER IF EXISTS photo_print_service.check_started_at_before_update;
USE photo_print_service;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` TRIGGER `check_started_at_before_update` BEFORE UPDATE ON `promo` FOR EACH ROW BEGIN
	IF NEW.started_at > current_date() 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Date update trigger. Max date in `started_at` is today.';
	END IF;	
END$$
DELIMITER ;

UPDATE promo SET started_at = '2030-01-01' WHERE id = 1;

-- 2) при изменении логина юзера, вставке логина длиной менее 3 символов уведомлять о длине 3 и более символов
DROP TRIGGER IF EXISTS photo_print_service.check_users_login_length_before_update;
USE photo_print_service;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` TRIGGER `check_users_login_length_before_update` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	IF LENGTH(NEW.login) < 3 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Login update trigger. Login length must be 3 and more symbols.';
	END IF;	
END$$
DELIMITER ;

UPDATE users SET login = 'D' WHERE id = 1;

