CREATE DATABASE IF NOT EXISTS gaia;
USE gaia;

-- USUARIO
CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45), -- just the basics
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    vitorias INT DEFAULT 0, -- 0 ideias de como vai atualizar isso mas boto fé q vai pra frente lesgo
    derrotas INT DEFAULT 0
);

-- PERSONAGEM
CREATE TABLE personagem (
    idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    poder VARCHAR(45),
    descricao TEXT,
    urlImg VARCHAR(255)
);

-- PERSONAGEM DO USUARIO
CREATE TABLE favorito (
    fkUsuario INT,
    fkPersonagem INT,
    PRIMARY KEY (fkUsuario,fkPersonagem),
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE tipo (
	idTipo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20),
    dano INT
);

-- ATAQUES
CREATE TABLE ataque (
    idAtaque INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
	fkTipo INT,
    fkPersonagem INT,
    FOREIGN KEY (fkTipo) REFERENCES tipo(idTipo),
    FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
    );

select * from usuario;