CREATE DATABASE ArsDB;

USE ArsDB;

CREATE TABLE officer
(
	officer_id int NOT NULL,
    name_and_initials VARCHAR(50) NOT NULL,
    ofice_number VARCHAR(10) NULL,
    platoon int NOT NULL,
    PRIMARY KEY(officer_id) 
);

CREATE TABLE weapon
(
	weapon_id int NOT NULL,
    weapon_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(weapon_id)
);

CREATE TABLE weapons_warehouse
(
	officer_id int NOT NULL,
	weapon_id int NOT NULL,
    name_and_initials VARCHAR(50) NOT NULL,
    military_post VARCHAR(50) NOT NULL,
    FOREIGN KEY(officer_id) references officer(officer_id),
    FOREIGN KEY(weapon_id) references weapon(weapon_id)
);

INSERT INTO officer
(officer_id, name_and_initials, ofice_number, platoon)
VALUES 
(1, 'Петров В.А', 'оф.205', 222),
(2, 'Лодарєв П.С', 'оф.221', 232),
(3, 'Леонтієв К.В', 'оф.201', 212),
(4, 'Духов Р.М', NULL, 200);

INSERT INTO weapon
(weapon_id, weapon_name)
VALUES 
(47, 'AK-47'),
(20, 'Glok20'),
(74, 'AK-74');

INSERT INTO weapons_warehouse
(officer_id, weapon_id, name_and_initials, military_post)
VALUES 
(1, 47, 'Буров О.С.', 'майор'),
(1, 20, 'Рибаков Н.Г.', 'майор'),
(2, 74, 'Деребанов В.Я.', 'підполковник'),
(2, 20, 'Рибаков Н.Г.', 'майор'),
(3, 47, 'Буров О.С.', 'майор'),
(3, 20, 'Рибаков Н.Г.', 'майор'),
(4, 47, 'Буров О.С.', 'майор');

SELECT * FROM weapons_warehouse;