CREATE TABLE customer (
    customer_id INT CONSTRAINT pk_customer_id PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255) CONSTRAINT df_city DEFAULT 'Unknown'
);

ALTER TABLE customer
DROP CONSTRAINT df_city;

ALTER TABLE customer
ADD CONSTRAINT df_city DEFAULT 'Unknown' FOR city;