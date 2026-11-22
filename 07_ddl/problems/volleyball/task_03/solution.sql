-- Data Definition (DDL) · Problem task — Volleyball — Task 3: Matches, line-ups and statistics
-- (run the schema with deferrable constraints and its data first — see ../task_01/)

-- Match results
CREATE TABLE volleyball.match (
    match_id integer PRIMARY KEY,
    team1_id integer REFERENCES volleyball.national_team NOT NULL,
    team2_id integer REFERENCES volleyball.national_team NOT NULL,
    team1_sets integer NOT NULL,
    team2_sets integer NOT NULL,
    team1_points integer NOT NULL,
    team2_points integer NOT NULL,
    CHECK(team1_id < team2_id),
    CHECK((team1_sets = 3 AND team2_sets IN (0,1,2)) OR (team2_sets = 3 AND team1_sets IN (0,1,2))),
    UNIQUE(team1_id, team2_id)
);

-- Team line-up on the court
CREATE TABLE volleyball.lineup (
    player_id integer NOT NULL,
    player_position varchar(3) NOT NULL,
    match_id integer NOT NULL references volleyball.match,
    representation_id integer NOT NULL references volleyball.national_team,
    PRIMARY KEY(player_id, match_id),
    CHECK(player_position IN ('L', 'MB', 'OH', 'OP', 'S')),
    FOREIGN KEY(player_id, representation_id) references volleyball.athlete (athlete_id, national_team_id)
);

-- Team points in each set
CREATE TABLE volleyball.match_stats (
    match_id integer references volleyball.match NOT NULL,
    set_id integer NOT NULL,
    team1_points integer NOT NULL,
    team2_points integer NOT NULL,
    CHECK(set_id IN (1,2,3,4,5)),
    CHECK (team1_points >= 0 AND team2_points >= 0),
    PRIMARY KEY(match_id, set_id)
);

-- Athlete points in each set (serve, attack, block)
CREATE TABLE volleyball.player_stats (
    match_id integer references volleyball.match NOT NULL,
    set_id integer NOT NULL,
    player_id integer NOT NULL,
    point_type varchar(6) NOT NULL,
    points integer NOT NULL,
    CHECK(point_type IN ('serve', 'attack', 'block')),
    CHECK (points >= 0),
    FOREIGN KEY(match_id, set_id) references volleyball.match_stats(match_id, set_id),
    FOREIGN KEY(player_id, match_id) references volleyball.lineup(player_id, match_id),
    PRIMARY KEY(match_id, set_id, player_id, point_type)
);


-- Test data (order: match → lineup, match_stats → player_stats)
INSERT INTO volleyball.match VALUES (1, 1, 2, 3, 0, 75, 31);

INSERT INTO volleyball.lineup VALUES
    (9, 'OP', 1, 1),
    (5, 'OH', 1, 1),
    (3, 'S', 1, 1),
    (17, 'S', 1, 2),
    (19, 'OH', 1, 2),
    (25, 'MB', 1, 2);

-- Test: Giannelli (Italy) in Poland's line-up – foreign key error (player_id, representation_id)
-- INSERT INTO volleyball.lineup VALUES (17, 'S', 1, 1);

INSERT INTO volleyball.match_stats VALUES
    (1, 1, 25, 17),
    (1, 2, 25, 7),
    (1, 3, 25, 7);

INSERT INTO volleyball.player_stats VALUES
    (1, 1, 5, 'serve', 5),
    (1, 1, 9, 'attack', 6),
    (1, 2, 9, 'attack', 4),
    (1, 1, 19, 'attack', 3),
    (1, 3, 25, 'block', 2);
