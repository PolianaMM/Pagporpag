-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE pagina;

USE pagina;

CREATE TABLE ler (
	idler INT PRIMARY KEY,
    leitura VARCHAR (50)
    );

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
    idade INT,
	email VARCHAR(50),
	senha VARCHAR(50),
    fkLer INT,
   foreign key (fkLer) references ler(idler)
);

select*from usuario;

INSERT INTO ler VALUES 
(1, 'Sim, já leio e amo!'),
(2, 'Não, mas não vejo a hora de começar!');

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300)
);
 SELECT 
            a.id AS idAviso,
            a.descricao,
            a.fk_usuario,
            u.id AS idUsuario,
            u.nome,
            u.email,
            u.senha
        FROM aviso a
            INNER JOIN usuario u
                ON a.fk_usuario = u.id
        WHERE a.descricao LIKE '${texto}';
/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */