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
WITH usuariosNoRadioHead AS (
    SELECT distinct e.UsuarioId FROM Escucha e
    JOIN Tema t ON t.Id = e.TemaId
    JOIN Album a ON a.Id = t.AlbumId
    JOIN Banda b ON b.Id = a.BandaId
    WHERE b.NombreBanda = "Radiohead"
)
SELECT 
--Listar los temas con mas de 2 reproducciones

--Listar los dicos con la menor cantidad de temas

--Listar el o los discos mas escuchados

--Listar los usuarios que escuchan discos de bandas que no prefieren

--Listar los usuario que prefieren a todas las bandas