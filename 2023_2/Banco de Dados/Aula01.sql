/************************************************************************
Cidade (codcid, nome, uf)
Filial(codfilial, nome, endereço, codcid)
Empregado(codemp, nome, endereço, codcid,ct, rg, cpf, salário, codfilial)
Produto (codprod, descrição, preço, nomecategoria, descriçãocategoria)
Vende (codprod, codfilial)
************************************************************************/



CREATE TABLE cidades
(
    id INT not null PRIMARY KEY auto_increment,
    nome VARCHAR(50) NOT null,
    uf CHAR(2) not null
);

INSERT INTO cidades
values (1, 'torres','rs');
INSERT INTO cidades
values (2, 'sombrio','sc');
INSERT INTO cidades
values (3, 'sao paulo','sp');

CREATE TABLE filiais
(
    id INT not null PRIMARY KEY auto_increment,
    nome VARCHAR(50) NOT null,
    endereco VARCHAR(100) not null,
    id_cidade INT not null,
    CONSTRAINT filial_cidade
        FOREIGN KEY (id_cidade)
            REFERENCES cidades(id)
            on update cascade on delete restrict
);

INSERT INTO filiais
values (1, 'filial_torres','rua joao alfredo',1);
INSERT INTO filiais
values (2, 'filial_sombrio','rua alfredo jacone',2);
INSERT INTO filiais
values (3, 'filial_sp','rua cardoso rolim',3);

CREATE TABLE empregados
(
    id INT NOT NULL PRIMARY KEY auto_increment,
    nome VARCHAR(50) not null,
    cpf VARCHAR(14) not null  UNIQUE,
    rg VARCHAR(11) not null  UNIQUE,
    endereco VARCHAR(100) not null,
    salario DECIMAL(7,2) not null,
    id_cidade INT not null,
    id_filial INT not null,
    CONSTRAINT empregado_cidade
        FOREIGN KEY (id_cidade)
            REFERENCES cidades(id)
            on update cascade on delete restrict,
    CONSTRAINT empregado_filial
        FOREIGN KEY (id_filial)
            REFERENCES filiais(id)
            on update cascade on delete restrict
);

INSERT INTO empregados
values (1, 'joao','03292001001',1111111111,'joao das flores',550,1,1);
INSERT INTO empregados
values (2, 'paulo','03292001002',1111111112,'paulo das flores',600,2,2);
INSERT INTO empregados
values (3, 'pedro','03292001003',1111111113,'pedro das flores',400,3,3);

CREATE TABLE produtos
(
    id INT NOT null PRIMARY KEY auto_increment,
    descricao VARCHAR(100) NOT null,
    preco DECIMAL(7,2) NOT null,
    nome_categoria VARCHAR(100) NOT null,
    descricao_categoria VARCHAR(100)
);

INSERT INTO produtos
values (1, 'sabao',2.5,'limpeza','sabado neutro');
INSERT INTO produtos
values (2, 'sabonete',3.5,'higiene','sabonenete de aveia');
INSERT INTO produtos
values (3, 'aroz',5.3,'alimentos','aroz branco');

CREATE TABLE vendas
(
    id_produto INT not null,
    id_filial INT not null,
    CONSTRAINT vende_produto
        FOREIGN KEY (id_produto)
            REFERENCES produtos(id)
            on update cascade on delete restrict,
    CONSTRAINT filial_vende
        FOREIGN KEY (id_filial)
            REFERENCES filiais(id)
            on update cascade on delete restrict
);

INSERT INTO vendas
values(1,1);
INSERT INTO vendas
values(2,2);
INSERT INTO vendas
values(3,3);

-- SELECT * FROM produtos WHERE preco = (SELECT MAX(preco) FROM produtos) 
-- SELECT * FROM produtos WHERE preco = (SELECT MIN(preco) FROM produtos)
-- SELECT AVG(preco) FROM produtos


-- SELECT descricao FROM produtos 
-- INNER JOIN vendas ON vendas.id_produto = produtos.id
-- INNER JOIN filiais ON filiais.id = vendas.id_filial
-- WHERE filiais.id = 3