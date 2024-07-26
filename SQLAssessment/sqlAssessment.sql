DROP TABLE IF EXISTS employee, contact, address;
CREATE TABLE employee (
    id INT PRIMARY KEY,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    age INT CHECK (age >= 18 AND age <= 150),
    hiredate DATE NOT NULL
);
INSERT INTO employee
    (id, fname, lname, age, hiredate)
VALUES
    (01, 'Alan', 'Palmer', 32, '2019-12-15'),
    (02, 'Susan', 'Shepard', 28, '2015-07-21'),
    (03, 'Justin', 'Ward', 43, '2017-08-24'),
    (04, 'Alan', 'Smith', 30, '2017-06-22'),
    (05, 'James', 'Betternot', 26, '2017-06-22'),
    (06, 'Ralph', 'White', 44, '2017-06-23'),
    (07, 'Leonard', 'Nimoy', 72, '2007-12-14'),
    (08, 'Janice', 'Rand', 61, '2016-07-06'),
    (09, 'Harry', 'Mudd', 65, '2020-07-06'),
    (10, 'Hikaru', 'Sulu', 58, '2015-03-21'),
    (11, 'James', 'Kirk', 59, '2014-01-02'),
    (12, 'Leonard', 'McCoy', 65, '2015-08-21'),
    (13, 'Pavel', 'Chekov', 44, '2014-10-15'),
    (14, 'Christopher', 'Pike', 32, '2014-11-24'),
    (15, 'Darth', 'Vader', 124, '2015-03-22'),
    (16, 'Boba', 'Fett', 49, '2015-03-22'),
    (17, 'Luke', 'Skywalker', 66, '2019-11-11'),
    (18, 'Han', 'Solo', 73, '2012-02-03'),
    (19, 'Kylo', 'Ren', 34, '2020-06-14'),
    (20, 'Galen', 'Erso', 55, '2020-06-14');
CREATE TABLE address (
    id INT PRIMARY KEY,
    address1 VARCHAR(50) NOT NULL,
    address2 VARCHAR(50),
    city VARCHAR(50) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(5) NOT NULL
);
INSERT INTO address
    (id, address1, address2, city, state, zip)
VALUES
    (01, '1211 Sudan St', NULL, 'Mobile', 'AL', '36609'),
    (02, '4800 Barkshire Dr', NULL, 'Pace', 'FL', '32571'),
    (03, '12 Nutmeg Ct', NULL, 'Culver City', 'CA', '90211'),
    (04, '2142 Elmwood Pl', NULL, 'Johnson City', 'TN', '37112'),
    (05, '777 Heavenly Ln', 'Box 13', 'Pike City', 'MN', '50877');
CREATE TABLE contact (
    id INT PRIMARY KEY,
    cellphone VARCHAR(10),
    homephone VARCHAR(10),
    email VARCHAR(50) NOT NULL
);
INSERT INTO contact
    (id, cellphone, homephone, email)
VALUES
    (01, '5121325343', '5125234234', 'apalmer@yachtmail.com'),
    (02, '5129739834', '5129847873', 'sshepard@yorkdevtraining.com'),
    (03, '6453898502', '6459872345', 'jsward2007@yahoo.com'),
    (04, '8763238756', '8763736548', 'alsmith999@gmail.com'),
    (05, '8880345966', '8888567987', 'james.betternot@hotmail.com'),
    (06, '3322827765', '3328760098', 'ralph.white264@aol.com');
SELECT e.fname, e.lname, e.age, a.city, a.state
FROM employee e
INNER JOIN address a ON e.id = a.id
WHERE e.fname = 'Alan';
SELECT e.fname, e.lname, e.age, a.city, a.state, c.email
FROM employee e
INNER JOIN address a ON e.id = a.id
INNER JOIN contact c ON e.id = c.id
WHERE c.email = 'james.betternot@hotmail.com';

UPDATE contact c SET cellphone = '4383991212'
WHERE c.id IN ( 
SELECT e.id 
FROM employee e
WHERE e.fname = 'Susan' AND e.lname = 'Shepard' 
);

