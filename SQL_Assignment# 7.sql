--Assignment #1
USE db_zooTest2
GO
SELECT * FROM tbl_habitat;

--Assignment #2
SELECT species_name FROM tbl_species WHERE species_order = 3;

--Assignment #3
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;

--Assignment #4
SELECT species_name FROM tbl_species WHERE species_nutrition > 2202 AND species_nutrition < 2206;

--Assignment #5
SELECT s.species_name AS 'Species Name:' ,n.nutrition_type AS 'Nutrition Type:'
FROM tbl_species AS s, tbl_nutrition AS n
WHERE s.species_nutrition = n.nutrition_id;

--Assignment #6
SELECT 
tbl_specialist.specialist_fname,
tbl_specialist.specialist_lname,
tbl_specialist.specialist_contact,
tbl_species.species_name
FROM tbl_species
JOIN tbl_care ON tbl_species.species_care = tbl_care.care_id
JOIN tbl_specialist ON tbl_specialist.specialist_id = tbl_care.care_specialist
WHERE species_name = 'penguin'
;

--Assignment #7
CREATE DATABASE db_genshinimpact1

USE db_genshinimpact1

CREATE TABLE tbl_nation (
	nation_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	nation_name VARCHAR(50) NOT NULL
);

INSERT INTO tbl_nation
	(nation_name)
	VALUES
	('mondstadt'),
	('liyue')
;

CREATE TABLE tbl_element (
	element_id INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	element_type VARCHAR(50) NOT NULL,
	element_name VARCHAR(50) NOT NULL
);

INSERT INTO tbl_element
	(element_type, element_name)
	VALUES
	('anemo', 'wind'),
	('geo', 'earth'),
	('electro', 'lightning'),
	('dendro', 'nature'),
	('hydro', 'water'),
	('pyro', 'fire'),
	('cryo', 'ice')
;

CREATE TABLE tbl_characters (
	character_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	character_name VARCHAR(50) NOT NULL,
	character_nation INT NOT NULL CONSTRAINT fk_nation_id FOREIGN KEY REFERENCES tbl_nation(nation_id) ON UPDATE CASCADE ON DELETE CASCADE,
	character_element INT NOT NULL CONSTRAINT fk_element_id FOREIGN KEY REFERENCES tbl_element(element_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_characters
	(character_name, character_element, character_nation )
	VALUES
	('amber', 1005, 1),
	('barbara' , 1004, 1),
	('beidou' , 1002, 2),
	('benneth', 1005, 1),
	('chongyun', 1006, 2),
	('diluc', 1005, 1),
	('fischl', 1002, 1),
	('jean', 1000, 1),
	('keaya', 1006, 1),
	('keqing', 1002, 2),
	('klee', 1005, 1),
	('lisa', 1002, 1),
	('mona', 1004, 1),
	('ningguang', 1001, 2),
	('noelle', 1001, 1),
	('qiqi', 1006, 2),
	('razor', 1002, 1),
	('sucrose', 1000, 1),
	('venti', 1000, 1),
	('xiangling', 1005, 2),
	('xingqiu', 1004, 2)
;

SELECT * FROM tbl_nation;
SELECT * FROM tbl_element;
SELECT * FROM tbl_characters;

SELECT
	c.character_name,
	e.element_name,
	n.nation_name
	FROM tbl_characters c
	JOIN tbl_element e ON e.element_id = c.character_element
	JOIN tbl_nation n ON n.nation_id = c.character_nation
	WHERE element_name = 'ice'
;