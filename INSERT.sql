INSERT INTO Genres (genre_name) VALUES 
('Rock'),
('Pop'),
('Jazz');

INSERT INTO MusicArtistGroup (artist_name) VALUES
('Queen'),
('The Beatles'),
('Miles Davis'),
('Taylor Swift');

INSERT INTO album (album_name, "year") VALUES
('A Night at the Opera', 1975),
('Abbey Road', 1969),
('Kind of Blue', 1959);

INSERT INTO track (track_name, duration, AlbumID) VALUES
('Bohemian Rhapsody', '00:05:55', 1),
('Love of My Life', '00:03:38', 1),
('Come Together', '00:04:19', 2),
('Something', '00:03:03', 2),
('So What', '00:09:22', 3),
('Freddie Freeloader', '00:09:46', 3);

INSERT INTO collection (collection_name, "year") VALUES
('Best of Rock', 1990),
('Greatest Hits', 2005),
('Jazz Legends', 2010),
('Pop Stars', 2023);
--
INSERT INTO ArtistGenre (ArtistID, GenreID) VALUES
(1, 1), -- Queen -> Rock
(2, 1), -- The Beatles -> Rock
(3, 3), -- Miles Davis -> Jazz
(4, 2); -- Taylor Swift -> Pop
--
INSERT INTO albumartist (ArtistID, album_id) VALUES
(1, 1), -- Queen -> A Night at the Opera
(2, 2), -- The Beatles -> Abbey Road
(3, 3); -- Miles Davis -> Kind of Blue
--
INSERT INTO collectiontracks (collectionid, TrackID) VALUES
(1, 1), -- Best of Rock -> Bohemian Rhapsody
(1, 3), -- Best of Rock -> Come Together
(2, 2), -- Greatest Hits -> Love of My Life
(2, 4), -- Greatest Hits -> Something
(3, 5), -- Jazz Legends -> So What
(3, 6); -- Jazz Legends -> Freddie Freeloader
