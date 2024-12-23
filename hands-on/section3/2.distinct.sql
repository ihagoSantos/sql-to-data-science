-- Para que serve?
-- Serve para remover linhas duplicadas e mostrar apenas linhas distintas
-- Muito usado na etapa de exploração das bases

-- EX1: Liste as marcas de carro que costam na tabela products
select brand
from sales.products -- 333 linhas
;

-- EX2: Liste as marcas de carro distintas que costam na tabela products
select distinct brand
from sales.products -- 40 linhas
;

-- EX3: Liste as marcas e anos de modelo distintos que constam na tabela products
-- Lista combinações distintas entre marcas e anos de modelo
select distinct brand, model_year
from sales.products
;