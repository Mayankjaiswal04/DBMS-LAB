CREATE DATABASE Library;
USE Library;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    YearPublished INT
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE BorrowingRecords (
    RecordID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Books (BookID, Title, Author, Genre, YearPublished) VALUES
(1, '1984', 'George Orwell', 'Dystopian', 1949),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960);

INSERT INTO Members (MemberID, Name, ContactInfo) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com');

INSERT INTO BorrowingRecords (RecordID, BookID, MemberID, BorrowDate, ReturnDate) VALUES
(1, 1, 1, '2024-11-01', '2024-11-15'),
(2, 2, 2, '2024-11-05', '2024-11-20');

-- List all books
SELECT * FROM Books;

-- Find books borrowed by a specific member
SELECT Books.Title
FROM Books
JOIN BorrowingRecords ON Books.BookID = BorrowingRecords.BookID
WHERE BorrowingRecords.MemberID = 1;

-- Check which books are currently borrowed
SELECT Books.Title
FROM Books
JOIN BorrowingRecords ON Books.BookID = BorrowingRecords.BookID
WHERE BorrowingRecords.ReturnDate IS NULL;
