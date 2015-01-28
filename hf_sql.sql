## =========================================
## Chapter 1
## =========================================
CREATE DATABASE gregs_list;

USE gregs_list;

CREATE TABLE my_contacts
(
	last_name VARCHAR(30),
	first_name VARCHAR(20),
	email VARCHAR(50),
	birthday DATE,
	profession VARCHAR(50),
	location VARCHAR(50),
	status VARCHAR(20),
	interests VARCHAR(100),
	seeking VARCHAR(100)
);

DROP TABLE my_contacts;

CREATE TABLE my_contacts
(
	last_name VARCHAR(30),
	first_name VARCHAR(20),
	email VARCHAR(50),
	gender CHAR(1),
	birthday DATE,
	profession VARCHAR(50),
	location VARCHAR(50),
	status VARCHAR(20),
	interests VARCHAR(100),
	seeking VARCHAR(100)
);

INSERT INTO my_contacts
(last_name, first_name, email, gender, birthday, profession,
location, status, interests, seeking)
VALUES
('Anderson', 'Jillian', 'jill_anderson@breakneckpizza.com', 'F', 
'1980-09-05', 'Technical Writer', 'Palo Alto, CA', 'Single', 
'Kayaking, Reptiles', 'Relationship, Friends');

INSERT INTO my_contacts 
(first_name, email, profession, location)
VALUES
('Pat', 'patpost@breakneckpizza.com', 'Postal Worker', 'Princeton, NJ');