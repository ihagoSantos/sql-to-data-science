-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads(#)

select 
	case 
		when ig.gender = 'male' then 'homens'
		when ig.gender = 'female' then 'mulheres'
	end as "gênero",
	count(*) as "leads (#)"
from sales.customers c 
left join temp_tables.ibge_genders ig 
	on lower(c.first_name) = lower(ig.first_name)
group by ig.gender 
;

-- (Query 2) Status profissional dos leads
-- Colunas: status profissional, leads (%)

select 
	case 
		when c.professional_status = 'freelancer' then 'freelancer'
		when c.professional_status = 'retired' then 'aposentado'
		when c.professional_status = 'clt' then 'clt'
		when c.professional_status = 'self_employed' then 'autônomo (a)'
		when c.professional_status = 'other' then 'outro'
		when c.professional_status = 'businessman' then 'empresário (a)'
		when c.professional_status = 'civil_servant' then 'funcionário (a) público(a)'
		when c.professional_status = 'student' then 'estudante'
	end as "status profissional",
	(count(*)::float) / (select count(*) from sales.customers c2) as "leads (%)"
from sales.customers c 
group by c.professional_status 
order by "leads (%)"
;

-- (Query 3) Faixa etária dos leads
-- Colunas: faixa etária, leads (%)

select 
	case 
		when datediff('years', birth_date, current_date) < 20 then '0-20'
		when datediff('years', birth_date, current_date) < 40 then '20-40'
		when datediff('years', birth_date, current_date) < 60 then '40-60'
		when datediff('years', birth_date, current_date) < 80 then '60-80'
		else '80+'
	end "faixa etária",
	count(*)::float / (select count(*) from sales.customers c2) as "leads (%)"
from sales.customers c 
group by "faixa etária"
order by "faixa etária" desc
;


-- (Query 4) Faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem

select 
	case 
		when income < 5000 then '0-5000'
		when income < 10000 then '5000-10000'
		when income < 15000 then '10000-15000'
		when income < 20000 then '15000-20000'
		else '20000+'
	end "faixa salarial",
	count(*)::float / (select count(*) from sales.customers c2) as "leads (%)",
	case 
		when income < 5000 then 1
		when income < 10000 then 2
		when income < 15000 then 3
		when income < 20000 then 4
		else 5
	end "ordem"
from sales.customers c 
group by "faixa salarial", "ordem"
order by "ordem"
;

-- (Query 5) Classificação dos veículos visitados
-- Colunas: classificação do veículo, veículos visitados (#)
-- Regra de negócio: Veículos novos tem até 2 anos e seminovos acima de 2 anos
with
	classificacao_veiculos as (
		select 
			f.visit_page_date,
			p.model_year,
			extract('year' from f.visit_page_date) - p.model_year::int as idade_veiculo,
			case
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 2 then 'novo'
				else 'seminovo'
			end as "classificação do veículo"
		from sales.funnel f 
		left join sales.products p 
			on f.product_id = p.product_id 
	)
select 
	"classificação do veículo",
	count(*) as "veículos visitados (#)"
from classificacao_veiculos
group by "classificação do veículo"
;


-- (Query 6) Idade dos veículos visitados
-- Colunas: Idade do veículo, veículos visitados (%), ordem

with
	faixa_de_idade_dos_veiculos as (
		select 
			f.visit_page_date,
			p.model_year,
			extract('year' from f.visit_page_date) - p.model_year::int as idade_veiculo,
			case
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 2 then 'até 2 anos'
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 4 then 'de 2 à 4 anos'
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 6 then 'de 4 à 6 anos'
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 8 then 'de 6 à 8 anos'
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 10 then 'de 8 à 10 anos'
				else 'acima de 10 anos'
			end as "idade do veículo",
			case
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 2 then 1
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 4 then 2
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 6 then 3
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 8 then 4
				when (extract('year' from f.visit_page_date) - p.model_year::int) <= 10 then 5
				else 6
			end as "ordem"
		from sales.funnel f 
		left join sales.products p 
			on f.product_id = p.product_id 
	)
select 
	"idade do veículo",
	count(*)::float / (select count(*) from sales.funnel) as "veículos visitados (%)",
	ordem
from faixa_de_idade_dos_veiculos
group by "idade do veículo","ordem"
;


-- (Query 7) Veículos mais visitados por marca
-- Colunas: brand, model, visitas (#)

select p.brand, p.model, count(*) as "visitas (#)"
from sales.funnel f 
left join sales.products p 
	on f.product_id = p.product_id 
group by p.brand, p.model
order by p.brand, p.model
;




