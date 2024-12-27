/*
 * TIPOS DE CONVERSÃO
 * 
 * Operador ::
 * Função CAST
 * */

/*
 * EX1: Conversão de texto em data
 * Corrija a query abaixo usando o operador ::
 * */

select '2021-10-01'::date - '2021-02-01'::date as dias_restantes
;

select nome_coluna::date
from nome_tabela
;


/*
 * EX2: Conversão de texto em número
 * Corrija a query abaixo utilizando o operador ::
 * */

select '100'::numeric - '10'::numeric
;


/*
 * EX3: Conversão de número em texto
 * Corrija a query abaixo utilizando o operador ::
 * */

select replace(112122::text, '1', 'A')
;

/*
 * EX4: Conversão de texto em data
 * Corrija a query abaixo utilizando a função CAST
 * */

select CAST('2021-10-01' as date) - CAST('2021-02-01' as date)
;
