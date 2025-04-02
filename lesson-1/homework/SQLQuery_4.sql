CREATE TABLE category (
    category_id INT CONSTRAINT pk_category_id PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE item (
    item_id INT CONSTRAINT pk_item_id PRIMARY KEY,
    item_name VARCHAR(255),
    category_id INT CONSTRAINT fk_item_category_id FOREIGN KEY REFERENCES category(category_id)
);

ALTER TABLE item
DROP CONSTRAINT fk_item_category_id;

ALTER TABLE item
ADD CONSTRAINT fk_item_category_id FOREIGN KEY (category_id) REFERENCES category(category_id);