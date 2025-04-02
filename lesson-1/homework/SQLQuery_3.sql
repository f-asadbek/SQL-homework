DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT CONSTRAINT pk_order_id PRIMARY KEY,
    customer_name VARCHAR(255),
    order_date DATE
);

ALTER TABLE orders
DROP CONSTRAINT pk_order_id;

ALTER TABLE orders
ADD CONSTRAINT pk_order_id PRIMARY KEY (order_id);