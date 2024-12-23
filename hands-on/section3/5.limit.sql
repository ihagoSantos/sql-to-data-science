-- EX1: Liste as 10 primeiras linhas da tabela funnel
select *
from sales.funnel
limit 10
;

-- EX2: Liste os 10 produtos mais caros da tabela products
select *
from sales.products
order by price desc
limit 10
;