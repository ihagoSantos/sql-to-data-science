/*
 * Conteúdo
 * 
 * Insersão de linhas
 * Atualização de linhas
 * Deleção de linhas
 * */


/*
 * EX1: Insersão de linhas
 * Insira o status 'desempregado(a)' e 'estagiário(a)' na temp_tables.profissoes
 * */

create table temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
);

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

select * from temp_tables.profissoes;

insert into temp_tables.profissoes
(professional_status, status_profissional)
values
('unemployed','desempregado(a)'),
('trainee','estagiário(a)')
;

/*
 * EX2: Atualização de linhas
 * Corrija a tradução de 'estagiário(a)' de 'trainee' para 'interne'
 * 
 * */

update temp_tables.profissoes
set professional_status = 'intern'
where status_profissional = 'estagiário(a)'
;

select * from temp_tables.profissoes;

/*
 * EX3: Deleção de linhas
 * Delete as linhas dos status 'desempregado(a)' e 'estagiário(a)' na temp_tables.profissoes
 * 
 * */

delete from temp_tables.profissoes
where status_profissional in ('desempregado(a)','estagiário(a)')
;
select * from temp_tables.profissoes;




