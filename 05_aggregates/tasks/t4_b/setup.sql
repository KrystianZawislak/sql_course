/*
    Model: Cycling (newer version, pasted by the user on 2026-11-08)
    Author: Tomasz Potempa / Department of Computer Science
    Part 1: schema, part 2: data
*/

CREATE SCHEMA IF NOT EXISTS cycling;

DROP TABLE IF EXISTS cycling.result;
DROP TABLE IF EXISTS cycling.stage_result;
DROP TABLE IF EXISTS cycling.stage;
DROP TABLE IF EXISTS cycling.competition;
DROP TABLE IF EXISTS cycling.point;
DROP TABLE IF EXISTS cycling.scale;
DROP TABLE IF EXISTS cycling.athlete;
DROP TABLE IF EXISTS cycling.team;
DROP TABLE IF EXISTS cycling.country;

CREATE TABLE cycling.country (
    country_code character(3) PRIMARY KEY,
    country_name character varying(50) UNIQUE NOT NULL,
    population integer CHECK (population > 0)
);

CREATE TABLE cycling.team (
    team_uci_code character(3) PRIMARY KEY,
    team_name character varying(100) UNIQUE NOT NULL,
    country_code character(3) NOT NULL
        REFERENCES cycling.country
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    foundation_year integer CHECK (foundation_year BETWEEN 1900 AND EXTRACT(YEAR FROM CURRENT_DATE)),
    team_uci_category character varying(50) NOT NULL
);

CREATE TABLE cycling.athlete (
    athlete_id integer PRIMARY KEY,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    weight integer CHECK (weight BETWEEN 25 AND 250),
    height integer CHECK (height BETWEEN 125 AND 250),
    birthdate date NOT NULL,
    sex character varying(10) NOT NULL CHECK (sex IN ('female','male')),
    team_uci_code character varying(3) NOT NULL
        REFERENCES cycling.team
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    country_code character(3) NOT NULL
        REFERENCES cycling.country
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE cycling.scale (
    scale_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    scale_code character varying(20) UNIQUE NOT NULL,
    scale_type character varying(10) NOT NULL
);

CREATE TABLE cycling.point (
    scale_id integer
        REFERENCES cycling.scale
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    rank integer NOT NULL CHECK (rank > 0),
    points integer NOT NULL CHECK (points > 0),
    CONSTRAINT point_pkey PRIMARY KEY (scale_id, rank)
);

CREATE TABLE cycling.competition (
    competition_id integer PRIMARY KEY,
    competition_name character varying(50) NOT NULL,
    edition integer CHECK (edition > 0) NOT NULL,
    uci_competition character varying(50) NOT NULL,
    uci_race_class character varying(5) NOT NULL,
    scale_code character varying(20)
        REFERENCES cycling.scale(scale_code)
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    competition_date daterange NOT NULL,
    distance numeric(6,2) NOT NULL CHECK (distance > 0),
    UNIQUE (competition_name, edition)
);

CREATE TABLE cycling.stage (
    competition_id integer
        REFERENCES cycling.competition
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    stage_id integer,
    departure character varying(50) NOT NULL,
    arrival character varying(50) NOT NULL,
    start_date_time timestamp with time zone NOT NULL,
    distance numeric(6,2) NOT NULL CHECK (distance > 0),
    CONSTRAINT stage_pkey PRIMARY KEY (competition_id, stage_id)
);

CREATE TABLE cycling.stage_result (
    competition_id integer,
    stage_id integer,
    athlete_id integer
        REFERENCES cycling.athlete
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    result interval CHECK (result >= '00:00:00'),
    bonification interval CHECK (bonification >= '00:00:00'),
    rank integer CHECK (rank > 0),
    CONSTRAINT stage_result_pkey PRIMARY KEY (competition_id, stage_id, athlete_id),
    FOREIGN KEY (competition_id, stage_id)
        REFERENCES cycling.stage
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
);
COMMENT ON TABLE cycling.stage_result IS 'The table contains INTERIM STAGE results or after the stage the FINAL STAGE results.';

CREATE TABLE cycling.result (
    competition_id integer
        REFERENCES cycling.competition
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    athlete_id integer
        REFERENCES cycling.athlete
        MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    result interval CHECK (result >= '00:00:00'),
    rank integer NOT NULL CHECK (rank > 0),
    CONSTRAINT result_pkey PRIMARY KEY (competition_id, athlete_id)
);
COMMENT ON TABLE cycling.result IS 'The table contains INTERIM RACE results or after the race the FINAL RACE results.';

/*
    UCI competition regulations & Results from the 2024 season based on:
    - ProCyclingStats
    - UCI
    - Wikipedia
*/

DELETE FROM cycling.result;
DELETE FROM cycling.stage_result;
DELETE FROM cycling.stage;
DELETE FROM cycling.competition;
DELETE FROM cycling.point;
DELETE FROM cycling.scale;
DELETE FROM cycling.athlete;
DELETE FROM cycling.team;
DELETE FROM cycling.country;

INSERT INTO cycling.country VALUES
    ('ARE', 'United Arab Emirates', 11027129),
    ('AUS', 'Australia', 27122411),
    ('AUT', 'Austria', 9198124),
    ('BEL', 'Belgium', 11861621),
    ('BHR', 'Bahrain', 1577059),
    ('CHE', 'Switzerland', 9002763),
    ('COL', 'Colombia', 52695952),
    ('DNK', 'Denmark', 5989985),
    ('ECU', 'Ecuador', 16938986),
    ('ESP', 'Spain', 48946035),
    ('FIN', 'Finland', 5635560),
    ('FRA', 'France', 68534000),
    ('GBR', 'Great Britain', 68265209),
    ('GER', 'Germany', 84708010),
    ('NOR', 'Norway', 5550203),
    ('HUN', 'Hungary', 9584627),
    ('ISL', 'Iceland', 399189),
    ('IRL', 'Ireland', 5224884),
    ('ITA', 'Italy', 58968499),
    ('LIE', 'Liechtenstein', NULL),
    ('JPN', 'Japan', 123790000),
    ('MEX', 'Mexico', 129940228),
    ('NLD', 'Netherlands', 18028211),
    ('POL', 'Poland', 37543000),
    ('PRT', 'Portugal', 10639726),
    ('SVK', 'Slovakia', 5424687),
    ('SVN', 'Slovenia', 2126324),
    ('USA', 'United States', 335893238)
RETURNING *;

INSERT INTO    cycling.team VALUES
    ('ADC', 'Alpecin–Deceuninck', 'BEL', 2008, 'UCI WorldTeams'),
    ('COF', 'Cofidis', 'FRA', 1997, 'UCI WorldTeams'),
    ('DAT', 'Decathlon–AG2R La Mondiale', 'FRA', 1992, 'UCI WorldTeams'),
    ('EFE', 'EF Education - EasyPost', 'USA', 2003, 'UCI WorldTeams'),
    ('IGD', 'INEOS Grenadiers', 'GBR', 2009, 'UCI WorldTeams'),
    ('MOV', 'Movistar Team', 'ESP', 1980, 'UCI WorldTeams'),
    ('RBH', 'Red Bull - BORA - Hansgrohe', 'GER', 2010, 'UCI WorldTeams'),
    ('SOQ', 'Soudal Quick-Step', 'BEL', 2023, 'UCI WorldTeams'),
    ('TVL', 'Team Visma - Lease a Bike', 'NLD', 1984, 'UCI WorldTeams'),
    ('UAD', 'UAE Team Emirates', 'ARE', 1999, 'UCI WorldTeams'),
    ('DFP', 'Team Picnic PostNL', 'NLD', 2005, 'UCI WorldTeams'),
    ('UXM', 'Uno-X Mobility', 'NOR', 2017, 'UCI WorldTeams'),
    ('TSM', 'Team Storck - Metropol Cycling', 'ARE', 2023, 'UCI Continental Teams'),
    ('CSR', 'Canyon-SRAM Racing', 'GER', 2002, 'UCI Women''s WorldTeam'),
    ('SDW', 'Team SD Worx-Protime', 'NLD', 2010, 'UCI Women''s WorldTeam'),
    ('FED', 'Fenix-Deceuninck', 'BEL', 2020, 'UCI Women''s WorldTeam'),
    ('LTK', 'Lidl-Trek', 'USA', 2011, 'UCI WorldTeams'),
    ('TBV', 'Bahrain Victorious', 'BHR', 2017, 'UCI WorldTeams'),
    ('GFC', 'Groupama-FDJ', 'FRA', 1997, 'UCI WorldTeams')
RETURNING *;

INSERT INTO    cycling.athlete VALUES
    (1, 'Rui', 'Costa', 69, 182, '1986-10-05', 'male', 'EFE', 'PRT'),
    (2, 'Adam', 'Yates', 58, 173, '1992-08-07', 'male', 'UAD', 'GBR'),
    (3, 'Ganna', 'Filippo', 83, 193, '1996-07-25', 'male', 'IGD', 'ITA'),
    (4, 'Joshua', 'Tarling', 78, 194, '2004-02-15', 'male', 'IGD', 'GBR'),
    (5, 'Gavin', 'Hlady', 65, 181, '2003-02-01', 'male', 'EFE', 'USA'),
    (6, 'Thomas', 'Geraint', 71, 183, '1986-05-25', 'male', 'IGD', 'GBR'),
    (7, 'Ben', 'Healy', 65, 175, '2000-09-11', 'male', 'EFE', 'IRL'),
    (8, 'Georg', 'Steinhauser', 65, 189, '2001-10-21', 'male', 'EFE', 'GER'),
    (9, 'Tadej', 'Pogačar', 66, 177, '1998-09-21', 'male', 'UAD', 'SVN'),
    (10, 'Filip', 'Maciejuk', 78, 190, '1999-09-02', 'male', 'RBH', 'POL'),
    (11, 'Jan', 'Christen', 60, 183, '2004-06-26', 'male', 'UAD', 'CHE'),
    (12, 'Rigoberto', 'Urán', 63, 173, '1987-01-26', 'male', 'EFE', 'COL'),
    (13, 'Isaac', 'Del Toro', NULL, 180, '2003-11-27', 'male', 'UAD', 'MEX'),
    (14, 'Filippo', 'Baroncini', 74, 188, '2000-08-26', 'male', 'UAD', 'ITA'),
    (15, 'Yuhi', 'Todome', NULL, 176, '2002-06-18', 'male', 'EFE', 'JPN'),
    (16, 'Primož', 'Roglič', 65, 177, '1989-10-29', 'male', 'RBH', 'SVN'),
    (17, 'Egan', 'Bernal', 58, 170, '1997-01-12', 'male', 'IGD', 'COL'),
    (18, 'Emil', 'Herzog', 74, 184, '2004-10-06', 'male', 'RBH', 'GER'),
    (19, 'Hugo', 'Toumire', 69, 180, '2001-10-05', 'male', 'COF', 'FRA'),
    (20, 'Jai', 'Hindley', 60, 175, '1996-05-05', 'male', 'RBH', 'AUS'),
    (21, 'Alexander', 'Hajek', 55, 176, '2003-06-19', 'male', 'RBH', 'AUT'),
    (22, 'Archie', 'Ryan', 56, 172, '2001-11-16', 'male', 'EFE', 'IRL'),
    (23, 'Sergio', 'Higuita', 57, NULL, '1997-10-01', 'male', 'RBH', 'COL'),
    (24, 'Thomas', 'Pidcock', 58, 170, '1999-07-30', 'male', 'IGD', 'GBR'),
    (25, 'Patrick', 'Gamper', 80, 194, '1997-02-18', 'male', 'RBH', 'AUT'),
    (26, 'Richard', 'Carapaz', 62, 170, '1993-05-29', 'male', 'EFE', 'ECU'),
    (27, 'Igor', 'Arrieta', 64, 183, '2002-12-08', 'male', 'UAD', 'ESP'),
    (28, 'Theodor', 'Storm', NULL, 181, '2005-03-31', 'male', 'IGD', 'DNK'),
    (29, 'Thymen', 'Arensman', 68, 192, '1999-12-04', 'male', 'IGD', 'NLD'),
    (30, 'Filip', 'Gruszczyński', NULL, NULL, '2005-02-12', 'male', 'COF', 'POL'),
    (31, 'Esteban', 'Chaves', 55, 164, '1990-01-17', 'male', 'EFE', 'COL'),
    (32, 'Stanisław', 'Aniołkowski', 68, 181, '1997-01-20', 'male', 'COF', 'POL'),
    (33, 'Emanuel', 'Buchmann', 59, 180, '1992-11-18', 'male', 'RBH', 'GER'),
    (34, 'Daniel Felipe', 'Martínez', 63, 172, '1996-04-25', 'male', 'RBH', 'COL'),
    (35, 'Jonas', 'Vingegaard', 58, 175, '1996-12-11', 'male', 'TVL', 'DNK'),
    (36, 'Remco', 'Evenepoel', 61, 171, '2000-01-25', 'male', 'SOQ', 'BEL'),
    (37, 'Paul', 'Keller', 74, 200, '2003-05-07', 'male', 'TSM', 'GER'),
    (38, 'Oscar', 'Riesebeek', 59, 179, '2008-01-15', 'male', 'RBH', 'NLD'),
    (39, 'Ben', 'O''Connor', 67, 188, '1995-11-25', 'male', 'DAT', 'AUS'),
    (40, 'Enric', 'Mas', 61, 177, '1995-01-07', 'male', 'MOV', 'ESP'),
    (41, 'Iván', 'Romeo', 75, 193, '2003-08-16', 'male', 'MOV', 'ESP'),
    (42, 'Johan', 'Jacobs', 78, 192, '1997-03-01', 'male', 'MOV', 'CHE'),
    (43, 'Jordan', 'Labrosse', 65, 178, '2002-09-15', 'male', 'DAT', 'FRA'),
    (44, 'Gianluca', 'Pollefliet', 74, 180, '2002-01-28', 'male', 'DAT', 'BEL'),
    (45, 'Katarzyna', 'Niewiadoma', 49, 165, '1994-09-29', 'female', 'CSR', 'POL'),
    (46, 'Demi', 'Vollering', NULL, 172, '1996-11-15', 'female', 'SDW', 'NLD'),
    (47, 'Pauliena', 'Rooijakkers', 58, 171, '1993-05-12', 'female', 'FED', 'NLD'),
    (48, 'Millie', 'Couzens', 59, 172, '2003-10-29', 'female', 'FED', 'GBR'),
    (49, 'Marthe', 'Truyen', 55, 166, '1999-09-20', 'female', 'FED', 'BEL'),
    (50, 'Agnieszka', 'Skalniak-Sójka', 54, 167, '1997-04-22', 'female', 'CSR', 'POL'),
    (51, 'João', 'Almeida', 63, 178, '1998-08-05', 'male', 'UAD', 'PRT'),
    (52, 'Matteo', 'Jorgenson', 69, 190, '1999-07-01', 'male', 'TVL', 'USA'),
    (53, 'Mikel', 'Landa', 61, 172, '1989-12-13', 'male', 'SOQ', 'ESP'),
    (54, 'Romain', 'Bardet', 65, 185, '1990-11-09', 'male', 'DFP', 'FRA'),
    (55, 'Pavel', 'Sivakov', 70, 188, '1997-07-11', 'male', 'UAD', 'FRA'),
    (56, 'Tobias Halland', 'Johannessen', 62, 176, '1999-08-23', 'male', 'UXM', 'NOR'),
    (57, 'Paul', 'Seixas', 65, 184, '2006-09-24', 'male', 'DAT', 'FRA'),
    (58, 'Felix', 'Orn-Kristoff', 73, 183, '2006-03-12', 'male', 'UXM', 'NOR'),
    (59, 'Aubin', 'Sparfel', 60, 174, '2006-05-07', 'male', 'DAT', 'FRA'),
    (60, 'Adrià', 'Pericas', 68, 184, '2006-05-26', 'male', 'UAD', 'ESP'),
    (61, 'Ashlin', 'Barry', 72, 186, '2007-02-24', 'male', 'TVL', 'USA'),
    (62, 'Lorenzo', 'Finn', 62, 178, '2006-12-19', 'male', 'RBH', 'ITA'),
    (63, 'Cat', 'Ferguson', 55, 169, '2006-04-27', 'female', 'MOV', 'GBR'),
    (64, 'Imogen', 'Wolff', NULL, 174, '2006-06-26', 'female', 'TVL', 'GBR'),
    (65, 'Célia', 'Gery', 52, 166, '2006-01-04', 'female', 'FED', 'FRA'),
    (66, 'Paula', 'Ostiz', 52, 164, '2007-01-12', 'female', 'MOV', 'ESP'),
    (67, 'Viktoria', 'Chladonova', 54, 168, '2006-11-17', 'female', 'TVL', 'SVK'),
    (68, 'Albert Withen', 'Philipsen', 67, 181, '2006-09-03', 'male', 'LTK', 'DNK'),
    (69, 'John', 'Koplan', 62, 181, '2007-04-12', 'male', 'EFE', 'GBR'),
    (70, 'Lena', 'Schultz', 54, 166, '2007-08-21', 'female', 'CSR', 'POL')
RETURNING *;

INSERT INTO cycling.scale VALUES
    (DEFAULT, 'UCI.WR.GT.A.Stage', 'UCI'),
    (DEFAULT, 'UCI.WR.GT.B.Stage', 'UCI'),
    (DEFAULT, 'UCI.WE.WWT.Stage', 'UCI')
RETURNING *;

INSERT INTO cycling.point VALUES
    (1, 1, 210),
    (1,    2, 150),
    (1, 3, 110),
    (1, 4, 90),
    (1, 5, 70),
    (1, 6, 55),
    (1, 7, 45),
    (1, 8, 40),
    (1, 9, 35),
    (1, 10, 30),
    (1, 11,    25),
    (1, 12,    20),
    (1, 13,    15),
    (1, 14,    10),
    (1, 15,    5),
    (2, 1, 180),
    (2, 2, 130),
    (2, 3, 95),
    (2, 4, 80),
    (2, 5, 60),
    (2, 6, 45),
    (2, 7, 40),
    (2, 8, 35),
    (2, 9, 30),
    (2, 10, 25),
    (2, 11, 20),
    (2, 12, 15),
    (2, 13, 10),
    (2, 14, 5),
    (2, 15, 2),
    (3, 1, 50),
    (3, 2, 40),
    (3, 3, 30),
    (3, 4, 25),
    (3, 5, 20),
    (3, 6, 18),
    (3, 7, 15),
    (3, 8, 10),
    (3, 9, 8),
    (3, 10, 6)
RETURNING *;

INSERT INTO    cycling.competition VALUES
    (1, 'Giro d''Italia', 107, 'UCI World Tour', '2.UWT', 'UCI.WR.GT.A.Stage', '[2024-05-04, 2024-05-26]', 3317.5),
    (2, 'Tour de France', 111, 'UCI World Tour', '2.UWT', 'UCI.WR.GT.B.Stage', '[2024-06-29, 2024-07-21]', 3498),
    (3, 'La Vuelta Ciclista a España', 79, 'UCI World Tour', '2.UWT', 'UCI.WR.GT.B.Stage', '[2024-08-17, 2024-09-08]', 3293.3),
    (4, 'Tour de France Femmes', 4, 'UCI Women''s World Tour', '2.WWT', 'UCI.WE.WWT.Stage', '[2024-08-12, 2024-08-18]', 947.9)
RETURNING *;

INSERT INTO cycling.stage VALUES
    (2, 20, 'Nice', 'Col de la Couillole', '2024-07-20 13:55:00+00', 132.8)
RETURNING *;

INSERT INTO cycling.stage_result VALUES
    (2, 20, 9,  '04:04:22', '00:00:10', 1),
    (2, 20, 35, '04:04:29', '00:00:06', 2),
    (2, 20, 26, '04:04:45', '00:00:04', 3),
    (2, 20, 36, '04:05:15', NULL, 4),
    (2, 20, 40, '04:05:29', NULL, 5),
    (2, 20, 51, '04:05:50', NULL, 6),
    (2, 20, 52, '04:05:55', NULL, 7),
    (2, 20, 53, '04:06:03', NULL, 8),
    (2, 20, 2,  '04:06:05', NULL, 9),
    (2, 20, 54, '04:06:14', NULL, 10)
RETURNING *;

INSERT INTO cycling.result VALUES
    (1, 9,  '79:14:03', 1),
    (1, 34, '79:23:59', 2),
    (1, 6,  '79:24:27', 3),
    (2, 9,  '83:38:56', 1),
    (2, 35, '83:45:14', 2),
    (2, 36, '83:47:45', 3),
    (3, 16, '81:49:18', 1),
    (3, 39, '81:51:54', 2),
    (3, 40, '81:52:31', 3),
    (4, 45, '24:36:07', 1),
    (4, 46, '24:36:11', 2),
    (4, 47, '24:36:17', 3)
RETURNING *;
