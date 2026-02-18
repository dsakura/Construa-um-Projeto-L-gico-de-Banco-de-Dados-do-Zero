-- SQL DQL: Consultas Analíticas (Traduzido)
USE gerenciamento_rpg_mestre;

-- 1. Relatório de Inventário por Jogador e Personagem (JOIN + GROUP BY)
SELECT 
    j.Nome AS Jogador, 
    p.Nome AS Personagem, 
    SUM(inv.Quantidade) AS Total_Itens
FROM Jogadores j
JOIN Personagens p ON j.idJogador = p.idJogador
LEFT JOIN Inventario inv ON p.idPersonagem = inv.idPersonagem
GROUP BY j.idJogador, p.idPersonagem
ORDER BY Total_Itens DESC;

-- 2. Campanhas com mais de 3 sessões REALIZADAS (HAVING)
SELECT 
    c.Titulo AS Campanha, 
    COUNT(s.idSessao) AS Total_Sessoes_Realizadas
FROM Campanhas c
JOIN Sessoes s ON c.idCampanha = s.idCampanha
WHERE s.Status = 'Realizada'
GROUP BY c.idCampanha
HAVING Total_Sessoes_Realizadas > 3;

-- 3. Faturamento Bruto por Sessões Pagas
SELECT 
    SUM(s.Preco) AS Faturamento_Total
FROM Sessoes s
JOIN Log_Sessoes sl ON s.idSessao = sl.idSessao
WHERE s.Status = 'Realizada' 
  AND sl.Status_Pagamento = 'Pago';

-- 4. Relatório Financeiro: Campanhas Lucrativas (Atributo Derivado)
SELECT 
    c.Titulo AS Nome_Campanha,
    c.Sistema_Jogo AS Sistema,
    COUNT(s.idSessao) AS Total_Sessoes,
    SUM(s.Preco) AS Lucro_Bruto  -- Atributo Derivado
FROM 
    Campanhas c
INNER JOIN 
    Sessoes s ON c.idCampanha = s.idCampanha
WHERE 
    s.Status = 'Realizada'
GROUP BY 
    c.idCampanha
ORDER BY 
    Lucro_Bruto DESC;

-- 5. Análise de Inadimplência e Engajamento (Junções Múltiplas)
SELECT 
    j.Nome AS Nome_Jogador,
    j.Email,
    c.Titulo AS Campanha,
    COUNT(sl.idSessao) AS Sessoes_Pendentes
FROM 
    Jogadores j
INNER JOIN 
    Log_Sessoes sl ON j.idJogador = sl.idJogador
INNER JOIN 
    Sessoes s ON sl.idSessao = s.idSessao
INNER JOIN 
    Campanhas c ON s.idCampanha = c.idCampanha
WHERE 
    sl.Status_Pagamento = 'Pendente' 
    AND s.Status = 'Realizada'
GROUP BY 
    j.idJogador, c.idCampanha
HAVING 
    Sessoes_Pendentes >= 1
ORDER BY 
    j.Nome ASC;
