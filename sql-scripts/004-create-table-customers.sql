CREATE TABLE sales.customers (
    customer_id VARCHAR PRIMARY KEY,
    cpf VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    income NUMERIC NOT NULL,
    score NUMERIC NOT NULL,
    professional_status VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    mobile VARCHAR NOT NULL		
);
