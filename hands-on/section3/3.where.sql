-- EX1: Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
select email, state
from sales.customers
where state = 'SC'
;

-- EX2: Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina ou no Mato Grosso do Sul
select email, state
from sales.customers
where state = 'SC' or state = 'MS'
;

-- EX3: Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou no Mato Grosso do Sul e que tem mais de 30 anos
select email, state, birth_date
from sales.customers
where (state = 'SC' or state = 'MS') and birth_date < '1991-12-28'
;

select email, state, birth_date
from sales.customers
where (state = 'SC' or state = 'MS') and birth_date < '19911228'
;