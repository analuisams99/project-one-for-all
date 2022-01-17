SELECT COUNT(hr.musica_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducoes AS hr
INNER JOIN SpotifyClone.usuarios AS u
ON u.usuario_id = hr.usuario_id
WHERE u.nome = 'Bill'
GROUP BY u.usuario_id;