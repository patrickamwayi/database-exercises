USE albums_db;
SELECT * From albums;
-- 31 Rows
SELECT Distinct artist FROM albums;
-- 23 Artists
-- The primary key is id
SELECT * FROM albums ORDER BY release_date ASC;
-- Oldest release date is 1967 by The Beatles' album Sgt.Peppers's Lonely Hearts Club Band
-- The most recent release date is 2011 by Adele's album 21
SELECT * FROM albums WHERE name = 'Pink Floyd';
SELECT * FROM albums_db.albums WHERE release_date BETWEEN 1967 AND 2011 = "Sgt. Pepper's Lonely Hearts Club Band was released";
-- 1967
SELECT * FROM albums WHERE genre = 'Nevermind';
-- The genre is Grunge, Alternate Rock
SELECT * FROM albums_db.albums WHERE release_date BETWEEN 1990 AND 1999;
-- The Bodyguard
-- Jagged Little Pill
-- Come On Over
-- Falling into You
-- Let's Talk About Love
-- Dangerous
-- The Immaculate Collection
-- Titanic: Music from the Motion Picture
-- Metallica
-- Nevermind 
-- Supernatural
SELECT * FROM albums_db.albums WHERE sales <20.0;
-- Grease: The Original Soundtrack from the Motion
-- Bad
-- Sgt. Pepper's Lonely Hearts Club Band
-- Dirty Dancing
-- Let's Talk About Love
-- Dangerous
-- The Immaculate Collection
-- Abbey Road
-- Born in the U.S.A
-- Brothers in Arms
-- Titanic: Music from the Motion Pictures
-- Nevermind
-- The Wall
SELECT * FROM albums WHERE genre = 'Rock';
-- It'll only look for genre 'Rock' unless otherwise specified