/*
 * Conteúdo
 * 
 * Criação de tabela a partir de uma query
 * Criação de tabela a partir do zero
 * Deleção de tabelas
 * */

/*
 * EX1: Criação de tabela a partir de uma query
 * Crie uma tabela chamada customers_age com id e a idade dos clientes
 * Chame-a de temp_tables.customers_age
 * */

select 
	customer_id,
	datediff('years', birth_date, current_date) as idade_cliente
	into temp_tables.customers_age
from sales.customers c 
;

select * from temp_tables.customers_age;

/*
 * EX2: Criação a partir do zero
 * Crie uma tabela com a tradução dos status profissionais dos clientes.
 * Chame-a de temp_tables.profissoes
 * */

select distinct professional_status 
from sales.customers c 


create table temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
);


select * from temp_tables.profissoes;

insert into temp_tables.profissoes
(professional_status, status_profissional)
values
('freelancer','freelancer'),
('retired', 'aposentado'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessman', 'empresário(a)'),
('civil_servant', 'funcionário público'),
('student', 'estudante')
;

/*
 * EX3: Deleção de tabelas
 * Delete a tabela temp_tables.profissoes
 * */
drop table temp_tables.profissoes;

