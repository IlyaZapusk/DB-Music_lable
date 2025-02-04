-- Task 2
SELECT track_name, duration 
FROM track 
ORDER BY duration DESC 
LIMIT 1;

SELECT track_name, duration 
FROM track 
WHERE duration = (SELECT MAX(duration) FROM track);

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
SELECT g.genre_name, COUNT(ag.artistid) AS artist_count
FROM genres g
LEFT JOIN artistgenre ag ON g.genresid = ag.genreid
GROUP BY g.genre_name;

SELECT COUNT(t.trackid) AS track_count
FROM track t
JOIN album a ON t.albumid = a.albumid
WHERE a.year BETWEEN 2019 AND 2020;

SELECT a.album_name, ROUND(AVG(EXTRACT(EPOCH FROM t.duration)) / 60, 2) AS avg_duration_minutes
FROM album a
JOIN track t ON a.albumid = t.albumid
GROUP BY a.album_name;

SELECT ma.artist_name
FROM musicartistgroup ma
LEFT JOIN albumartist aa ON ma.artistid = aa.artistid
LEFT JOIN album a ON aa.album_id = a.albumid AND a.year = 2020
WHERE a.albumid IS NULL;

SELECT DISTINCT c.collection_name
FROM collection c
JOIN collectiontracks ct ON c.collectionid = ct.collectionid
JOIN track t ON ct.trackid = t.trackid
JOIN album a ON t.albumid = a.albumid
JOIN albumartist aa ON a.albumid = aa.album_id
JOIN musicartistgroup ma ON aa.artistid = ma.artistid
WHERE ma.artist_name = 'Queen';

-- Task 4

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

SELECT a.album_name
FROM album a
JOIN track t ON a.albumid = t.albumid
GROUP BY a.album_name
HAVING COUNT(t.trackid) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(t.trackid) AS track_count
        FROM album a
        JOIN track t ON a.albumid = t.albumid
        GROUP BY a.albumid
    ) AS album_track_counts
);


