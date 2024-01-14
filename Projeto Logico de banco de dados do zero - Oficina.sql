CREATE DATABASE IF not exists Oficina;
USE Oficina;

DROP database Oficina;

-- VEICULO
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idRevisao INT,
    Placa CHAR(7) NOT NULL,
    CONSTRAINT Placa_idVeiculo UNIQUE (idVeiculo, Placa)
);

desc Veiculo;

-- CLIENTES
CREATE TABLE Clientes (
		idClientes INT auto_increment PRIMARY KEY,
        idVeiculo INT,
        constraint fk_Veiculo foreign key (idVeiculo) references Veiculo(idVeiculo)
        );
        
desc Clientes;

-- PESSOA FISICA
CREATE TABLE PessoaFisica (
		idPessoaFisica INT auto_increment primary key,
		Nome VARCHAR(45) NOT NULL,
        CPF CHAR(11) NOT NULL,
        Endereço VARCHAR(45),
        Contato CHAR(11)
        );
        
DESC PessoaFisica;

-- PESSOA JURIDICA
CREATE TABLE PessoaJuridica (
		idPessoaJuridica INT auto_increment PRIMARY KEY,
        RazãoSocial varchar(45) NOT NULL,
        CNPJ CHAR(15) NOT NULL,
        Endereço VARCHAR(45),
        Contato char(11),
        constraint unique_cnpj_PessoaJuridica UNIQUE (CNPJ)
        );
        
DESC PessoaJuridica;

-- CONSERTO
CREATE TABLE Conserto (
		idConserto INT auto_increment PRIMARY KEY,
        Descrição varchar (45) NOT NULL
        );
        
DESC Conserto;

-- REVISÃO
CREATE TABLE Revisão (
		idRevisão INT auto_increment PRIMARY KEY,
        Descrição varchar (45) NOT NULL
        );
        
DESC Revisão;

-- MECANICO
CREATE TABLE Mecanico (
		idMecanico INT auto_increment PRIMARY KEY,
        Nome varchar(45) NOT NULL,
        Endereço varchar(45) NOT NULL,
        Especialidade varchar(45) NOT NULL
        );
        
DESC Mecanico;

-- EQUIPE MECANICOS
CREATE TABLE EqpMecanicos(
		idEqpMecanicos INT auto_increment PRIMARY KEY
        );
        
DESC EqpMecanicos;

-- ORDEM DE SERVIÇO
CREATE TABLE OdServiço(
		idOdServiço INT auto_increment PRIMARY KEY,
        DataEmissão DATE,
        ValorServiço FLOAT NOT NULL,
        ValorPeça FLOAT NOT NULL,
        ValorTotal FLOAT NOT NULL,
        Status ENUM('AGUARDANDO', 'EM ANDAMENTO', 'CANCELADO'),
        DataConclusão DATE
        );
        
DESC OdServiço;

-- REFERENCIA DE PREÇOS
CREATE TABLE ReferenciaPreços(
		idReferenciaPreços INT auto_increment PRIMARY KEY,
        constraint fk_referencia_preços foreign key (idReferenciaPreços) references OdServiço(idOdServiço)
        );
        
desc ReferenciaPreços;

-- AUTORIZAÇÃO CLIENTE
CREATE TABLE Autorização(
		idAutorização INT auto_increment PRIMARY KEY,
        Autorizado BOOL DEFAULT FALSE,
        constraint fk_autorização_cliente foreign key (idAutorização) references Clientes(idClientes),
        constraint fk_autorização_veiculo foreign key (idAutorização) references Veiculo(idVeiculo),
        constraint fk_autorização_OdServiço foreign key (idAutorização) references OdServiço(idOdServiço)
        );
        
desc Autorização;

-- PEÇAS
CREATE TABLE Peças (
		idPeças INT auto_increment PRIMARY KEY,
        Descrição VARCHAR (45),
        Valor FLOAT NOT NULL
        );
        
DESC Peças;

-- OS PEÇAS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CREATE TABLE OsPeças(
	idOsPeças INT auto_increment PRIMARY KEY,
	CONSTRAINT fk_peças FOREIGN KEY (idOsPeças) REFERENCES Peças(idPeças),
    CONSTRAINT fk_os_peças FOREIGN KEY (idOsPeças) REFERENCES OdServiço(idOdServiço)
);

desc OsPeças;

-- SERVIÇOS
CREATE TABLE Serviços(
		idServiços INT auto_increment PRIMARY KEY,
        Descrição VARCHAR (45),
        Valor FLOAT NOT NULL
        );
        
DESC Serviços;

