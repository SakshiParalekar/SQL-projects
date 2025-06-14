-- Movie Database Management System

-- Create Tables

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50)
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    release_year INT,
    genre_id INT,
    duration INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_name VARCHAR(100),
    birth_year INT
);

CREATE TABLE Movie_Actors (
    movie_id INT,
    actor_id INT,
    role VARCHAR(100),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    rating DECIMAL(2,1),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Insert Data

INSERT INTO Genres (genre_name) VALUES 
('Action'), ('Comedy'), ('Drama'), ('Romance'), ('Thriller');

INSERT INTO Movies (title, release_year, genre_id, duration) VALUES 
('Sholay', 1975, 1, 198),
('3 Idiots', 2009, 2, 170),
('Dilwale Dulhania Le Jayenge', 1995, 4, 189),
('Drishyam', 2015, 5, 163),
('Lagaan', 2001, 3, 224);

INSERT INTO Actors (actor_name, birth_year) VALUES 
('Amitabh Bachchan', 1942),
('Aamir Khan', 1965),
('Shah Rukh Khan', 1965),
('Ajay Devgn', 1969),
('Amrish Puri', 1932);

INSERT INTO Movie_Actors (movie_id, actor_id, role) VALUES 
(1, 1, 'Jai'), 
(1, 5, 'Gabbar Singh'), 
(2, 2, 'Rancho'), 
(3, 3, 'Raj'), 
(4, 4, 'Vijay Salgaonkar'), 
(5, 2, 'Bhuvan');

INSERT INTO Reviews (movie_id, rating, review_text, review_date) VALUES 
(1, 9.0, 'Classic film with iconic characters!', '2020-01-10'),
(2, 8.7, 'Inspiring and emotional journey.', '2020-02-15'),
(3, 9.2, 'All-time favorite romantic movie.', '2020-03-20'),
(4, 8.0, 'Great thriller with twist ending.', '2020-04-25'),
(5, 8.5, 'Historic and entertaining.', '2020-05-30');

-- Sample SQL Queries

Top 5 Rated Movies:

SELECT m.title, AVG(r.rating) AS avg_rating
FROM Movies m
JOIN Reviews r ON m.movie_id = r.movie_id
GROUP BY m.title
ORDER BY avg_rating DESC
LIMIT 5;

Most Popular Genre:

SELECT g.genre_name, COUNT(*) AS movie_count
FROM Movies m
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY movie_count DESC
LIMIT 1;

All Movies of Actor 'Amitabh Bachchan':

SELECT m.title, m.release_year
FROM Movies m
JOIN Movie_Actors ma ON m.movie_id = ma.movie_id
JOIN Actors a ON ma.actor_id = a.actor_id
WHERE a.actor_name = 'Amitabh Bachchan';

