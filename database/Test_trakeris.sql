USE food_expense_tracker;

SELECT *
FROM products
WHERE product_name LIKE '%cāļa%';

SELECT *
FROM products
WHERE product_name LIKE '%CĀĻ%';

SELECT *
FROM products
WHERE product_name LIKE '%cāļa%';

SELECT p.brand_name, p.product_name, c.category_name
FROM products p
JOIN categories c
ON p.id_categories = c.categories_id;

INSERT INTO receipts (purchase_date)
VALUES ('2026-05-07');

SELECT * FROM receipts;

INSERT INTO purchase_item
(quantity, unit, price, total_price, meals_count, days_count, id_products, id_receipts)
VALUES
(2, 'gab', 2.79, 5.58, NULL, NULL, 185, 1);

SELECT p.brand_name, p.product_name, pi.quantity, pi.unit, pi.price, pi.total_price
FROM purchase_item pi
JOIN products p
ON pi.id_products = p.products_id;