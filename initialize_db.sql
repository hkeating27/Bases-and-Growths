-- Create the main characters table
CREATE TABLE characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL,
    join_chapter INTEGER,
    join_level INTEGER,
    movement INTEGER
);

--Table of each character
--TODO: If intended to expand, make this more important
INSERT INTO characters (name, join_chapter, join_level, movement) VALUES
('Astrid', 13, 1, 9),
('Rolf', 9, 1, 6);

--SQL tables for each character
CREATE TABLE stats_Astrid (
    level INTEGER PRIMARY KEY,
    base_hp INTEGER,
    hp_growth REAL,
    base_strength INTEGER,
    strength_growth REAL,
    base_magic INTEGER,
    magic_growth REAL,
    base_skill INTEGER,
    skill_growth REAL,
    base_speed INTEGER,
    speed_growth REAL,
    base_luck INTEGER,
    luck_growth REAL,
    base_defense INTEGER,
    defense_growth REAL,
    base_resistance INTEGER,
    resistance_growth REAL
);

CREATE TABLE stats_Rolf (
    level INTEGER PRIMARY KEY,
    base_hp INTEGER,
    hp_growth REAL,
    base_strength INTEGER,
    strength_growth REAL,
    base_magic INTEGER,
    magic_growth REAL,
    base_skill INTEGER,
    skill_growth REAL,
    base_speed INTEGER,
    speed_growth REAL,
    base_luck INTEGER,
    luck_growth REAL,
    base_defense INTEGER,
    defense_growth REAL,
    base_resistance INTEGER,
    resistance_growth REAL
);

--Astrid's base and growth stats
INSERT INTO stats_Astrid VALUES
(1, 20, 0.45, 6, 0.40, 2, 0.20, 6, 0.55, 7, 0.50, 3, 0.25, 5, 0.45, 4, 0.25);

--Rolf's base and growth stats
INSERT INTO stats_Rolf VALUES
(1, 18, 0.60, 5, 0.40, 0, 0.20, 8, 0.45, 6, 0.50, 4, 0.40, 6, 0.30, 2, 0.25);