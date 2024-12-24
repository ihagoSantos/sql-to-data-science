-- Para que serve?
-- Serve para filtrar linhas da seleção por uma coluna agrupada

/*
 * EX1: Seleção de filtros com HAVING
 * Calcule o número de clientes por estado filtrando apenas estados acima de 100 clientes
 * */
select 
	state,
	count(*)
from sales.customers c 
-- where count(*) > 100 -- gera erro pois funções agregadas não podem ser utilizadas no where
-- where state <> 'MG' -- pode filtrar por colunas que não são funções agregadas
group by state 
having count(*) > 100
--	and state <> 'MG' -- também pode filtrar outras colunas no HEAVING
;