DROP TABLE IF EXISTS product;

CREATE TABLE product (
    product_id INT CONSTRAINT uq_product_id UNIQUE,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

ALTER TABLE product
DROP CONSTRAINT uq_product_id;

ALTER TABLE product
ADD CONSTRAINT unique_product_id_name UNIQUE (product_id, product_name);