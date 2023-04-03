<p align="center">
  <img src="https://user-images.githubusercontent.com/25421570/229649752-a29b75ac-3c65-468e-9db8-2f0bcfc93bfb.png" alt="ELibraryDB">
</p>


a database system for a library that tracks book information, including authors,
categories, publishers, and availability. Created stored procedures for searching and adding
books, and implemented a trigger to update book availability when a customer borrows or
returns a book. Designed a relational schema to ensure efficient data storage and retrieval,
and optimized queries for fast performance. Used SQL Server Management Studio and
Visual Studio for database development and integration with a web application.


We have multiple tables in our database that the database utilizes to it’s
advantage to carry out it’s task efficiently

● Authors
This table holds information about our book’s authors
1. FirstName
2. MiddleName
3. LastName
4. ContactId (A foreign key to hold the author contactDetails)
5. Bio

● BookAuthors
This table holds a special composite key consisting of the BookId &
the AuthorId Together, It will help us keep track of book authors.
1. BookId
2. AuthorId

● ##Books
Possibly the most important table to get right, this table will hold the
information about books including
1. BookId
2. Title
3. Publisher (id of the publisher)
4. Publication Date
5. ISBN
6. Pages (Number of Pages)
7. Available (the number of books available)
8. Price
9. CategoryId (References the category the book belongs in)
10. Description

● Borrowers
This table will hold information about customers who borrow books
from the library
1. BorrowerId
2. FirstName
3. MiddleName
4. LastName
5. ContactId (References the contact details for this borrower)

● Borrowings
Keeps track of when customers borrow books and the information
related to the borrowing process
1. BorrowId
2. BorrowDate
3. Return Date
4. Due Date
5. Status (Weather the book has been returned or not)
6. BorrowerId (The Customer)
7. BorrowedBookId (The Book Borrowed)

● Categories
The different categories the books in our library can belong to,
The whole point of making this table instead of storing the
information directly on the books table is to open the ability to
easily add and remove categories with easy
1. CategoryId
2. Category (The Name of The Category)

● ContactDetails
Holds the information needed to contact a person , and it’s used by
multiple tables
1. ContactId
2. Email
3. PhoneNumber
4. Website

● Publishers
Information about publishers of the books
1. PublisherId
2. PublisherName
3. ContactId (Reference to contact details)

● Reviews
Allows borrowers the ability to review books and rate them and
comment on them, the rating is checked in a constraint to be maxed
at 5 and the lowest rating is 1
1. ReviewId
2. BorrowerId
3. Rating (Out of Five)
4. Comment (Up To 150 Characters)
5. ReviewDate
6. Bookid (The Book Being Reviewed)
We have multiple views to help us easily traverse through our database’s
information

● ActiveBorrowings
Gives us detailed information on currently borrowed books and by
which customer and how to contact that customer
- To use use simply use the following sql command
```
SELECT [Fullname],[BorrowId],[Borrow Date],[Return Date],[Due Date],[Status],[BorrowerId],[Email],[PhoneNumber],[Title] FROM [ELibraryDB].[dbo].[ActiveBorrowings]
```
● AuthorsView
Returns the Firstname , MiddleName , LastName and the book titles
a author has worked on
- To use use simply use the following sql command
```
SELECT [FirstName],[MiddleName],[Lastname],[Titles Worked On] FROM [ELibraryDB].[dbo].[AuthorsView]
```
● BooksView
Gives everything there is to know about the books, the information
in the books table but also the year they were released , the price
range column which automatically categorizes the books according
to their price and the Size column which also determines a size for
the book based on the number of pages in that book and lastly
concatenates all author names in a single column.
- To use it use the following sql command
```
SELECT [Id],[Title],[Year Released],[Publisher],[ISBN],[Price],[Price Range],[Pages],[Size],[Authors] FROM [ELibraryDB].[dbo].[BooksView]
```
● BorrowersView
Gives us a detailed look onto our beloved borrowers, including their
name , number of reviews , number of borrows and contact
information.
- To use it use the following sql command
```
SELECT [BorrowerId],[Firstname],[MiddleName],[LastName],[Numberof Reviews],[Number of Borrows],[Email],[Website],[PhoneNumber] FROM [ELibraryDB].[dbo].[BorrowersView]
```
We’ve got a lot of stored procedures to help us save time and easily do
tasks using our database. This list is long so I will only provide additional
information when necessary.

1. Borrow
Allows us to borrow a book , assumes by default 30 days borrow
period but we can specify the optional parameter if we want a
duration by using DueInDays Which will add the number of days to
today’s date and set it as the Due date
- Usage
```
EXEC Borrow @BookId = 1,@BorrowerId = 2 , @DueInDays = 28;
```

2. DeleteAuthor/DeleteBook/DeleteBorrower
Allows us to delete records from the corresponding tables
- Usage for all of them is the same
```
EXEC DeleteBorrower @BorrowerId = 1;
```
3. GetABookISBN
Returns a book’s ISBN number
- Usage
```
EXEC GetABookISBN @BookId 1;
```
4. GetAllBooks/GetAuthors/GetAvaliableBooks/GetBooksByCategory
GetBooksByPages/GetBooksByPrice/GetBooksByReviews/
GetBorrowers/GetBorrowings/GetCategories.
All of those stored procedures are used the same by directly
executing them without providing any parameters, each of them
gives different results according to their name.
- Usage
```
EXEC GetAllBooks
```

5. GetAuthorContact
Gets you a particular author's contact details
- Usage
```
EXEC GetAuthorContact @id = 1;
```

6. GetBooksInACategory
Gets you all the books in a single category
- Usage
```
EXEC GetBooksInACategory @Category = 'Science';
```

7. GetBooksInAYear
Gets you all the books in a single year
- Usage
```
EXEC GetBooksInAYear @Year = 2008;
```

8. GetBooksWithinAPriceRange
Gets you books within a specified price range
- Usage
```
EXEC GetBooksWithinAPriceRange @low = 5.99,@high = 15;
```
9. InsertAuthor
Inserts an author into the Authors table
- Usage
```
EXEC InsertAuthor 'John','Mohammad','Kennedy',@contactid =
1,@bio='My Bio';
--- OR ---
EXEC InsertAuthor 'John','Moha','Kennedy',1,'My Bio';
```
10. InsertBook
Inserts a book into the Books table
- Usage
```
EXEC InsertBook @Title='A+
Academy',@Publisher=3,@Date='2008-07-03',@ISBN='1234567891011',@Pages=533,@Avaliable=12,@Price=13.99,@CateGoryId=2,@Description='Hi';
--- OR ---
EXEC InsertBook 'A+ Academy',3,'2008-07-03','1234567891011',533,12,13.99,2,'Hi';
```

11. InsertBorrower
Inserts a borrower in the Borrowers table
- Usage
```
EXEC InsertBorrower
@FirstName='Moath',@MiddleName='Moha',@LastName='Tar',@ContactId=3;
--- OR ---
EXEC InsertBorrower 'Moath','Moha','Tar',3;
```

12.ReturnBook
Returns a borrowed book, takes in two parameters a bookid and a
borrowerid
- Usage
```
EXEC ReturnBook @bookId=3,@BorrowerId=2;
--- OR ---
EXEC ReturnBook 3,2;
```

13.SearchBook
This procedure was made using 59 lines, and it is by far our most
complicated stored procedure and it allows us to use it in multiple
ways.
It declares the following parameters at its start
It sets them null by default so you can use any of them as you like.
@SearchInput NVARCHAR(300) = NULL,
@Author NVARCHAR(90) = NULL,
@Title NVARCHAR(250) = NULL,
@ISBN NVARCHAR(20) = NULL,
@Publisher NVARCHAR(60) = NULL
But we must give it one of them to search for a book.
It uses the LIKE operator so it will match using fuzzy search to the
input given.
The first parameter SearchInput will search for ALL information
about a book like it’s title, isbn, date , authors …etc
But if the searcher wants to search in a specific column he can do so
by specifying a single column.
- Usage (this will fuzzy search all columns)
```
Exec SearchBook @SearchInput='Harry Potter'
--- OR ---
EXEC SearchBook 'Harry Potter';
```
- Usage (Single Column Fuzzy Search)
This will return every single book the author participated in
making even if there are other authors involved
```
Exec SearchBook @Author='Moath'
```
