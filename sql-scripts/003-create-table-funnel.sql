CREATE TABLE sales.funnel (
    visit_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR NOT NULL,
    store_id VARCHAR NOT NULL,
    product_id VARCHAR NOT NULL,
    visit_page_date DATE,
    add_to_cart_date DATE,
    start_checkout_date DATE,
    finish_checkout_date DATE,
    paid_date DATE,
    discount NUMERIC
);