CREATE DATABASE IF NOT EXISTS food_expense_tracker
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE food_expense_tracker;

CREATE TABLE IF NOT EXISTS categories (
categories_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS receipts (
receipts_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
purchase_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS products (
products_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(100) NULL,
product_name VARCHAR(150) NOT NULL,
id_categories INT NOT NULL,
CONSTRAINT unique_brand_product 
UNIQUE (brand_name, product_name),
CONSTRAINT products_categories
	FOREIGN KEY (id_categories)
	REFERENCES categories (categories_id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS purchase_item (
purchase_item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
quantity DECIMAL(10,2) NOT NULL,
unit VARCHAR(20) NOT NULL,
price DECIMAL(10,2) NOT NULL,
total_price DECIMAL(10,2) NOT NULL,
meals_count INT NULL,
days_count INT NULL,
id_products INT NOT NULL,
id_receipts INT NOT NULL,
CONSTRAINT purchase_item_products
	FOREIGN KEY (id_products)
	REFERENCES products (products_id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
CONSTRAINT purchase_item_receipts
	FOREIGN KEY (id_receipts)
	REFERENCES receipts (receipts_id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
) ENGINE=InnoDB;

INSERT INTO categories (category_name)
VALUES ('Brokastis'), ('Vakariņas'), ('Ūdens'), ('Proteīns'), ('Saldumi'), ('Čipši'), ('Kafija'), ('Cafe'), ('Citi');

SELECT * FROM categories;

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Ķekava', 'Cāļa pusspārni lieliskie', 2),
('Ķekava', 'Cāļa pusspārni gardie', 2);

SELECT * FROM products;

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Ķekava', 'Cāļa šķiņķi gardā jogurta marinādē', 2),
('Rimi', 'Šķiņķi grieķu marinādē', 2),
('Ķekava', 'Cāļa pusspārnu vidusdaļas gaileņu marinādē', 2),
('Ķekava', 'Cāļa šķiņķi gardā lauku marinādē atkauloti', 2),
('Rīgas Miesnieks', 'Cāļa šašliks trīs sieru marinādē', 2),
('Nākotne', 'Cāļa gaļa tomātu, ķiploku mērcē', 2),
('Lido', 'Cāļa gaļa krējuma, sīpolu marinādē', 2),
('Bauska', 'Marinēti cāļa filejas gab. Cream marinādē', 2),
('Rimi', 'Cāļa filejas šašliks plūmju marinādē', 2),
('Lido', 'Cāļa gaļa maigajā majonēzes marinādē', 2),
('Rimi', 'Cāļu pusspārni Teriyaki marinādē', 2),
('Rīgas Miesnieks', 'Cāļa fileja Cēzara marinādē', 2),
('Rīgas Miesnieks', 'Cāļu gaļa trīs sieru marinādē', 2),
('Rimi', 'Broileru mazās filejas maigā marinādē', 2),
('Rimi', 'Cāļa fileja zaļumnieku marinādē', 2),
('Lido', 'Cāļa pusspārniņi Lido kimči marinādē', 2),
('Rimi', 'Cāļu šķiņķu šašliks kebaba marinādē', 2),
('Rimi', 'Cāļa šķiņķu šašliks krējuma marinādē', 2),
('Rimi', 'Cāļu mazās filejas', 2),
('Ķekava', 'Cāļa stilbi', 2),
('Ķekava', 'Cāļu stilbi bez locītavas', 2),
('Rimi', 'Cāļa krūtiņas fileja BIO', 2),
('Rimi', 'Cāļu krūtiņas filejas', 2),
('Rimi', 'Cāļa stilbi', 2),
('Rimi', 'Cāļu šķiņķi', 2),
('Rimi', 'Cūkgaļas karbonāde bez kaula šķēlēs', 2),
('Rimi', 'Liellopa plānās filejas steiks', 2),
('Rimi', 'Liellopa antrekota steiks', 2),
('Rimi', 'Liellopa rumpsteiks', 2),
('Rimi', 'Liellopa gaļas lāpstiņa bez kaula', 2),
('Rimi', 'Atlantijas laša fileja', 2),
('Rimi', 'Varavīksnes foreles filejas', 2),
('Rimi', 'Garneles ar čaulu 16/20 nevārītas saldētas', 2),
('Rimi', 'Garneles vārītas 31/40 mizotas ar asti ātri sasaldētas', 2),
('Zigmas', 'Mintaja filejas porcijas, saldētas', 2),
('Viči', 'Zivju filejas porcijas panējumā', 2);