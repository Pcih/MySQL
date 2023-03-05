USE lesson_1;


/*
 * Создаём схуму показаную в ДЗ. 
 */
DROP TABLE IF EXISTS mobile_phones; -- Удаляем схуму если она существует
CREATE TABLE mobile_phones(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	product_name VARCHAR(20) NOT NULL,
	manufacturer VARCHAR(20) NOT NULL,
	product_count INT NOT NULL,
	price INT NOT NULL
);

-- Наполняем таблицу данными 
INSERT INTO mobile_phones (product_name, manufacturer, product_count, price)
VALUES
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT product_name, manufacturer, price 
FROM mobile_phones
WHERE product_count > 2; -- Если надо вывести 2 включительно то >=


-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT product_name, manufacturer, product_count, price
FROM mobile_phones
WHERE manufacturer = 'Samsung';

/*
 * 4. (по желанию)* С помощью регулярных выражений найти:
 *        4.1. Товары, в которых есть упоминание "Iphone"
 *        4.2. Товары, в которых есть упоминание "Samsung"
 *        4.3. Товары, в которых есть ЦИФРЫ
 *        4.4. Товары, в которых есть ЦИФРА "8"
 */


-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT product_name, manufacturer, product_count, price
FROM mobile_phones
WHERE product_name LIKE '%iPhone%';

-- 4.2. Товары, в которых есть упоминание "Samsung"
SELECT product_name, manufacturer, product_count, price
FROM mobile_phones
WHERE product_name OR  manufacturer LIKE '%Samsung%';

-- 4.3. Товары, в которых есть ЦИФРЫ
SELECT product_name, manufacturer, product_count, price
FROM mobile_phones
WHERE REGEXP_LIKE(product_name, '[[:digit:]]');

-- 4.4. Товары, в которых есть ЦИФРА "8"
SELECT product_name, manufacturer, product_count, price
FROM mobile_phones
WHERE product_name LIKE '%8%';

