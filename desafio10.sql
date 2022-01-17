SELECT 
	m.nome AS nome,
  COUNT(hr.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico_reproducoes AS hr
ON m.musica_id = hr.musica_id
INNER JOIN SpotifyClone.usuarios AS u
ON hr.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.planos AS pl
ON u.plano_id = pl.plano_id
WHERE pl.plano IN ('gratuito', 'pessoal')
GROUP BY m.nome
ORDER BY m.nome ASC;