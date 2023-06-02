USE 402

CREATE TABLE Playlist(
	playlist_id VARCHAR(22),
	playlist_name VARCHAR(96),
	CONSTRAINT pk_Playlist_playlist_id PRIMARY KEY (playlist_id))
-- Artist table create

CREATE TABLE Artist(
   artist_id VARCHAR(22) NOT NULL,
   artist_name VARCHAR(28),
   playlist_id VARCHAR(22),
CONSTRAINT pk_Artist PRIMARY KEY(artist_id),
CONSTRAINT fk_Artist_playlist_id FOREIGN KEY (playlist_id)
 REFERENCES Playlist(playlist_id)
 ON DELETE CASCADE ON UPDATE CASCADE)
-- Create table track

CREATE TABLE Track(
 track_id VARCHAR(22) NOT NULL,
 trackname VARCHAR(92),
 popularity INTEGER,
 release_date VARCHAR(8),
 danceability NUMERIC(5),
 liveness NUMERIC(6),
 energy NUMERIC(5),
 sepeecheness NUMERIC(6),
 numArtists INTEGER,
 playlist_id VARCHAR(22),
CONSTRAINT pk_Track_track_id PRIMARY KEY(track_id),
CONSTRAINT fk_Track_track_id FOREIGN KEY (playlist_id)
 REFERENCES Playlist (playlist_id)
 ON DELETE CASCADE ON UPDATE CASCADE)
 
--INSERT STATEMENTS
INSERT INTO Playlist(playlist_id, playlist_name)
SELECT p.playlist_id, p.playlist_name
FROM POPULAR_RAP p;

INSERT INTO Track(track_id, trackname, popularity, release_date, danceability,
liveness, energy, sepeecheness, playlist_id)
SELECT t.track_id, t.track_name, t.popularity, t.release_date, t.danceability,
t.liveness, t.energy, t.speechiness, t.playlist_id
FROM POPULAR_RAP t;

INSERT INTO Artist(artist_id, track_id, artist_name, numArtists, playlist_id)
SELECT a.artist_id, a.track_id, a.artist_name, a.num_artists, a.playlist_id
FROM POPULAR_RAP a