SELECT 
	ar.nome AS artista,
  al.nome AS album,
  COUNT(s.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS ar
RIGHT JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
LEFT JOIN SpotifyClone.seguindo AS s
ON al.artista_id = s.artista_id
GROUP BY album_id
ORDER BY seguidores DESC, artista ASC, album ASC;