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

## =========================================
## Chapter 2
## =========================================
CREATE DATABASE drinks;

USE drinks;

CREATE TABLE easy_drinks
(
	drink_name VARCHAR(50) NOT NULL,
	main VARCHAR(50) NOT NULL,
	amount1 DEC(3,1) NOT NULL,
	second VARCHAR(50) NOT NULL,
	amount2 DEC(4,2) NOT NULL,
	directions VARCHAR(200)
);

INSERT INTO easy_drinks 
VALUES 
('Blackthorn', 'tonic water', 1.5, 'pineapple juice', 1, 
	'stir with ice, strain into cocktail glass with lemon twist'),
('Blue Moon', 'soda', 1.5, 'blueberry juice', .75, 
	'stir with ice, strain into cocktail glass with lemon twist'),
('Oh My Gosh', 'peach nectar', 1, 'pineapple juice', 1, 
	'stir with ice, strain into shot glass'),
('Lime Fizz', 'Sprite', 1.5, 'lime juice', .75, 
	'stir with ice, strain into cocktail glass'),
('Kiss on the Lips', 'cherry juice', 2, 'apricot nectar', 7, 
	'server over ice with straw'),
('Hot Gold', 'peach nectar', 3, 'orange juice', 6, 
	'pour hot orange juice in mug and add peach nectar'),
('Lone Tree', 'soda', 1.5, 'cherry juice', .75, 
	'stir with ice, strain into cocktail glass'),
('Greyhound', 'soda', 1.5, 'grapefruit juice', 5, 
	'serve over ice, stir well'),
('Indian Summer', 'apple juice', 2, 'hot tea', 6, 
	'add juice to mug and top off with hot tea'),
('Bull Frog', 'iced tea', 1.5, 'lemonade', 5, 
	'serve over ice with lime slice'),
('Soda and lt', 'soda', 2, 'grape juice', 1, 
	'shake in cocktail glass, no ice');
