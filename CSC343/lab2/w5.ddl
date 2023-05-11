CREATE TABLE IF NOT EXISTS ExtraordinaryCitizen ( 
    cid INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL,
    Weight SMALLINT NOT NULL,
    BirthPlace VARCHAR(100),
    Age INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Superhero (
    sid INT PRIMARY KEY,
    LastKnown VARCHAR(100) NOT NULL,
    PeopleSaved INT NOT NULL,
    CONSTRAINT SUPERHERO_FK FOREIGN KEY (sid) REFERENCES ExtraordinaryCitizen(cid)
);

CREATE TABLE IF NOT EXISTS Villain (
    vid INT PRIMARY KEY,
    PeopleKilled INT NOT NULL,
    Imprisonment BOOLEAN NOT NULL,
    CONSTRAINT VILLAINS_FK FOREIGN KEY (vid) REFERENCES ExtraordinaryCitizen(cid)
);

CREATE TABLE IF NOT EXISTS Archenemies (
    sid INT,
    vid INT,
    CONSTRAINT SUPERHEROENEMY_FK FOREIGN KEY (sid) REFERENCES Superhero(sid),
    CONSTRAINT VILLAINSENEMY_FK FOREIGN KEY (vid) REFERENCES Villain(vid),
    PRIMARY KEY(sid, vid)
);

CREATE TABLE IF NOT EXISTS Alias (
    cid INT,
    Name VARCHAR(100),
    CONSTRAINT SUPERHEROVILLAINALIAS_FK FOREIGN KEY (cid) REFERENCES ExtraordinaryCitizen(cid),
    PRIMARY KEY(cid, Name)
);

CREATE TABLE IF NOT EXISTS PowerGrid (
    cid INT PRIMARY KEY,
    Intelligence SMALLINT NOT NULL,
    EnergyProjection SMALLINT NOT NULL,
    Durability SMALLINT NOT NULL,
    Strength SMALLINT NOT NULL,
    Speed SMALLINT NOT NULL,
    FightingSkills SMALLINT NOT NULL,
    CONSTRAINT SUPERHEROVILLAINPOWERGRID_FK FOREIGN KEY (cid) REFERENCES ExtraordinaryCitizen(cid)
);
--