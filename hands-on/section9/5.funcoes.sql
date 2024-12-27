/*
 * PARA QUE SERVEM
 * 
 * Servem para criar comandos personalizados de scripts usados recorrentemente
 * 
 * */

/*
 * EX1: Crie uma função chamada DATEDIFF para calcular a diferença entre
 * duas datas em dias, semanas, meses e anos
 * */

select (current_date - '2018-06-01'); -- dias
select (current_date - '2018-06-01')/7; -- semanas
select (current_date - '2018-06-01')/30; -- meses
select (current_date - '2018-06-01')/365; -- anos

select datediff('weeks', '2018-06-01', current_date); -- comando não existe no postgreSql, mas existe em outros BDs

/*
 * Criação da função
 * */
create function datediff(unidade varchar, data_inicial date, data_final date)
returns integer
language sql
as
$$
select 
	case 
		when unidade in ('d', 'day', 'days') then (data_final - data_inicial)
		when unidade in ('w', 'week', 'weeks') then (data_final - data_inicial)/7
		when unidade in ('m', 'month', 'months') then (data_final - data_inicial)/30
		when unidade in ('y', 'year', 'years') then (data_final - data_inicial)/365
	end as diferenca
$$
;


select datediff('day', '2018-06-01', current_date);
select datediff('w', '2018-06-01', current_date);
select datediff('m', '2018-06-01', current_date);
select datediff('years', '2018-06-01', current_date);


/*
 * EX2: Delete a função DATEDIFF criada no exercício anterior
 * */

drop function datediff;