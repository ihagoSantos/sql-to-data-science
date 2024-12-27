/*
 * TIPOS
 * 
 * LOWER()
 * UPPER()
 * TRIM()
 * REPLACE()
 * */

/*
 * EX1: Corrija o primeiro elemento das queries abaixo utilizando os comandos
 * de tratamento de texto para que o resultado seja sempre TRUE
 * */

select UPPER('São Paulo') = 'SÃO PAULO'

select lower('São Paulo') = 'são paulo'

select trim('SÃO PAULO       ') = 'SÃO PAULO'

select replace('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO' 