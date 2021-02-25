-- List all customers (name + email),
-- ordered alphabetically (no extra information)
SELECT first_name, last_name, email
FROM customers
ORDER BY last_name ASC;

-- List tracks (Name + Composer) of the Classical playlist
SELECT tracks.name, tracks.composer
FROM tracks
JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
JOIN playlists ON playlists.id = playlist_tracks.playlist_id
WHERE playlists.name = 'Classical';

-- List the 10 artists mostly listed in all playlists
SELECT artists.name, COUNT(*) AS number_of_occurences
FROM artists
JOIN albums ON albums.artist_id = artists.id
JOIN tracks ON tracks.album_id = albums.id
JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
GROUP BY artists.name
ORDER BY number_of_occurences DESC
LIMIT 10;

-- List the tracks which have been purchased at least twice,
-- ordered by number of purchases
SELECT tracks.name, COUNT(*) AS number_of_purchases
FROM invoice_lines
JOIN tracks ON tracks.id = invoice_lines.track_id
WHERE tracks.milliseconds > (10 * 60000)
GROUP BY invoice_lines.track_id
HAVING number_of_purchases > 1
ORDER BY number_of_purchases DESC;


