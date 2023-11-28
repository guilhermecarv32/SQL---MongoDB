DROP DATABASE IF EXISTS mongo;
CREATE DATABASE mongo;
USE mongo;

/* Lógico_1: */

CREATE TABLE Funcionario (
    Nome VARCHAR (30),
    CPF VARCHAR (14) PRIMARY KEY,
    Telefone VARCHAR (12),
    Endereço VARCHAR (100),
    Sexo CHAR,
    DataNasc VARCHAR (10)
);

CREATE TABLE Financeiro (
    Valor VARCHAR(7),
    Data VARCHAR(10),
    cpfFuncionario VARCHAR(14),
    Acesso VARCHAR(15)
);

CREATE TABLE Produto (
    Nome VARCHAR(30) PRIMARY KEY,
    Quantidade INTEGER(3),
    DataChegada VARCHAR(10),
    DataVencimento VARCHAR(10),
    Descricao VARCHAR(50),
    Preco VARCHAR(6),
    Categoria VARCHAR(30)
);

CREATE TABLE Estoque (
    NomeProduto VARCHAR(30),
    CategoriaProduto VARCHAR(30),
    Acesso VARCHAR(15)
);

CREATE TABLE Refeicao (
    Tipo VARCHAR (30),
    NomeProduto VARCHAR(30)
);

CREATE TABLE Funcao (
    Nome VARCHAR(30) PRIMARY KEY,
    cpfFuncionario VARCHAR(14),
    Acesso VARCHAR(15)
);

CREATE TABLE Fornecedores (
    Nome VARCHAR(30) PRIMARY KEY,
    Telefone VARCHAR(12),
    Logradouro VARCHAR(100),
    CNPJ VARCHAR(15),
    NomeProduto VARCHAR(30),
    CategoriaProduto VARCHAR(30)
);

//erros

ALTER TABLE Financeiro ADD CONSTRAINT FK_Financeiro_1
    FOREIGN KEY (cpfFuncionario, Acesso)
    REFERENCES Funcao (cpfFuncionario, Acesso);
 
ALTER TABLE Estoque ADD CONSTRAINT FK_Estoque_1
    FOREIGN KEY (NomeProduto, CategoriaProduto, Acesso)
    REFERENCES Produto(Nome, Categoria);
    
ALTER TABLE Estoque ADD CONSTRAINT FK_Estoque_Funcao
    FOREIGN KEY (Acesso)
    REFERENCES Funcao(Acesso);
 
ALTER TABLE Refeicao ADD CONSTRAINT FK_Refeicao_1
    FOREIGN KEY (NomeProduto)
    REFERENCES Estoque (NomeProduto);
 
ALTER TABLE Funcao ADD CONSTRAINT FK_Funcao_2
    FOREIGN KEY (cpfFuncionario)
    REFERENCES Funcionario(CPF);
 
ALTER TABLE Fornecedores ADD CONSTRAINT FK_Fornecedores_2
    FOREIGN KEY (NomeProduto, CategoriaProduto)
    REFERENCES Produto(Nome, Categoria);
