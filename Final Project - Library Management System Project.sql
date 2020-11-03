--Create database named Library
CREATE DATABASE [LIBRARY]

USE [LIBRARY]

--Create Library_branch table
CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	BranchName VARCHAR(255),
	[Address] VARCHAR(255)
);

--Create Books table
CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(255),
	PublisherName VARCHAR(255)
);

--Create Book_Authors table
CREATE TABLE Book_Authors (
	BookID INT,
	AuthorName VARCHAR(255)
);

--Create Publisher table
CREATE TABLE Publisher (
	PublisherName VARCHAR(255) PRIMARY KEY NOT NULL,
	[Address] VARCHAR(255),
	Phone VARCHAR(50)
);

--Create Book_Copies table
CREATE TABLE Book_Copies (
	BookID INT ,
	BranchID INT,
	Number_Of_Copies INT
);

--Create Borrower table
CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	[Name] VARCHAR(255),
	[Address] VARCHAR(255),
	Phone VARCHAR(50)
);

--Create Book_Loans table
CREATE TABLE Book_Loans (
	BookID INT,
	BranchID INT,
	CardNo INT,
	DateOut DATE,
	DateDue DATE
);

--Adding Foreign Keys
ALTER TABLE Book_Copies
ADD CONSTRAINT fk_bc_bookid FOREIGN KEY (BookID) REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_bc_branchid FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE
;

--Adding Foreign Keys
ALTER TABLE Books
ADD CONSTRAINT fk_b_pubname FOREIGN KEY (PublisherName) REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
;

--Adding Foreign Keys
ALTER TABLE Book_Authors
ADD CONSTRAINT fk_ba_bookid FOREIGN KEY (BookID) REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE
;

--Adding Foreign Keys
ALTER TABLE Book_Loans
ADD CONSTRAINT fk_bl_bookid FOREIGN KEY (BookID) REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_bl_branchid FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_bl_cardno FOREIGN KEY (CardNo) REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE
;

--Inserting records
INSERT INTO Library_Branch(BranchName,[Address])
	VALUES
	('Agincourt','155 Bonis Avenue'),
	('Jane/Dundas', '620 Jane Street'),
	('Sharpstown','444 Sharpstown Street'),
	('St. Lawrence','171 Front Street East'),
	('Forest Hill', '700 Eglinton Avenue West'),
	('Fort York', '190 Fort York Boulevard')
;

--Inserting records
INSERT INTO Borrower([Name], [Address], Phone)
	VALUES
	('Mike Madriaga','10 Gerrard Street East' , '416-857-9996'),
	('Thomas Edison', '9 Guildwood Parkway', '416-888-5483'),
	('Micheal Sison', '22 Roncesvalles Avenue', ''),
	('Albert Einstien', '52 Ellesmere Road', '647-654-8325'),
	('Edith Stern', '962 Islington Avenue', '647-856-3215'),
	('Christopher Hirata ', '564 Jones Avenue', '647-546-5642'),
	('Philip Emeagwali', '242 McRae Drive', '416-522-4245'),
	('Garry Kasparov', '888 Lake Shore Boulevard West' , '432-548-6121')
;

--Inserting records
INSERT INTO Publisher(PublisherName,[Address], Phone)
	VALUES
	('Modern Library', 'New York City, New York', '686-364-8746'),
	('Move Books', 'Beacon Falls', '203-709-0490'),
	('Houghton Mifflin Harcourt', 'Boston, Massachusetts', '800-225-3362'),
	('Signet Classics', 'New York City, New York', '654-872-2525'),
	('Penguin', 'Toronto, Ontario', '648-131-1315'),
	('Cambridge University Press', 'Shaftesbury Road, Cambridge', '1223-326-050'),
	('Simon Schuster', 'King Street East, Toronto', '647-427-8882'),
	('Harper', 'New York City, New York', '546-321-4578'),
	('Vintage International', 'New York City, New York', '467-464-1123'),
	('Bantam Classics', 'New York City, New York', '468-231-2154')
;

--Inserting records
INSERT INTO Books(Title,PublisherName)
	VALUES
	('Pride and Prejudice', 'Modern Library'),
	('The Lost Tribe', 'Move Books'),
	('1984', 'Houghton Mifflin Harcourt'),
	('Animal Farm', 'Signet Classics'),
	('Crime and Punishment', 'Penguin'),
	('Les Misérables', 'Penguin'),
	('Madame Bovary', 'Penguin'),
	('Hamlet', 'Cambridge University Press'),
	('Romeo and Juliet', 'Simon Schuster'),
	('Anxious People', 'Simon Schuster'),
	('One by One', 'Simon Schuster'),
	('One Hundred Years of Solitude','Harper'),
	('The Stranger', 'Vintage International'),
	('The Odyssey', 'Penguin'),
	('Faust, First Part', 'Bantam Classics'),
	('Annes House of Dreams', 'Bantam Classics'),
	('The Awakening', 'Bantam Classics'),
	('Absalom, Absalom!', 'Modern Library'),
	('Dubliners', 'Modern Library'),
	('The Things They Carried', 'Houghton Mifflin Harcourt')
;

--Inserting records
INSERT INTO Book_Authors(BookID,AuthorName)
	VALUES
	(1, 'Jane Austen'),
	(2, 'C.Taylor-Butler'),
	(3, 'George Orwell'),
	(4, 'George Orwell'),
	(5, 'Fyodor Dostoyevsky'),
	(6, 'Victor Hugo'),
	(7, 'Gustave Flaubert'),
	(8, 'William Shakespeare'),
	(9, 'William Shakespeare'),
	(10, 'Fredrik Backman'),
	(11, 'Ruth Ware'),
	(12, 'Gabriel García Márquez'),
	(13, 'Albert Camus'),
	(14, 'Robert Fagles'),
	(15, 'Johann Wolfgang von Goethe'),
	(16, 'L. M. Montgomery'),
	(17, 'Kate Chopin'),
	(18, 'William Faulkner'),
	(19, 'James Joyce'),
	(20, 'Tim Obrien')
;

--Inserting records
INSERT INTO Book_Copies(Number_Of_Copies, BookID, BranchID)
	VALUES
	(3, 1, 1001),
	(5, 2, 1001),
	(3, 3, 1000),
	(6, 4, 1005),
	(5, 5, 1002),
	(4, 6, 1003),
	(2, 7, 1004),
	(7, 8, 1004),
	(2, 9, 1003),
	(3, 10, 1002),
	(10, 11, 1005),
	(6, 12, 1001),
	(7, 13, 1000),
	(1, 14, 1004),
	(2, 15, 1002),
	(3, 16, 1003),
	(4, 17, 1003),
	(7, 18, 1000),
	(5, 19, 1005),
	(4, 20, 1001),
	(2, 2, 1004),
	(5, 7, 1000),
	(6, 2, 1002)
;

--Inserting records
SELECT * FROM Book_Copies
INSERT INTO Book_Loans(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1, 1001, 1, '2020-10-15', '2020-10-22'),
	(2, 1001, 1, '2020-10-22', '2020-10-29'),
	(10, 1002, 2, '2020-9-2', '2020-9-9'),
	(20, 1001, 3, '2020-9-3', '2020-9-10'),
	(6, 1003, 4, '2020-10-29', '2020-11-5'),
	(11, 1005, 5, '2020-9-13', '2020-9-20'),
	(14, 1004, 6, '2020-10-3', '2020-10-10'),
	(2, 1004, 7, '2020-9-11', '2020-9-18'),
	(4, 1005, 8, '2020-10-17', '2020-10-10'),
	(8, 1004, 5, '2020-8-3', '2020-8-10'),
	(2, 1002, 6, '2020-8-26', '2020-9-1')
;

SELECT * FROM (
	(Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo)
	FULL OUTER JOIN Books ON Book_Loans.BookID = Books.BookID
);

--A
CREATE PROCEDURE dbo.uspGetLostTribe

AS

SELECT
	Library_Branch.BranchName,
	Books.Title,
	Book_Copies.Number_Of_Copies
FROM Book_Copies
	JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	JOIN Books ON Books.BookID = Book_Copies.BookID
	WHERE BranchName = 'Sharpstown' AND Title = 'The Lost Tribe'

--Executing dbo.uspGetLostTribe
EXECUTE dbo.uspGetLostTribe

--B
CREATE PROCEDURE dbo.uspGetLostTribe2

AS

SELECT 
	Library_Branch.BranchName,
	Books.Title,
	Book_Copies.Number_Of_Copies
FROM Book_Copies
	JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	JOIN Books ON Books.BookID = Book_Copies.BookID
	WHERE Title = 'The Lost Tribe'

--Executing dbo.uspGetLostTribe2
EXECUTE dbo.uspGetLostTribe2

--C
CREATE PROCEDURE dbo.uspBorrowerCheckOut

AS

SELECT 
	DISTINCT Borrower.[Name]
FROM Book_Loans
	JOIN Borrower ON Borrower.CardNo = Book_Loans.CardNo
	WHERE DateDue !> CAST(GETDATE() AS DATE) 
--Executing dbo.uspBorrowerCheckOut

EXECUTE dbo.uspBorrowerCheckOut