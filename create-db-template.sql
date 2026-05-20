DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE categoria (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    PRIMARY KEY (id)
);


CREATE TABLE produto (
    id INT AUTO_INCREMENT,
    nome VARCHAR(150),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT,
    categoria_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE produto2 (
id INT AUTO_INCREMENT,
nome VARCHAR(150),
categoria_id INT, PRIMARY KEY (id),
FOREIGN KEY (categoria_id) 
REFERENCES categoria(id) ON DELETE CASCADE
);

INSERT INTO categoria (nome, descricao)
values ('Salgado', 'É salgado'),
       ('Doce', 'É doce');

INSERT INTO produto(nome, descricao, preco, estoque, categoria_id)
values ('Farinha ', 'Farinha de Trigo', 5000, 15, 1);

select * from produto;
select * from produto2;

SELECT * FROM categoria;

UPDATE produto
set categoria_id = 1;
WHERE id = 1;


update categoria
set nome = 'Le Sal';

UPDATE categoria 
SET
nome = "Doce",
descricao = "Contrario de Salgado" 
WHERE id = 2;

UPDATE produto
SET categoria_id=2
WHERE nome LIKE'M%';

UPDATE produto
SET categoria_id = 3
WHERE preco >= 500;

UPDATE produto
set categoria_id = 6
where estoque > 0;

UPDATE produto
SET estoque = estoque + 30
WHERE id = 2;

UPDATE produto
SET
    nome = 'Notebook usado - Macbook',
    descricao = 'Macbook M1 Pro, 512 ssd, 16GB RAM Ddr5',
    estoque = 30,
    categoria_id = 8
WHERE id = 15;

SELECT * FROM produto

update produto
set nome = 'erro'
where id = 2 or id = 5;

UPDATE produto
SET nome = CASE
    when id THEN 'lego'
    when id THEN 'Celular flip'
    when id = 4 THEN 'Insider'
END
WHERE id IN(1,2,3);

SELECT * FROM produto;

update produto
set nome = 'PRODUTO GENÉRICO'
WHERE ID IN(1, 3, 5); 

DELETE from produto
where preco >= 400;

DELETE FROM produto 
where preco > 200 and id = 4; --or tbm pode utilizado

DELETE FROM produto;

ALTER TABLE produto
ADD COLUMN status CHAR(1)
DEFAULT 'A';

ALTER TABLE categoria
ADD COLUMN status CHAR(1)
DEFAULT 'A';

UPDATE produto
set status = 'I'
WHERE categoria_id = 3;


UPDATE categoria
set status = 'I'
WHERE id = 3;

SELECT nome AS NOME_PRODUTO, estoque AS QTD_ESTOQUE
from produto
where status = 'A' and id in(4,5,6,7,8,9);