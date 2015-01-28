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
	interest VARCHAR(100),
	seeking VARCHAR(100)
);