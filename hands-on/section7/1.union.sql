/*
 * EX1: União simples de duas tabelas
 * Una a tabela sales.products com a tabela temp_tables.products_2
 * */

select * from sales.products
union all -- Une todas as linhas
select * from temp_tables.products_2
;

select * from sales.products
union -- checa e caso tenha linha duplicada, adiciona apenas uma linha removendo a duplicada
select * from temp_tables.products_2 
;
