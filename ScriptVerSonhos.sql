-- ==========================================================
-- BANCO DE DADOS: VerSonhos
-- MySQL
-- ==========================================================

-- ==========================================================
-- Tabela: Empresa
-- ==========================================================
CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    inscricao_estadual VARCHAR(20),
    email VARCHAR(255),
    telefone VARCHAR(20),
    cep VARCHAR(10),
    endereco VARCHAR(255),
    numero VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'confirmado', 'negado', 'expirado') DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Tabela: Administrador
-- ==========================================================
CREATE TABLE Administrador (
    id_administrador INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Tabela: Agendamento
-- ==========================================================
CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_agendada DATETIME NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDENTE', 'CONFIRMADO', 'CANCELADO') DEFAULT 'PENDENTE',
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;