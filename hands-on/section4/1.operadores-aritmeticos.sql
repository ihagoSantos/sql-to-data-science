-- EX1: Criação de coluna calculada
-- Crie uma coluna contendo a idade do cliente da tabela sales.customers
select 
	email,
	birth_date,
	(current_date - birth_date) / 365 as client_age
from sales.customers c 
;

select 
	email,
	birth_date,
	(current_date - birth_date) / 365 as "client age" -- Aspas duplas para renomear colunas com espaços
from sales.customers c 

-- EX2: Utilização da coluna calculada nas queries
-- Liste os 10 clientes mais novos da tabela customers

select 
	email,
	birth_date,
	(current_date - birth_date) / 365 as "client age"
from sales.customers c 
order by "client age"
limit 10
;

-- EX3: Criação de coluna calculada com strings
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
select first_name || ' ' || last_name as nome_completo
from sales.customers c 
limit 10
;