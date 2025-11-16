-- ==========================================================
-- BANCO DE DADOS: VerSonhos
-- MySQL
-- ==========================================================
CREATE DATABASE VerSonhos;
USE VerSonhos;

-- ==========================================================
-- Tabela: Usuario
-- ==========================================================
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    nome_completo VARCHAR(150) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    termos_lgpd BOOLEAN NOT NULL DEFAULT FALSE,
    key_senha VARCHAR(255) UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Tabela: Empresa
-- ==========================================================
CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    fk_usuario_empresa INT NOT NULL,
    nome_fantasia VARCHAR(100),
    razao_social VARCHAR(150) NOT NULL UNIQUE,
    cnpj CHAR(14) NOT NULL UNIQUE,
    inscricao_estadual VARCHAR(50),
    cargo_empresa VARCHAR(100) NOT NULL,
    cep CHAR(8) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    setor_atuacao VARCHAR(100) NOT NULL,
    portfolio VARCHAR(255) NOT NULL,
    objetivo_cadastro VARCHAR(50) NOT NULL,
    FOREIGN KEY (fk_usuario_empresa) REFERENCES Usuario(id_usuario)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Tabela: Administrador
-- ==========================================================
CREATE TABLE Administrador (
    id_administrador INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Tabela: Agendamento
-- ==========================================================
CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    fk_usuario_agendamento INT NOT NULL,
    data_agendada DATE NOT NULL,
    status ENUM('PENDENTE', 'CONFIRMADO', 'CANCELADO') NOT NULL DEFAULT 'PENDENTE',
    horario TIME NOT NULL,
    qtde_pacientes INT NOT NULL DEFAULT 0,
    duracao_visita INT NOT NULL DEFAULT 60, 
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    observacoes TEXT,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    FOREIGN KEY (fk_usuario_agendamento) REFERENCES Usuario(id_usuario)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;