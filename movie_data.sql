-- Creates database
CREATE DATABASE IF NOT EXISTS movie_data;


-- Creates table to store people
CREATE TABLE IF NOT EXISTS movie_data.People (
	NameID INTEGER NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    PRIMARY KEY (NameID)
);


-- Creates table to store movies
CREATE TABLE IF NOT EXISTS movie_data.movies (
	MovieID INTEGER NOT NULL AUTO_INCREMENT,
    MovieTitle VARCHAR(100) NOT NULL,
    PRIMARY KEY (MovieID)
);


--
CREATE TABLE IF NOT EXISTS movie_data.PeopleMoviesRatings (
	RatingID INTEGER NOT NULL AUTO_INCREMENT,
    NameID INT,
    MovieID INT,
    Rating INT NULL,
    PRIMARY KEY (RatingID),
    FOREIGN KEY (NameID) REFERENCES People (NameID),
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID)
);    
    
-- Populates people table
INSERT INTO movie_data.people (FirstName,LastName)
VALUES	('Spongebob','Squarepants'),
		('Bojack','Horseman'),
        ('Mc','Lovin'),
        ('Hank','Hill'),
        ('Jin','Yang')
;
    

-- Populates movie table
INSERT INTO movie_data.movies (MovieTitle)
VALUES	('Green Room'),
		('2001 Space Odyssey'),
        ('Her'),
        ('No Country For Old Men'),
        ('Solo: A Star Wars Story'),
        ('Spider-Man 3')
;


-- Populates movie ratings
INSERT INTO movie_data.peoplemoviesratings (nameid,movieid,rating)
VALUES	(1,1,4),
		(1,2,4),
        (1,3,2),
        (1,4,5),
        (1,5,3),
        (1,6,5),
        (2,1,4),
        (2,2,1),
        (2,3,2),
        (2,4,1),
        (2,5,2),
        (2,6,1),
        (3,1,4),
        (3,2,3),
        (3,3,3),
        (3,4,2),
        (3,5,3),
        (3,6,3),
        (4,1,2),
        (4,2,3),
        (4,3,3),
        (4,4,3),
        (4,5,3),
        (4,6,5),
        (5,1,4),
        (5,2,1),
        (5,3,2),
        (5,4,5),
        (5,5,2),
        (5,6,2)
;



-- Create table that has names, movies and ratings all in one table
CREATE TABLE movie_data.PeopleMovieRatingsResults
SELECT
	people.FirstName,
    people.LastName,
    movies.MovieTitle,
    ratings.Rating
FROM movie_data.peoplemoviesratings as ratings
INNER JOIN movie_data.people on
	ratings.NameID = people.NameID
INNER JOIN movie_data.movies on
	ratings.MovieID = movies.MovieID
;


-- Shows the table
SELECT *
FROM peoplemovieratingsresults;
