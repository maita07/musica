--Listar los albumes sin reproducciones
WITH AlbumEscuchado AS (
    SELECT t.AlbumId FROM Tema t
    JOIN Escucha e ON e.TemaId = t.Id
    GROUP BY t.AlbumId
)
SELECT a.Id, a.NombreAlbum FROM Album a
WHERE a.Id NOT IN (SELECT AlbumId FROM AlbumEscuchado)

-- Verificación
SELECT a.Id, a.NombreAlbum FROM Escucha e
JOIN Tema t ON t.Id = e.TemaId
JOIN Album a ON a.Id = t.AlbumId
GROUP BY a.Id, a.NombreAlbum
ORDER BY a.Id

--Listar aquellos usuarios que solamente escucharon canciones de Radiohead

SELECT u.* FROM Usuario u
WHERE u.Id NOT IN (
    SELECT distinct e.UsuarioId FROM Escucha e
    JOIN Tema t ON t.Id = e.TemaId
    JOIN Album a ON a.Id = t.AlbumId
    JOIN Banda b ON b.Id = a.BandaId
    WHERE b.NombreBanda != 'Radiohead'
)

--Listar los temas con mas de 2 reproducciones

SELECT t.Id, t.NombreTema FROM Tema t
WHERE t.Id IN (
    SELECT t.Id FROM Tema t
    JOIN Escucha e ON e.TemaId = t.Id
    GROUP BY t.Id
    HAVING COUNT(t.Id) > 2
)

--Listar los dicos con la menor cantidad de temas
SELECT * FROM Album a
JOIN (
    SELECT a.Id, COUNT(*) AS conteo FROM Album a
    JOIN Tema t ON t.AlbumId = a.Id
    GROUP BY a.Id
) AS sc ON sc.Id = a.Id
WHERE sc.conteo = (
        SELECT MIN(sc.conteo) FROM (SELECT COUNT(*) AS conteo FROM Album a
        JOIN Tema t ON t.AlbumId = a.Id
        GROUP BY a.Id) AS sc
        )
ORDER BY a.Id

-- or

with conteoTemas AS (
    SELECT a.Id AS IdAlbum, COUNT(*) AS conteo FROM Album a
    JOIN Tema t ON t.AlbumId = a.Id
    GROUP BY a.Id
)
SELECT * FROM Album a
JOIN conteoTemas ct ON ct.IdAlbum = a.Id
WHERE ct.conteo = (SELECT MIN(ct.conteo) FROM conteoTemas ct)
ORDER BY a.Id

--Listar el o los discos mas escuchados

SELECT a.*, tc.conteo FROM Album a
JOIN (
    SELECT a.Id, COUNT(a.Id) AS conteo FROM Album a
    JOIN Tema t ON t.AlbumId = a.Id
    JOIN Escucha e ON e.TemaId = t.Id
    GROUP BY a.Id
) AS tc ON tc.Id = a.Id
WHERE tc.conteo = (
    SELECT MAX(a.conteo) FROM (
        SELECT COUNT(a.Id) AS conteo FROM Album a
        JOIN Tema t ON t.AlbumId = a.Id
        JOIN Escucha e ON e.TemaId = t.Id
        GROUP BY a.Id
    ) AS a
)

--or

WITH conteoTemas AS (
    SELECT a.Id, COUNT(a.Id) AS conteo FROM Album a
    JOIN Tema t ON t.AlbumId = a.Id
    JOIN Escucha e ON e.TemaId = t.Id
    GROUP BY a.Id
)
SELECT a.*, tc.conteo FROM Album a
JOIN conteoTemas tc ON tc.Id = a.Id
WHERE tc.conteo = (
    SELECT MAX(conteo) FROM conteoTemas
)
--Listar los usuarios que escuchan discos de bandas que no prefieren

SELECT distinct u.* FROM Usuario u
JOIN Escucha e ON e.UsuarioId = u.Id
JOIN Tema t ON t.Id = e.TemaId
JOIN Album a ON a.Id = t.AlbumId
JOIN Banda b ON b.Id = a.BandaId
WHERE b.Id NOT IN (
    SELECT b.Id FROM Usuario u
    JOIN Escucha e ON e.UsuarioId = u.Id
    JOIN Tema t ON t.Id = e.TemaId
    JOIN Album a ON a.Id = t.AlbumId
    JOIN Banda b ON b.Id = a.BandaId
    JOIN Prefiere p ON p.BandaId = b.Id
)

--Listar los usuario que prefieren a todas las bandas

SELECT distinct u.* FROM Usuario u
