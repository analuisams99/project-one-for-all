SELECT 
	ar.nome AS artista,
  al.nome AS album
FROM SpotifyClone.artistas AS ar
RIGHT JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
WHERE ar.nome = 'Walter Phoenix';