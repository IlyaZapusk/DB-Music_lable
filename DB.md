-- Таблица Genres
CREATE TABLE IF NOT EXISTS Genres (
    GenresID SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

-- Таблица MusicArtistGroup
CREATE TABLE IF NOT EXISTS MusicArtistGroup (
    ArtistID SERIAL PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
);

-- Таблица ArtistGenre (связь между жанрами и исполнителями)
CREATE TABLE IF NOT EXISTS ArtistGenre (
    ArtistGenre_ID SERIAL PRIMARY KEY,  
    GenreID INT NOT NULL,               
    ArtistID INT NOT NULL,              
    FOREIGN KEY (GenreID) REFERENCES Genres(GenresID),
    FOREIGN KEY (ArtistID) REFERENCES MusicArtistGroup(ArtistID) 
);


-- Таблица Album
CREATE TABLE if not exists Album (
    AlbumID INT PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    year DATE NOT null
);

-- Таблица Album/Artist (связь между альбомами и артистами)
CREATE table if not exists AlbumArtist (
    AlbumArtist_ID INT PRIMARY KEY,
    Album_ID INT NOT NULL,
    ArtistID INT NOT NULL,
    FOREIGN KEY (Album_ID) REFERENCES Album(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES MusicArtistGroup(ArtistID)
);

-- Таблица Track (трек из альбома)
CREATE TABLE if not exists Track (
    TrackID INT PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    duration TIME NOT NULL,
    AlbumID INT NOT NULL,
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

-- Таблица Collection
CREATE table if not exists Collection (
    CollectionID INT PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    year DATE NOT NULL
);

-- Таблица Collection/Tracks (связь между коллекциями и треками)
CREATE table if not exists CollectionTracks (
    CollectionTracks_ID INT PRIMARY KEY,
    CollectionID INT NOT NULL,
    TrackID INT NOT NULL,
    FOREIGN KEY (CollectionID) REFERENCES Collection(CollectionID),
    FOREIGN KEY (TrackID) REFERENCES Track(TrackID)
);
