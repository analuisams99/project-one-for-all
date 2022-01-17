DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
    `plano_id` INT NOT NULL,
    `plano` VARCHAR(30) NOT NULL,
    `valor_plano` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (plano_id)
) engine = InnoDB;

CREATE TABLE usuarios (
    `usuario_id` INT NOT NULL,
    `nome` VARCHAR(20) NOT NULL,
    `idade` INT NOT NULL,
    `plano_id` INT NOT NULL,
    `data_assinatura` DATETIME NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE artistas (
  `artista_id` INT NOT NULL,
  `nome` VARCHAR(20) NOT NULL,
  PRIMARY KEY (artista_id)
) engine = InnoDB;

CREATE TABLE seguindo (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE albuns (
  `album_id` INT NOT NULL,
  `nome` VARCHAR(30) NOT NULL,
  `artista_id` INT NOT NULL,
  `ano_lancamento` INT NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;


CREATE TABLE musicas ( 
  `musica_id` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `duracao_segundos` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (musica_id),
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE historico_reproducoes (
  `musica_id` INT NOT NULL,
  `data_reproducao` DATETIME NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (musica_id, usuario_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (musica_id) REFERENCES musicas(musica_id)
) engine = InnoDB;

INSERT INTO planos VALUES
    (1, 'gratuito', 0), 
    (2, 'familiar', 7.99), 
    (3, 'universitário', 5.99), 
    (4, 'pessoal', 6.99);

INSERT INTO usuarios VALUES
    (1, 'Thati', 23, 1, '2019-10-20 00:00:00'), 
    (2, 'Cintia', 35, 2, '2017-12-30 00:00:00'), 
    (3, 'Bill', 20, 3, '2019-06-05 00:00:00'), 
    (4, 'Roger', 45, 4, '2020-05-13 00:00:00'), 
    (5, 'Norman', 58, 4, '2017-02-17 00:00:00'), 
    (6, 'Patrick', 33, 2, '2017-01-06 00:00:00'), 
    (7, 'Vivian', 26, 3, '2018-01-05 00:00:00'), 
    (8, 'Carol', 19, 3, '2018-02-14 00:00:00'), 
    (9, 'Angelina', 42, 2, '2018-04-29 00:00:00'), 
    (10, 'Paul', 46, 2, '2017-01-17 00:00:00');

INSERT INTO artistas VALUES
    (1, 'Fog'), 
    (2, 'Freedie Shannon'), 
    (3, 'Lance Day'), 
    (4, 'Peter Strong'), 
    (5, 'Tyler Isle'), 
    (6, 'Walter Phoenix');

INSERT INTO seguindo (usuario_id, artista_id) VALUES
    (1, 6), 
    (1, 2), 
    (1, 3), 
    (2, 6), 
    (2, 3), 
    (3, 4), 
    (3, 6), 
    (4, 2), 
    (5, 5), 
    (5, 1), 
    (6, 1), 
    (6, 3), 
    (6, 6), 
    (7, 4), 
    (7, 5), 
    (8, 6), 
    (8, 5), 
    (9, 1), 
    (9, 2), 
    (9, 3), 
    (10, 4), 
    (10, 1);

INSERT INTO albuns VALUES
    (1, 'Envious', 6, 1990), 
    (2, 'Exuberant', 6, 1993), 
    (3, 'Hallowed Steam', 4, 1995), 
    (4, 'Incandescent', 3, 1998), 
    (5, 'Temporary Culture', 2, 2001), 
    (6, 'Library of liberty', 2, 2003), 
    (7, 'Chained Down', 5, 2007), 
    (8, 'Cabinet of fools', 5, 2012), 
    (9, 'No guarantees', 5, 2015), 
    (10, 'Apparatus', 1, 2015);

INSERT INTO musicas VALUES
    (1,'Soul For Us',200,1),
    (2,'Reflections Of Magic',163,1),
    (3,'Dance With Her Own',116,1),
    (4,'Troubles Of My Inner Fire',203,2),
    (5,'Time Fireworks',152,2),
    (6,'Magic Circus',105,3),
    (7,'Honey, So Do I',207,3),
    (8,'Sweetie, Lets Go Wild',139,3),
    (9,'She Knows',244,3),
    (10,'Fantasy For Me',100,4),
    (11,'Celebration Of More',146,4),
    (12,'Rock His Everything',223,4),
    (13,'Home Forever',231,4),
    (14,'Diamond Power',241,4),
    (15,'Lets Be Silly',132,4),
    (16,'Thang Of Thunder',240,5),
    (17,'Words Of Her Life',185,5),
    (18,'Without My Streets',176,5),
    (19,'Need Of The Evening',190,6),
    (20,'History Of My Roses',222,6),
    (21,'Without My Love',111,6),
    (22,'Walking And Game',123,6),
    (23,'Young And Father',197,6),
    (24,'Finding My Traditions',179,7),
    (25,'Walking And Man',229,7),
    (26,'Hard And Time',135,7),
    (27,'Honey, Im A Lone Wolf',150,7),
    (28,'She Thinks I Wont Stay Tonight',166,8),
    (29,'He Heard Youre Bad For Me',154,8),
    (30,'He Hopes We Cant Stay',210,8),
    (31,'I Know I Know',117,8),
    (32,'Hes Walking Away',159,9),
    (33,'Hes Trouble',138,9),
    (34,'I Heard I Want To Bo Alone',120,9),
    (35,'I Ride Alone',151,9),
    (36,'Honey',79,10),
    (37,'You Cheated On Me',95,10),
    (38,'Wouldnt It Be Nice',213,10),
    (39,'Baby',136,10),
    (40,'You Make Me Feel So..',83,10);

INSERT INTO historico_reproducoes (musica_id,data_reproducao,usuario_id) VALUES
    (36,'2020-02-28 10:45:55',1),
    (25,'2020-05-02 05:30:35',1),
    (23,'2020-03-06 11:22:33',1),
    (14,'2020-08-05 08:05:17',1),
    (15,'2020-09-14 16:32:22',1),
    (34,'2020-01-02 07:40:33',2),
    (24,'2020-05-16 06:16:22',2),
    (21,'2020-10-09 12:27:48',2),
    (39,'2020-09-21 13:14:46',2),
    (6,'2020-11-13 16:55:13',3),
    (3,'2020-12-05 18:38:30',3),
    (26,'2020-07-30 10:00:00',3),
    (2,'2021-08-15 17:10:10',4),
    (35,'2021-07-10 15:20:30',4),
    (27,'2021-01-09 01:44:33',4),
    (7,'2020-07-03 19:33:28',5),
    (12,'2017-02-24 21:14:22',5),
    (14,'2020-08-06 15:23:43',5),
    (1,'2020-11-10 13:52:27',5),
    (38,'2019-02-07 20:33:48',6),
    (29,'2017-01-24 00:31:17',6),
    (30,'2017-10-12 12:35:20',6),
    (22,'2018-05-29 14:56:41',6),
    (5,'2018-05-09 22:30:49',7),
    (4,'2020-07-27 12:52:58',7),
    (11,'2018-01-16 18:40:43',7),
    (39,'2018-03-21 16:56:40',8),
    (40,'2020-10-18 13:38:05',8),
    (32,'2019-05-25 08:14:03',8),
    (33,'2021-08-15 21:37:09',8),
    (16,'2021-05-24 17:23:45',9),
    (17,'2018-12-07 22:48:52',9),
    (8,'2021-03-14 06:14:26',9),
    (9,'2020-04-01 03:36:00',9),
    (20,'2017-02-06 08:21:34',10),
    (21,'2017-12-04 05:33:43',10),
    (12,'2017-07-27 05:24:49',10),
    (13,'2017-12-25 01:03:57',10);