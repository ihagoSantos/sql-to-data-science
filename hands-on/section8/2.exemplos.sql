/*
 * EX1: Análise de recorrência dos leads
 * Calcule o volume de visitas por dia ao site separado por 1° visita e demais visitas
 * */

with primeira_visita as (
	select customer_id, min(visit_page_date) as visita_1
	from sales.funnel 
	group by customer_id
) 
select 	
	f.visit_page_date,
	(f.visit_page_date <> pv.visita_1) as lead_recorrente,
	count(*) 
from sales.funnel f 
left join primeira_visita as pv
	on f.customer_id = pv.customer_id
group by f.visit_page_date , lead_recorrente
order by f.visit_page_date desc, lead_recorrente
;

/*
 * EX2: Análise do preço versus o preço médio
 * 
 * Calcule, para cada visita ao site, quanto o preço de um veículo visitado pelo cliente
 * estava acima ou abaixo do preço médio dos veículos daquela marca
 * (levar em consideração o desconto dado no veículo)
 * */

with preco_medio as (
	select brand, avg(price) as preco_medio_da_marca
	from sales.products p 
	group by brand
)
select 
	f.visit_id,
	f.visit_page_date,
	p.brand,
	(p.price * (1+f.discount)) as preco_final,
	preco_medio.preco_medio_da_marca,
	((p.price * (1+f.discount)) - preco_medio.preco_medio_da_marca) as preco_vs_media
from sales.funnel f 
left join sales.products p 
	on f.product_id = p.product_id
left join preco_medio
	on p.brand = preco_medio.brand