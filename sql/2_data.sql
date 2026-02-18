-- SQL DML: População de Dados (Traduzido)
USE gerenciamento_rpg_mestre;

-- Inserindo Jogadores
INSERT INTO Jogadores (Nome, Email, Telefone) VALUES 
('Arthur Morgan', 'arthur@outlaws.com', '11988887777'),
('Sadie Adler', 'sadie@bounty.com', '11977776666'),
('John Marston', 'john@ranch.com', '11966665555'),
('Charles Smith', 'charles@tracker.com', '11955554444'),
('Dutch van der Linde', 'dutch@plan.com', '11944443333');

-- Inserindo Campanhas
INSERT INTO Campanhas (Titulo, Descricao, Sistema_Jogo, Data_Inicio) VALUES 
('O Mistério de Ravenloft', 'Campanha de horror gótico em Barovia.', 'D&D 5e', '2025-01-10'),
('Fronteiras de Wildemount', 'Aventura política em Exandria.', 'D&D 5e', '2025-02-15');

-- Inserindo Personagens
INSERT INTO Personagens (idJogador, idCampanha, Nome, Classe, Nivel, XP) VALUES 
(1, 1, 'Morgan o Bravo', 'Paladino', 5, 6500),
(2, 1, 'Sadie a Feroz', 'Ranger', 5, 6200),
(3, 2, 'Jim Milton', 'Guerreiro', 3, 2700),
(4, 2, 'Olho de Águia', 'Monge', 3, 2800),
(5, 1, 'Sonhador do Taiti', 'Bardo', 5, 6000);

-- Inserindo Itens
INSERT INTO Itens (Nome_Item, Descricao, Raridade) VALUES 
('Espada Longa +1', 'Uma espada finamente forjada.', 'Incomum'),
('Poção de Cura', 'Recupera 2d4+2 PV.', 'Comum'),
('Anel de Proteção', 'Aumenta CA e testes de resistência.', 'Raro'),
('Cajado de Fogo', 'Permite lançar bolas de fogo.', 'Muito Raro'),
('Manto da Invisibilidade', 'Torna o usuário invisível.', 'Lendário'),
('Escudo de Adamante', 'Anula acertos críticos.', 'Incomum'),
('Pergaminho de Voo', 'Uso único da magia Voo.', 'Comum'),
('Botas de Velocidade', 'Dobra o deslocamento.', 'Raro'),
('Amuleto de Saúde', 'Define Constituição para 19.', 'Raro'),
('Bolsa de Carga', 'Espaço dimensional para itens.', 'Incomum');

-- Distribuindo Itens (Inventario)
INSERT INTO Inventario (idPersonagem, idItem, Quantidade) VALUES 
(1, 1, 1), (1, 2, 3), (1, 6, 1),
(2, 8, 1), (2, 2, 2),
(3, 10, 1), (3, 2, 1),
(4, 9, 1), (4, 7, 2),
(5, 4, 1), (5, 3, 1);

-- Sessões e Presenças
INSERT INTO Sessoes (idCampanha, Data_Sessao, Preco, Status) VALUES 
(1, '2025-01-15 20:00:00', 50.00, 'Realizada'),
(1, '2025-01-22 20:00:00', 50.00, 'Realizada'),
(1, '2025-01-29 20:00:00', 55.00, 'Realizada'),
(1, '2025-02-05 20:00:00', 55.00, 'Realizada'),
(2, '2025-02-20 19:00:00', 40.00, 'Agendada');

INSERT INTO Log_Sessoes (idJogador, idSessao, Status_Pagamento) VALUES 
(1, 1, 'Pago'), (2, 1, 'Pago'), (5, 1, 'Pago'),
(1, 2, 'Pago'), (2, 2, 'Pago'), (5, 2, 'Pago'),
(1, 3, 'Pago'), (2, 3, 'Pago'), (5, 3, 'Pago'),
(1, 4, 'Pago'), (2, 4, 'Pago'), (5, 4, 'Pago');
