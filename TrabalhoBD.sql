DROP DATABASE IF EXISTS mongo;
CREATE DATABASE mongo;
USE mongo;

CREATE TABLE Funcionario 
( 
 CPF VARCHAR(14) PRIMARY KEY,  
 Sexo CHAR(1),  
 Endereco VARCHAR(100),  
 DataNascimento VARCHAR(10),  
 Telefone VARCHAR(12),  
 Nome VARCHAR(50)
); 

CREATE TABLE Financeiro 
( 
 Valor FLOAT,  
 Data VARCHAR(10),  
 cpfFuncionario VARCHAR(14)  
); 

CREATE TABLE Produto 
( 
 Preco FLOAT,  
 Descricao VARCHAR(50),  
 Categoria VARCHAR(20),  
 DataChegada VARCHAR(10),  
 Quantidade INT,  
 DataVencimento VARCHAR(10),  
 Nome VARCHAR(50) PRIMARY KEY,  
 NomeFornecedor VARCHAR(50)  
); 

CREATE TABLE Estoque 
( 
 CategoriaProduto VARCHAR(20),  
 NomeProduto VARCHAR(20),  
 cpfFuncionario VARCHAR(14)
); 

CREATE TABLE Refeicao 
( 
 Tipo VARCHAR(20),  
 NomeProduto VARCHAR(20)  
); 

CREATE TABLE Funcao 
( 
 cpfFuncionario VARCHAR(14),  
 Nome VARCHAR(50) PRIMARY KEY  
); 

CREATE TABLE Fornecedor 
( 
 CNPJ VARCHAR(15) PRIMARY KEY,  
 Nome VARCHAR(50),  
 Logradouro VARCHAR(100),  
 Telefone VARCHAR(10),  
 NomeProduto VARCHAR(20),  
 CategoriaProduto VARCHAR(20)  
); 

ALTER TABLE Financeiro ADD FOREIGN KEY(cpfFuncionario) REFERENCES Funcionario (CPF);
ALTER TABLE Estoque ADD FOREIGN KEY(NomeProduto) REFERENCES Produto (Nome);
ALTER TABLE Estoque ADD FOREIGN KEY(cpfFuncionario) REFERENCES Funcionario (CPF);
ALTER TABLE Refeicao ADD FOREIGN KEY(NomeProduto) REFERENCES Produto (Nome);
ALTER TABLE Funcao ADD FOREIGN KEY(cpfFuncionario) REFERENCES Funcionario (CPF);
ALTER TABLE Fornecedor ADD FOREIGN KEY(NomeProduto) REFERENCES Produto (Nome);
