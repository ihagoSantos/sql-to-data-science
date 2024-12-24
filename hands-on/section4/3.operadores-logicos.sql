-- EX1: Uso do comando BETWEEN
-- Selecione veículos que custam entre 100k e 200k na tabela products
select *
from sales.products p 
where price between 100000 and 200000
;


-- EX2: Uso do comando NOT
-- Selecione veículos que custam entre 100k e 200k na tabela products
select *
from sales.products p 
where price not between 100000 and 200000
;

-- EX3: Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
select *
from sales.products p 
where brand in ('HONDA', 'TOYOTA', 'RENAULT')
;

-- EX4: Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ana
select distinct first_name
from sales.customers c 
where first_name like 'ANA%'
;

-- EX5: Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'
select distinct first_name
from sales.customers c 
where first_name ilike 'ana%'


-- EX6: Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
select *
from temp_tables.regions r 
where population is null
;
