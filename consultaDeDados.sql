CREATE database estoqueComercial;
use estoqueComercial;

Create table itensEstoque(
    idItem int not null auto_increment,
    descricaoItem varchar(200),
    setorItem varchar(200),
    precoVendaItem decimal (9,2),
    estoqueItem int,
    primary key(idItem)
);

insert into itensEstoque(descricaoItem, setorItem, precoVendaItem, estoqueItem) VALUES
('Suco de Laranja', 'Bebidas', 7.50, 250),
('Macarrão 1kg', 'Alimentos', 5.20, 180),
('Sabão em pó', 'Limpeza', 12.90, 90),
('Café Torrado', 'Alimentos', 15.80, 120),
('Iogurte Natural', 'Laticínios', 4.30, 350),
('Biscoito Integral', NULL, 3.90, 210),
('Molho de Tomate', 'Alimentos', 2.80, 500);

DESCRIBE itensEstoque;

SELECT * FROM itensEstoque
where precoVendaItem >= 10 or estoqueItem >= 20;

SELECT * FROM itensEstoque
where(setorItem = 'Limpeza' OR setorItem = 'Alimentos') and precoVendaItem >= 10;

--retorna tudo menos limpeza ou alimentos
SELECT * FROM itensEstoque
WHERE not(setorItem = 'Limpeza' or setorItem = 'Alimentos');

select * from itensEstoque
where setorItem = 'Alimentos' and not estoqueItem in(100, 200, 250, 300, 350, 500);

select * from itensEstoque
where setorItem = 'Alimentos' or not estoqueItem in(100, 200, 250, 300, 350, 500);

select * from itensEstoque
where not (setorItem = 'Alimentos');

select descricaoItem as nomeProduto
from itensEstoque
where precoVendaItem
BETWEEN 5 AND 10;

select * from itensEstoque
where precoVendaItem
BETWEEN 2.80 AND 7.70;

SELECT * FROM itensEstoque
where estoqueItem BETWEEN 100 and 200;

SELECT * from itensEstoque
WHERE idItem BETWEEN 1 and 4;

SELECT descricaoItem from itensEstoque
where setorItem is null;

SELECT descricaoItem, setorItem, precoVendaItem
from itensEstoque
where setorItem <> 'Alimentos'
or setorItem IS NULL;

select descricaoItem as descricao, precoVendaItem as preco
from itensEstoque;

select descricaoItem descricao, precoVendaItem preco
from itensEstoque;