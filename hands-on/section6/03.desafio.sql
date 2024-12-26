-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
select * from sales.funnel;
select * from sales.products p;

select p.brand, count(f.visit_page_date) as visitas
from sales.funnel f 
left join sales.products p 
	on f.product_id = p.product_id 
group by p.brand 
order by visitas desc 
;

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
select * from sales.funnel;
select * from sales.stores;

select s.store_name, count(f.visit_page_date) as visitas
from sales.funnel f 
left join sales.stores s 
	on f.store_id = s.store_id 
group by s.store_name
order by visitas desc
; 

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
select * from temp_tables.regions r;
select * from sales.customers c;

select
	reg.size,
	count(*) as contagem
from sales.customers as cus
left join temp_tables.regions as reg
	on lower(cus.city) = lower(reg.city)
	and lower(cus.state) = lower(reg.state)
group by reg.size
order by contagem desc
;
