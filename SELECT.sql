-- Task 2
SELECT track_name, duration 
FROM track 
ORDER BY duration DESC 
LIMIT 1;

SELECT track_name, duration 
FROM track 
WHERE duration >= '00:03:30';

SELECT collection_name, year 
FROM collection 
WHERE year BETWEEN 2018 AND 2020;

SELECT artist_name 
FROM MusicArtistGroup 
WHERE artist_name NOT LIKE '% %';

SELECT track_name 
FROM track 
WHERE LOWER(track_name) LIKE '%мой%' 
   OR LOWER(track_name) LIKE '%my%';

-- Task 3

SELECT a.album_name 
FROM Album a
JOIN albumartist aa ON a.AlbumID = aa.album_id 
JOIN ArtistGenre ag ON aa.ArtistID = ag.ArtistID
GROUP BY a.albumid , a.album_name
HAVING COUNT(DISTINCT ag.GenreID) > 1;

SELECT t.track_name 
FROM Track t
LEFT JOIN collectiontracks ct ON t.TrackID = ct.TrackID
WHERE ct.collectionID IS NULL;

SELECT ma.artist_name, t.track_name, t.duration
FROM Track t
JOIN  album a ON t.AlbumID = a.AlbumID
JOIN albumartist aa ON a.AlbumID = aa.album_id 
JOIN MusicArtistGroup ma ON aa.ArtistID = ma.ArtistID
WHERE t.duration = (SELECT MIN(duration) FROM Track);