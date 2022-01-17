SELECT 
	m.nome AS cancao,
    COUNT(hr.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico_reproducoes AS hr
ON m.musica_id = hr.musica_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;