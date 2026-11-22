-- Data Definition (DDL) · Problem task — Volleyball — Task 1: Why the data cannot be inserted
-- (standalone script: rebuilds the schema with deferred constraints and inserts the data in one transaction)

/* 	
	Model: Volleyball
	Version: 1.1.0
	Date: 2025-11-27
	Author: Tomasz Potempa / Department of Computer Science
	Company: University of Applied Sciences in Tarnów
*/

-- Create objects
CREATE SCHEMA IF NOT EXISTS volleyball;

ALTER TABLE IF EXISTS volleyball.national_team
	DROP CONSTRAINT IF EXISTS "national_team_captain_national_team_id_fkey";
ALTER TABLE IF EXISTS volleyball.athlete
	DROP CONSTRAINT IF EXISTS "athlete_national_team_id_fkey";

DROP TABLE IF EXISTS volleyball.national_team;
DROP TABLE IF EXISTS volleyball.athlete;

CREATE TABLE volleyball.national_team (
	national_team_id integer PRIMARY KEY,
	national_team_name character varying(100) UNIQUE NOT NULL,
	country_code character(3) UNIQUE NOT NULL,
	captain integer NOT NULL
);

CREATE TABLE volleyball.athlete (
	athlete_id integer PRIMARY KEY,
	first_name character varying(50) NOT NULL,
	last_name character varying(50) NOT NULL,
	national_team_id integer NOT NULL,
	position character varying(3),
	UNIQUE (athlete_id, national_team_id)
);

ALTER TABLE volleyball.national_team
	ADD CONSTRAINT "national_team_captain_national_team_id_fkey"
	FOREIGN KEY (captain, national_team_id)
	REFERENCES volleyball.athlete (athlete_id, national_team_id)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
	DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE volleyball.athlete
	ADD CONSTRAINT "athlete_national_team_id_fkey"
	FOREIGN KEY (national_team_id)
	REFERENCES volleyball.national_team
	ON UPDATE CASCADE
	ON DELETE CASCADE
	DEFERRABLE INITIALLY DEFERRED;

-- Fill in data
/*
	Glossary:
	L  : libero
	MB : middle blocker/hitter
	OH : outside hitter eg. left-side hitter
	OP : opposite spiker eg. right-side spiker
	S  : setter
*/
BEGIN;

INSERT INTO volleyball.national_team VALUES
	(1, 'Poland', 'POL', 9),
	(2, 'Italy', 'ITA', 17),
	(3, 'Slovenia', 'SVN', 35),
	(4, 'Serbia', 'SRB', 50);

-- Poland
INSERT INTO volleyball.athlete VALUES
	(1, 'Paweł', 'Zatorski', 1, 'L'),
	(2, 'Jakub', 'Popiwczak', 1, 'L'),
	(3, 'Marcin', 'Janusz', 1, 'S'),
	(4, 'Grzegorz', 'Łomacz', 1, 'S'),
	(5, 'Aleksander', 'Śliwka', 1, 'OH'),
	(6, 'Wilfredo', 'León', 1, 'OH'),
	(7, 'Tomasz', 'Fornal', 1, 'OH'),
	(8, 'Kamil', 'Semeniuk', 1, 'OH'),
	(9, 'Bartosz', 'Kurek', 1, 'OP'),
	(10, 'Łukasz', 'Kaczmarek', 1, 'OP'),
	(11, 'Jakub', 'Kochanowski', 1, 'MB'),
	(12, 'Mateusz', 'Bieniek', 1, 'MB'),
	(13, 'Norbert', 'Huber', 1, 'MB'),
	(14, 'Karol', 'Kłos', 1, 'MB'),
	(15, 'Bartosz', 'Bednorz', 1, 'OH');

-- Italy
INSERT INTO volleyball.athlete VALUES
	(16, 'Fabio', 'Balaso', 2, 'L'),
	(17, 'Simone', 'Giannelli', 2, 'S'),
	(18, 'Riccardo', 'Sbertoli', 2, 'S'),
	(19, 'Alessandro', 'Michieletto', 2, 'OH'),
	(20, 'Daniele', 'Lavia', 2, 'OH'),
	(21, 'Tommaso', 'Rinaldi', 2, 'OH'),
	(22, 'Francesco', 'Recine', 2, 'OH'),
	(23, 'Yuri', 'Romanò', 2, 'OP'),
	(24, 'Alessandro', 'Bovolenta', 2, 'OP'),
	(25, 'Simone', 'Anzani', 2, 'MB'),
	(26, 'Gianluca', 'Galassi', 2, 'MB'),
	(27, 'Roberto', 'Russo', 2, 'MB'),
	(28, 'Giovanni', 'Sanguinetti', 2, 'MB'),
	(29, 'Leonardo', 'Scanferla', 2, 'L'),
	(30, 'Mattia', 'Bottolo', 2, 'OH');

-- Slovenia
INSERT INTO volleyball.athlete VALUES
	(31, 'Jani', 'Kovačič', 3, 'L'),
	(32, 'Urban', 'Toman', 3, 'L'),
	(33, 'Gregor', 'Ropret', 3, 'S'),
	(34, 'Uroš', 'Planinšič', 3, 'S'),
	(35, 'Tine', 'Urnaut', 3, 'OH'),
	(36, 'Klemen', 'Čebulj', 3, 'OH'),
	(37, 'Rok', 'Možič', 3, 'OH'),
	(38, 'Žiga', 'Štern', 3, 'OH'),
	(39, 'Tonček', 'Štern', 3, 'OP'),
	(40, 'Nik', 'Mujanović', 3, 'OP'),
	(41, 'Alen', 'Pajenk', 3, 'MB'),
	(42, 'Jan', 'Kozamernik', 3, 'MB'),
	(43, 'Sašo', 'Štalekar', 3, 'MB'),
	(44, 'Danijel', 'Koncilja', 3, 'MB'),
	(45, 'Janž', 'Kržič', 3, 'MB');

-- Serbia
INSERT INTO volleyball.athlete VALUES
	(46, 'Milorad', 'Kapur', 4, 'L'),
	(47, 'Stefan', 'Negić', 4, 'L'),
	(48, 'Nikola', 'Jovović', 4, 'S'),
	(49, 'Vuk', 'Todorović', 4, 'S'),
	(50, 'Uroš', 'Kovačević', 4, 'OH'),
	(51, 'Marko', 'Ivović', 4, 'OH'),
	(52, 'Miran', 'Kujundžić', 4, 'OH'),
	(53, 'Pavle', 'Perić', 4, 'OH'),
	(54, 'Aleksandar', 'Atanasijević', 4, 'OP'),
	(55, 'Dražen', 'Luburić', 4, 'OP'),
	(56, 'Marko', 'Podraščanin', 4, 'MB'),
	(57, 'Srećko', 'Lisinac', 4, 'MB'),
	(58, 'Petar', 'Krsmanović', 4, 'MB'),
	(59, 'Aleksandar', 'Nedeljković', 4, 'MB'),
	(60, 'Nemanja', 'Mašulović', 4, 'MB');

COMMIT;
