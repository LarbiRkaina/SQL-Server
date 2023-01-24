/*Listar las pistas (tabla Track) con precio mayor o igual a 1€*/
SELECT t.Name, t.UnitPrice
FROM dbo.Track t
WHERE t.UnitPrice >= 1.00

/*Listar las pistas de más de 4 minutos de duración*/
SELECT t.TrackId, t.Name, t.Milliseconds
FROM dbo.Track t
WHERE t.Milliseconds > 240000

/*Listar las pistas que tengan entre 2 y 3 minutos de duración*/
SELECT t.TrackId, t.Name, t.Milliseconds
FROM dbo.Track t
WHERE t.Milliseconds BETWEEN 120000 AND 180000;

/*Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen')*/
SELECT tr.TrackId, tr.Name, tr.GenreId
FROM dbo.Track tr
INNER JOIN dbo.Album al
    ON tr.AlbumId = al.AlbumId
INNER JOIN  dbo.Artist ar
    ON al.ArtistId = ar.ArtistId
WHERE ar.Name ='Queen'

/*Listar los clientes (tabla Customer) de USA, Canada y Brazil*/
SELECT c.FirstName, c.LastName, c.Country
FROM dbo.Customer c
WHERE c.Country IN ('USA','Canada','Brazil')

/*Calcular la media de duración de las pistas (Track) de la plataforma*/
SELECT AVG (t.Milliseconds)
FROM dbo.Track t

/*Listar las pistas de la playlist 'Heavy Metal Classic*/
SELECT *
FROM dbo.Track t
INNER JOIN dbo.PlaylistTrack pt
    ON t.TrackId = pt.TrackId
INNER JOIN dbo.Playlist pl
    ON pt.PlaylistId = pl.PlaylistId
WHERE pl.Name = 'Heavy Metal Classic'

/*Listar las pistas que uno de sus compositores (columna Composer) sea Mercury*/
SELECT t.TrackId, t.Name
FROM dbo.Track t
WHERE t.Composer LIKE '%Mercury%'

/*Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC*/
SELECT DISTINCT pl.Name
FROM dbo.Track t
INNER JOIN dbo.PlaylistTrack pt
    ON t.TrackId = pt.TrackId
INNER JOIN dbo.Playlist pl
    ON pt.PlaylistId = pl.PlaylistId
WHERE t.Composer like '%AC/DC%'

/*Listar las playlist junto con el número de pistas que contienen*/
SELECT COUNT(pl.PlaylistId) as Recuento, pl.Name
FROM dbo.PlaylistTrack pt
INNER JOIN dbo.Playlist pl
    ON pt.PlaylistId = pl.PlaylistId
GROUP BY pl.Name

/*Listar los artistas que no tienen album*/
SELECT ar.Name, ar.ArtistId
FROM dbo.Artist ar
LEFT JOIN dbo.Album al
    ON ar.ArtistId = al.ArtistId
WHERE al.ArtistId is NULL
