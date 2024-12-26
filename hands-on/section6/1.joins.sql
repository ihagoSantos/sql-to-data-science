/*
 * EX1: Utilize o comando LEFT JOIN para fazer join entre as tabelas
 * temp_tables.tabela_1 e temp_tables.tabela_2
 * */

select * from temp_tables.tabela_1;
select * from temp_tables.tabela_2;

select t1.cpf, t1."name", t2.state
from temp_tables.tabela_1 t1 
left join temp_tables.tabela_2 t2 on t1.cpf = t2.cpf 
;

/*
 * EX2: Utilize o comando INNER JOIN para fazer join entre as tabelas
 * temp_tables.tabela_1 e temp_tables.tabela_2
 * */
select t1.cpf, t1."name", t2.state
from temp_tables.tabela_1 t1 
inner join temp_tables.tabela_2 t2 on t1.cpf = t2.cpf 
;

/*
 * EX3: Utilize o comando RIGHT JOIN para fazer join entre as tabelas
 * temp_tables.tabela_1 e temp_tables.tabela_2
 * */
select t2.cpf, t1."name", t2.state
from temp_tables.tabela_1 t1 
right join temp_tables.tabela_2 t2 on t1.cpf = t2.cpf 
;

/*
 * EX4: Utilize o comando FULL JOIN para fazer join entre as tabelas
 * temp_tables.tabela_1 e temp_tables.tabela_2
 * */
select coalesce(t1.cpf, t2.cpf), t1.cpf as cpf_t1, t2.cpf as cpf_t2, t1."name", t2.state
from temp_tables.tabela_1 t1 
full join temp_tables.tabela_2 t2 on t1.cpf = t2.cpf 
;
