CREATE TABLE sales.products (
    product_id VARCHAR PRIMARY KEY,
    brand VARCHAR NOT NULL,
    model VARCHAR NOT NULL,
    model_year VARCHAR NOT NULL,
    price NUMERIC NOT NULL
);
