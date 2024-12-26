/*
 * PARA QUE SERVE?
 * Servem para consultar dados de outras consultas
 * 
 * TIPOS:
 * Subquery no WHERE
 * Subquery no WITH
 * Subquery no FROM
 * Subquery no SELECT
 * 
 */

/*
 * EX1: Subquery no WHERE
 * Informe qual é o veículo mais barato da tabela products
 * */

select *
from sales.products p 
where price = (select min(price) from sales.products)
;

/*
 * Subquery com WITH
 * Calcule a idade média dos clientes por status profissional
 * */

with alguma_tabela as ( -- cria uma tabela temporária com o resultado da subquery
	select 
		professional_status,
		(current_date - birth_date)/365 as idade
	from sales.customers c
)
select 
	professional_status,
	avg(idade) as idade_media
from alguma_tabela
group by professional_status
;

/*
 * Subquery no FROM
 * Calcule a idade média dos clientes por status profissional
 * */


select 
	professional_status,
	avg(idade) as idade_media
from ( -- é melhor utilizar as subqueries com 'with' pois elas são mais legíveis do que no 'from'
	select 
		professional_status,
		(current_date - birth_date)/365 as idade
	from sales.customers c
) as alguma_tabela
group by professional_status
;

/*
 * EX4: Subquery no SELECT
 * Na tabela sales.funnel crie uma coluna que informe o n° de visitas acumuladas
 * que a loja visitada recebeu até o momento
 * */

select 
	f.visit_id,
	f.visit_page_date,
	s.store_name,
	(
		select count(*)
		from sales.funnel f2 
		where f2.visit_page_date <= f.visit_page_date 
			and f2.store_id = f.store_id
	)
from sales.funnel f 
left join sales.stores s 
	on f.store_id = s.store_id 
order by s.store_name, f.visit_page_date 
;
