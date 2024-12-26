-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

with visitas_por_cliente as (
	select customer_id, count(visit_page_date) as total_visitas
	from sales.funnel f 
	group by customer_id 
)
select c.email, visitas_por_cliente.total_visitas
from sales.customers c 
left join visitas_por_cliente 
	on c.customer_id = visitas_por_cliente.customer_id
;