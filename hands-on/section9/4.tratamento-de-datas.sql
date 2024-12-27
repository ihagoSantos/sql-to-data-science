/*
 * TIPOS
 * 
 * INTERVAL
 * DATE_TRUNC
 * EXTRACT
 * DATEDIFF
 * */

/*
 * EX1: Soma de datas usando INTERVAL
 * Calcule a data de hoje mais 10 unidades (dias, semanas, meses, horas)
 * */

select current_date + 10 -- a unidade default é dias

select (current_date + interval '10 weeks')::date; -- o resultado vem sempre em data e hora. É necessário fazer a conversão

select (current_date + interval '10 months')::date;

select current_date + interval '10 hours';

/*
 * EX2: Truncagem de datas usando o comando DATE_TRUNC
 * Calcule quantas visitas ocorreram por mês no site da empresa
 * */

select visit_page_date, count(*)
from sales.funnel f 
group by visit_page_date 
order by visit_page_date desc 
;

select 
	date_trunc('month', visit_page_date)::date as visit_page_month,
	count(*)
from sales.funnel f
group by visit_page_month
order by visit_page_month desc 
;

/*
 * EX3: Extração de unidades de uma data utilizando EXTRACT
 * Calcule qual é o dia da semana que mais recebe visitas ao site
 * */

select 
	'2022-01-30'::date,
	extract('dow' from '2022-01-30'::date) -- 0 é domingo
	
	
select 
	current_date,
	extract('dow' from current_date) -- 0 é domingo
	
select 
	extract('dow' from visit_page_date) as dia_da_semana,
	count(*)
from sales.funnel f 
group by dia_da_semana
order by dia_da_semana
;

/*
 * EX4: Diferença entre datas com o operador de subtração (-)
 * Calcule a diferença entre hoje e '2018-06-01', em dias, semanas, meses e anos.
 * */

select (current_date - '2018-06-01'); -- dias
select (current_date - '2018-06-01')/7; -- semanas
select (current_date - '2018-06-01')/30; -- meses
select (current_date - '2018-06-01')/365; -- anos

select datediff('weeks', '2018-06-01', current_date); -- comando não existe no postgreSql, mas existe em outros BDs