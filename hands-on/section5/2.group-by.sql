/*
 * EX1: Contagem agrupada de uma coluna
 * Calcule o n° de clientes da tabela customers por estado
 * */

select state, count(*) as "total customers"
from sales.customers c 
group by state 
order by "total customers" desc
;

/*
 * EX2: Contagem agrupada de várias colunas
 * Calcule o n° de clientes da tabela customers por estado e status proficional
 * */

select state, professional_status, count(*) as "total_customers"
from sales.customers c 
group by state, professional_status -- group by 1, 2 -- agrupado pela coluna 1 e pela coluna 2
order by state, total_customers desc
;

/*
 * EX3: Seleção de valores distintos
 * Selecione os estados distintos da tabela customers utilizando o group by
 * */
select distinct state
from sales.customers c 
;

select state
from sales.customers c 
group by state
;