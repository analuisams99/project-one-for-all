SELECT 
	u.nome AS usuario,
  COUNT(hr.musica_id) AS qtde_musicas_ouvidas,
  ROUND(SUM(m.duracao_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_reproducoes AS hr
ON u.usuario_id = hr.usuario_id
INNER JOIN SpotifyClone.musicas AS m
ON hr.musica_id = m.musica_id
GROUP BY u.nome
ORDER BY u.nome ASC;