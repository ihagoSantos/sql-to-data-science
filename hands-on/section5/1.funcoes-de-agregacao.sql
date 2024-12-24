/*
 * EX1: Contagem de todas as linhas de uma tabela
 * Conte todas as visitas realizadas no site da empresa fictícia
 * */ 

select count(*)
from sales.funnel f 
;

/*
 * EX2: Contagem de linhas de uma coluna
 * Conte todos os pagamentos registrados na tabela sales.funnel
 * */
select count(paid_date) -- não conta os dados nulos
from sales.funnel f 
;

/*
 * EX3: Contagem distintas de uma coluna
 * Conte todos os produtos distintos visitados em jan/21
 * */
select count(distinct product_id)
from sales.funnel f 
where visit_page_date between '2021-01-01' and '2021-01-31'
;

/**
 * EX4: Calcule o preço mínimo, máximo e médio dos produtos da tabela products
 */

select min(price) as "preço mínimo", max(price) as "preço máximo", avg(price) as "preço médio"
from sales.products p 
;

/**
 * EX5: Qual é o veículo mais caro da tabela sales.products
 * */
select max(price)
from sales.products p 
;

select *
from sales.products p 
where price = (
	select max(price)
	from sales.products
)
;