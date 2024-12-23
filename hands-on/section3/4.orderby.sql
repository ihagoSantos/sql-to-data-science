-- EX1: Liste produtos da tabela products na ordem crescente com base no preço
select *
from sales.products
order by price

-- EX2: Liste os estados distintos da tabela customers na ordem crescente
select distinct state
from sales.customers
order by state
;