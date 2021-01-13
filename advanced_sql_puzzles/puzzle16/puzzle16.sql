SELECT
    MIN(PlayerA, PlayerB) A,
    MAX(PlayerA, PlayerB) B,
    SUM(Score)
FROM
    players
GROUP BY
    A,
    B