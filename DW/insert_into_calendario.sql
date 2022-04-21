-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-20 21:41:58.025

-- tables
-- Table: calendario
CREATE TABLE calendario (
    key_calendario uniqueidentifier  NOT NULL,
    data_completa date  NOT NULL,
    dia_semana varchar(10)  NOT NULL,
    dia_mes char(2)  NOT NULL,
    trimestre char(2)  NOT NULL,
    ano int  NOT NULL,
    CONSTRAINT data_completa PRIMARY KEY  (key_calendario)
);

-- Table: cliente
CREATE TABLE cliente (
    key_cliente uniqueidentifier  NOT NULL,
    id_cliente char(7)  NOT NULL,
    nome varchar(255)  NOT NULL,
    cep char(9)  NULL,
    genero varchar(10)  NULL,
    estado_civil varchar(10)  NULL,
    educacao varchar(30)  NULL,
    pontos_credito int  NULL,
    CONSTRAINT cliente_pk PRIMARY KEY  (key_cliente)
);

-- Table: loja
CREATE TABLE loja (
    key_loja uniqueidentifier  NOT NULL,
    id_loja varchar(3)  NOT NULL,
    tamanho int  NULL,
    cep char(9)  NULL,
    sistema_checkout varchar(30)  NULL,
    layout varchar(30)  NULL,
    regiao varchar(30)  NULL,
    CONSTRAINT loja_pk PRIMARY KEY  (key_loja)
);

-- Table: produto
CREATE TABLE produto (
    key_produto uniqueidentifier  NOT NULL,
    id_produto char(3)  NOT NULL,
    nome varchar(255)  NULL,
    preco money  NULL,
    categoria varchar(30)  NULL,
    fornecedor varchar(30)  NULL,
    CONSTRAINT produto_pk PRIMARY KEY  (key_produto)
);

-- Table: venda
CREATE TABLE venda (
    tid char(4)  NOT NULL,
    key_produto uniqueidentifier  NOT NULL,
    horario time(0)  NOT NULL,
    quantidade int  NOT NULL,
    key_calendario uniqueidentifier  NOT NULL,
    key_loja uniqueidentifier  NOT NULL,
    key_cliente uniqueidentifier  NOT NULL,
    CONSTRAINT venda_pk PRIMARY KEY  (tid,key_produto)
);

-- foreign keys
-- Reference: venda_calendario (table: venda)
ALTER TABLE venda ADD CONSTRAINT venda_calendario
    FOREIGN KEY (key_calendario)
    REFERENCES calendario (key_calendario);

-- Reference: venda_cliente (table: venda)
ALTER TABLE venda ADD CONSTRAINT venda_cliente
    FOREIGN KEY (key_cliente)
    REFERENCES cliente (key_cliente);

-- Reference: venda_loja (table: venda)
ALTER TABLE venda ADD CONSTRAINT venda_loja
    FOREIGN KEY (key_loja)
    REFERENCES loja (key_loja);

-- Reference: venda_produto (table: venda)
ALTER TABLE venda ADD CONSTRAINT venda_produto
    FOREIGN KEY (key_produto)
    REFERENCES produto (key_produto);

-- End of file.

