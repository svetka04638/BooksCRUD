USE test;

DROP TABLE IF EXISTS book;

USE book;

CREATE TABLE book(id INT(11) NOT NULL AUTO_INCREMENT,
title varchar(100) NOT NULL, description varchar(255) NOT NULL,
author varchar(100) NOT NULL, isbn varchar(20) NOT NULL, printYear INT(4) NOT NULL, 
readAlready Bit(1) NOT NULL, PRIMARY KEY(id));

INSERT INTO book (title, description, author, isbn, printYear) 
VALUES ( 'Modern man in search of a soul' , 'psychology',
'Carl Yung', '9780156612067', 1955), 
('An American Tragedy', '','Theodore Dreiser', '9780451531551',
2010),
('Sister Carrie', '', 'Theodore Dreiser', '9781720597704', 2018),
('Jennie Gerhardt', '', 'Theodore Dreiser', '9781530962792', 2016),
('The Financier', '', 'Theodore Dreiser', '9781974467310',2017),
('The Outsider', '', 'Stephen King', '9781501180989', 2018),
('The Body', '', 'Stephen King', '9781982103538', 2018),
('Flowers for Algernon', '', 'Daniel Keyes', '9780156030304', 2005),
('1984', '', 'George Orwell', '9780451524935', 1961),
('The Idiot', '', 'Fyodor Dostoevsky', '9780375702242', 2003),
('The Goldfinch', '', 'Donna Tart', '9780316055444', 2015),
('Mark Kistler Draw Squad', '', 'Mark Kistler', '9780671656942', 1988),
('Jane Eyre', '', 'Emily Bronte', '9780553211405', 1983),
('The Metamorphosis', '', 'Franz Kafka', '9781557427663', 2009),
('The Castle', '', 'Franz Kafka', '9780805211061', 1998),
('The Stranger', '', 'Albert Camus', '9780679720201', 1989),
('The Plague', '', 'Albert Camus', '9780679720218', 1991),
('Oblomov', '', 'Ivan Goncharov', '9780140449877', 2005),
('Same Old Story', '', 'Ivan Goncharov', '9781933480404', 2017),
('Yama', '', 'Aleksanr Kuprin', '9781519384386',2015),
('Heart of a Dog', '', 'Mikhail Bulgakov', '9780802150592', 1994),
('Three Comrades', '', 'Erich Maria Remarque', '9780449912423', 1998),
('Arch of Triumph', '', 'Erich Maria Remarque', '9780449912454',1998),
('Turtles all the way down', '', 'John Green', '9780525555360', 2017),
('The Woman in the woods', '', 'John Connolly', '9781501171925',2018),
('The Rooster Bar', '', 'John Grisham', '9781473616998', 2018),
('Oceans Ventured', '', 'John Lehman', '9780393254259',2018);




