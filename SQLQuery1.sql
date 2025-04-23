use TEST ;
-- Create StudentDetails table
CREATE TABLE StudentDetails (
    S_ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    ADDRESS VARCHAR(255)
);

INSERT INTO StudentDetails (S_ID, NAME, ADDRESS)
VALUES
    (1, 'Harsh', 'Kolkata'),
    (2, 'Ashish', 'Durgapur'),
    (3, 'Pratik', 'Delhi'),
    (4, 'Dhanraj', 'Bihar'),
    (5, 'Ram', 'Rajasthan');
	select * from StudentDetails ;
-- Create StudentMarks table
CREATE TABLE StudentMarks (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    Marks INT,
    Age INT
);

INSERT INTO StudentMarks (ID, NAME, Marks, Age)
VALUES
    (1, 'Harsh', 90, 19),
    (2, 'Suresh', 50, 20),
    (3, 'Pratik', 80, 19),
    (4, 'Dhanraj', 95, 21),
    (5, 'Ram', 85, 18);


Alter  VIEW DetailsView as 
select S_ID , NAME , ADDRESS from StudentDetails ; 

select * from DetailsView ;

INSERT INTO DetailsView (S_ID,NAME, ADDRESS)
VALUES(6,'Suresh','Gurgaon');

delete from DetailsView where S_ID = 6 ;