SELECT u.nome AS usuario,
	IF(MAX(YEAR(hr.data_reproducao)) = "2021", 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_reproducoes AS hr
ON hr.usuario_id = u.usuario_id
GROUP BY u.nome
ORDER BY u.nome ASC;