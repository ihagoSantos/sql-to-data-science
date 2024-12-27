/*
 * Conteúdo
 * 
 * Inserir Colunas
 * Atualizar Colunas
 * Excluir Colunas
 * */

/*
 * EX1: Inserir Colunas
 * Insira uma coluna na tabela sales.customers com a idade do cliente
 * */

select * from sales.customers c ;

alter table sales.customers 
add customer_age int
;

update sales.customers 
set customer_age = datediff('years', birth_date, current_date)
where true;


/*
 * EX2: Alteração do tipo da coluna
 * Altere o tipo da coluna customer_age de inteiro para varchar
 * */
alter table sales.customers 
alter column customer_age type varchar
;
select * from sales.customers c ;


/*
 * EX3: Alteração do nome da coluna
 * Altere o nome da coluna "customer_age" para "age"
 * */

alter table sales.customers 
rename column customer_age to age
;
select * from sales.customers c ;

/*
 * EX4: Deleção da coluna
 * Delete a coluna "age"
 * */

alter table sales.customers 
drop column age
;

select * from sales.customers c ;






