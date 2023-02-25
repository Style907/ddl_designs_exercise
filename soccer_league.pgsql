DROP DATABASE IF EXISTS league_info;

CREATE DATABASE league_info;

\c league_info;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL

);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
    
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    team_1_id INTEGER REFERENCES teams NOT NULL,
    team_2_id INTEGER REFERENCES teams NOT NULL,
    ref_id INTEGER REFERENCES referees NOT NULL,
    score TEXT NOT NULL,
    winner_id INTEGER REFERENCES teams NOT NULL
    
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULL,
    num_goals INTEGER NOT NULL
    
);

INSERT INTO teams (team_name) VALUES
('thundercats'),
('voltron'),
('destroyers'),
('vikings');

INSERT INTO players (name, team_id) VALUES
('john', 1),
('tom', 1),
('mike', 1),
('mark', 2),
('james', 2),
('dean', 2),
('cory', 3),
('sam', 3),
('conrad', 3),
('joe', 4),
('tien', 4),
('toad', 4);

INSERT INTO referees (name) VALUES
('todd'),
('susan');

INSERT INTO matches (team_1_id, team_2_id, ref_id, score, winner_id) VALUES
(1,2,1,'1-2',1),
(3,4,2,'2-3',3);

INSERT INTO goals (player_id, match_id, num_goals) VALUES
(1,1,2),
(2,1,1),
(7,2,1),
(8,2,2),
(11,2,2);