-- Data Definition (DDL) · T4/A — Formula 1 tables
-- run ../t2_b/solution.sql (formula1 schema) first

DROP table IF EXISTS formula1.competitors, formula1.results, formula1.races;
CREATE table formula1.competitors(
    competitor_id bigint NOT NULL PRIMARY KEY CHECK(competitor_id BETWEEN 1 AND 999999),
    surname varchar(30) NOT NULL,
    firstname varchar(20) NOT NULL,
    nationality varchar(20) NOT NULL,
    team_name varchar(50) NOT NULL,
    date_of_birth date NOT NULL,
    classification_points integer NOT NULL,
    CHECK(classification_points BETWEEN 0 AND 100)
);

CREATE table formula1.races(
    race_id bigint NOT NULL PRIMARY KEY CHECK(race_id BETWEEN 1 AND 999),
    track_name varchar(30) NOT NULL,
    laps integer NOT NULL,
    country varchar(50) NOT NULL,
    race_date date NOT NULL,
    CHECK(laps BETWEEN 0 AND 100)
);

CREATE table formula1.results(
    competitor_id bigint NOT NULL,
    race_id bigint NOT NULL,
    place integer NOT NULL,
    race_time interval NOT NULL,
    starting_position integer,
    CONSTRAINT RESULTS_PK PRIMARY KEY(competitor_id, race_id),
    CONSTRAINT RESULTS_ID_COMPETITOR_FK FOREIGN KEY(competitor_id) references formula1.competitors (competitor_id),
    CONSTRAINT RESULTS_ID_RACE_FK FOREIGN KEY(race_id) references formula1.races (race_id),
    CHECK((place BETWEEN 1 AND 999) AND (starting_position BETWEEN 1 AND 999))
);
