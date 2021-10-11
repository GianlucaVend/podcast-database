-- By: Gianluca Venditti
-- Thursday, March 25th 
-- Purpose: Creating a database for a podcasting company to keep track of their podcasts and guests. 


DROP DATABASE IF EXISTS A2Gianluca;
CREATE DATABASE A2Gianluca;

USE A2Gianluca;

CREATE TABLE podcast
(
	podcastID             INT                   PRIMARY KEY,
    podcastTitle		  VARCHAR(25),
    publishDate			  DATE,
    numberOfGuests        INT,
    calculatePay          DECIMAL(4,2)
);

INSERT INTO podcast VALUES
	(100,'Nothing into Something', '2020-11-10', 3,10.00),
    (101,'How to Stay Motivated', '2020-07-16', 0,10.00),
    (102,'Taking the Right Steps', '2020-04-9', 1,10.00),
    (103,'Believe in Yourself!', '2020-03-24', 2,10.00);
	

CREATE TABLE guest 
(
	guestID 			INT 					PRIMARY KEY, 
    guestFName 			VARCHAR(25),
    guestLName			VARCHAR(25), 
    guestGender         CHAR(6), 
    guestCity			VARCHAR(25),
    multipleAppearances BOOLEAN
); 
   
INSERT INTO guest VALUES
(15, 'Jon', 'Roux', 'Male', 'Kingston',0), 
(16, 'Matt', 'Esford', 'Male', 'Toronto', 1),
(17, 'Sky', 'Lopes', 'Female', 'Ottawa', 1),
(18, 'Alex', 'Kinsella', 'Male', 'Orleans', 1); 

CREATE TABLE podcastguest
(
podcastID				INT, 
guestID 				INT, 

    PRIMARY KEY(podcastID,guestID), 
    
    FOREIGN KEY(podcastID)
    REFERENCES podcast(podcastID),
    FOREIGN KEY(guestID)
    REFERENCES guest(guestID)
);    

INSERT INTO podcastguest VALUES
(100,15),
(100,16),
(100,17);


CREATE TABLE information
(
podcastID 			     INT 			        PRIMARY KEY, 
soundTrack              VARCHAR(30),
platformType			VARCHAR(30),
 CONSTRAINT information_fk_podcast
	FOREIGN KEY (podcastID)
    REFERENCES podcast(podcastID)
); 

INSERT INTO information VALUES
(100, 'Hold On - Justin Biber', 'Apple Music'),
(101, 'IM DONE - The Kid Laroi', 'Spotify'),
(102, 'On my Own - Jaden Smith', 'Spotify'),
(103, 'Another Day - Kid Cudi', 'Apple Music');

/*
-- 1.
SELECT soundTrack, p.podcastID, podcastTitle, publishDate
	FROM information i
    JOIN podcast p 
    ON p.podcastID = i.podcastID;

-- 2.
SELECT numberOfGuests, calculatePay,  numberOfGuests  * calculatePay AS total_cost
	FROM podcast p
    ORDER BY total_cost DESC;

-- 3.
SELECT *
FROM podcast
WHERE numberOfGuests = 0;

-- 4.
SELECT podcastTitle, guestFName, platformType
FROM podcast p 
JOIN podcastguest pg 
ON p.podcastID = pg.podcastID
JOIN guest g 
ON pg.guestID = g.guestID
JOIN information i
ON p.podcastID = i.podcastID; 

*/
    