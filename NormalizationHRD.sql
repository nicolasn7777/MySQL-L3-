CREATE DATABASE NormHRD;

USE NormHRD;

CREATE TABLE personal_data
(
	id int auto_increment,
	first_name Varchar(20) NOT NULL,
	last_name Varchar(20) NOT NULL,
	middle_name Varchar(20) NOT NULL,
	sex Varchar(8) NOT NULL,
	nationality Varchar(20) NOT NULL,
    date_of_birth date NOT NULL,
    city_of_birth Varchar(40) NOT NULL,
    identify_number int NOT NULL,
    who_issued_the_passport Varchar(50) NOT NULL,
    passport_issue_date date NOT NULL,
    number_passport Varchar(8) NOT NULL,
    address_of_living Varchar(40) NOT NULL,
    educational_level Varchar(50) NULL,
    phone_nmber Varchar(20) NOT NULL,
    email Varchar(50) NOT NULL,
    primary key(id)	
);

INSERT INTO personal_data             
(first_name, last_name, middle_name, sex, nationality, date_of_birth, city_of_birth, identify_number, who_issued_the_passport, passport_issue_date, number_passport, address_of_living, educational_level, phone_nmber, email) 
VALUES
('Марія', 'Гришко', 'Іванівна', 'жіноча', 'українка', '1997-01-01', 'Суми', 1111111111, 'Сумським МВУМВС', '2013-01-12', 'СМ568945', 'м.Суми, вул.Незалежності 7, кв.44', 'Бакалавр', '+380635555565', 'mii@gmail.com'),
('Сергій', 'Вертелецький', 'Анатолійович', 'чоловіча', 'українець', '1996-05-06', 'Харків', 1111111112, 'Харківським МВУМВС', '2012-02-22', 'ХМ568945', 'м.Харків, вул.Соборності 8, кв.4', 'Магістр', '+380635555575', '555697@gmail.com');

DROP TABLE personal_data;

CREATE TABLE name_data
(
	person_id int auto_increment NOT NULL,
	first_name Varchar(20) NOT NULL,
	last_name Varchar(20) NOT NULL,
	middle_name Varchar(20) NOT NULL,
	sex Varchar(8) NOT NULL,
    primary key(person_id)	
);

CREATE TABLE nationality_data
(	
	person_id int NOT NULL,
	nationality Varchar(20) NOT NULL,
    date_of_birth date NOT NULL,
    city_of_birth Varchar(40) NOT NULL,
    FOREIGN KEY(person_id) references name_data(person_id)
);

CREATE TABLE passport_data
(	
	person_id int NOT NULL,
	identify_number int NOT NULL,
    who_issued_the_passport Varchar(50) NOT NULL,
    passport_issue_date date NOT NULL,
    number_passport Varchar(8) NOT NULL,
    FOREIGN KEY(person_id) references name_data(person_id)
);

CREATE TABLE personal_data
(	
	person_id int NOT NULL,
    address_of_living Varchar(40) NOT NULL,
    educational_level Varchar(50) NULL,
    phone_nmber Varchar(20) NOT NULL,
    email Varchar(50) NOT NULL,
    FOREIGN KEY(person_id) references name_data(person_id)
);

INSERT INTO name_data            
(first_name, last_name, middle_name, sex) 
VALUES
('Марія', 'Гришко', 'Іванівна', 'жіноча'),
('Сергій', 'Вертелецький', 'Анатолійович', 'чоловіча');

INSERT INTO nationality_data             
(person_id, nationality, date_of_birth, city_of_birth) 
VALUES
(1, 'українка', '1997-01-01', 'Суми'),
(2, 'українець', '1996-05-06', 'Харків');

INSERT INTO passport_data            
(person_id, identify_number, who_issued_the_passport, passport_issue_date, number_passport) 
VALUES
(1, 1111111111, 'Сумським МВУМВС', '2013-01-12', 'СМ568945'),
(2, 1111111112, 'Харківським МВУМВС', '2012-02-22', 'ХМ568945');

INSERT INTO personal_data             
(person_id, address_of_living, educational_level, phone_nmber, email) 
VALUES
(1, 'м.Суми, вул.Незалежності 7, кв.44', 'Бакалавр', '+380635555565', 'mii@gmail.com'),
(2, 'м.Харків, вул.Соборності 8, кв.4', NULL, '+380635555575', '555697@gmail.com');

