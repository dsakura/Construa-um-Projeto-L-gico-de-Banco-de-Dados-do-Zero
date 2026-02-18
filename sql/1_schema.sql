-- SQL DDL: Criação do Esquema (Traduzido)
CREATE DATABASE IF NOT EXISTS gerenciamento_rpg_mestre;
USE gerenciamento_rpg_mestre;

-- Tabela de Jogadores
CREATE TABLE Jogadores (
    idJogador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    Data_Cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Campanhas
CREATE TABLE Campanhas (
    idCampanha INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Sistema_Jogo VARCHAR(50),
    Data_Inicio DATE
);

-- Tabela de Personagens
CREATE TABLE Personagens (
    idPersonagem INT AUTO_INCREMENT PRIMARY KEY,
    idJogador INT NOT NULL,
    idCampanha INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Classe VARCHAR(50),
    Nivel INT DEFAULT 1,
    XP INT DEFAULT 0,
    CONSTRAINT fk_personagem_jogador FOREIGN KEY (idJogador) REFERENCES Jogadores(idJogador) ON DELETE CASCADE,
    CONSTRAINT fk_personagem_campanha FOREIGN KEY (idCampanha) REFERENCES Campanhas(idCampanha) ON DELETE CASCADE
);

-- Tabela de Itens
CREATE TABLE Itens (
    idItem INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Item VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Raridade ENUM('Comum', 'Incomum', 'Raro', 'Muito Raro', 'Lendário') DEFAULT 'Comum'
);

-- Tabela de Sessões
CREATE TABLE Sessoes (
    idSessao INT AUTO_INCREMENT PRIMARY KEY,
    idCampanha INT NOT NULL,
    Data_Sessao DATETIME NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Status ENUM('Agendada', 'Realizada', 'Cancelada') DEFAULT 'Agendada',
    CONSTRAINT fk_sessao_campanha FOREIGN KEY (idCampanha) REFERENCES Campanhas(idCampanha)
);

-- Tabela Pivot: Inventario (Personagem N:N Item)
CREATE TABLE Inventario (
    idPersonagem INT NOT NULL,
    idItem INT NOT NULL,
    Quantidade INT NOT NULL DEFAULT 1,
    PRIMARY KEY (idPersonagem, idItem),
    CONSTRAINT fk_inventario_personagem FOREIGN KEY (idPersonagem) REFERENCES Personagens(idPersonagem) ON DELETE CASCADE,
    CONSTRAINT fk_inventario_item FOREIGN KEY (idItem) REFERENCES Itens(idItem) ON DELETE CASCADE
);

-- Tabela Pivot: Log_Sessoes (Jogador N:N Sessão)
CREATE TABLE Log_Sessoes (
    idJogador INT NOT NULL,
    idSessao INT NOT NULL,
    Status_Pagamento ENUM('Pendente', 'Pago', 'Isento') DEFAULT 'Pendente',
    PRIMARY KEY (idJogador, idSessao),
    CONSTRAINT fk_log_jogador FOREIGN KEY (idJogador) REFERENCES Jogadores(idJogador),
    CONSTRAINT fk_log_sessao FOREIGN KEY (idSessao) REFERENCES Sessoes(idSessao)
);
