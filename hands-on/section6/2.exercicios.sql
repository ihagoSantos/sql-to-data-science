/*
 * EX1: Identificar qual é o status profissional mais frequente nos cliente
 * que compraram automóveis no site
 * */

select c.professional_status, count(f.paid_date) as pagamentos
from sales.funnel f
left join sales.customers c on f.customer_id = c.customer_id 
group by c.professional_status 
order by pagamentos desc
;

/*
 * EX2: Identifique qual é o gênero mais frequente nos clientes que compraram
 * automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders
 * */

select * from temp_tables.ibge_genders ig;
select * from sales.funnel f;
select * from sales.customers c;

select ig.gender, count(f.paid_date)
from sales.funnel f 
left join sales.customers c 
	on f.customer_id = c.customer_id
left join temp_tables.ibge_genders ig 
	on lower(c.first_name) = ig.first_name
group by ig.gender
;

/*
 * EX3: Identifique de quais regiões são os clientes que mais visitam o site
 * Obs: Utilizar a tabela temp_tables.regions
 * */

select * from temp_tables.regions r ;
select * from sales.funnel f;
select * from sales.customers c;

select r.region, count(f.visit_page_date) as visitas
from sales.funnel f 
left join sales.customers c 
	on f.customer_id = c.customer_id 
left join temp_tables.regions r 
	on lower(c.city) = lower(r.city)
	and lower(c.state) = lower(r.state)
group by region
order by visitas desc
;

