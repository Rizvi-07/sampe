CREATE OR REPLACE PACKAGE addPackage as
	
	PROCEDURE addBook(
		title in BOOK.bookTitle%TYPE,
		author in BOOK.bookAuthor%TYPE,
		genre in BOOK.bookGenre%TYPE,
		price in BOOK.bookPrice%TYPE,
		quantity in BOOK3.bookQuantity%TYPE,
		available in BOOK3.bookAvailable%TYPE
		);

END addPackage;
/

CREATE OR REPLACE PACKAGE BODY addPackage as

	PROCEDURE addBook(
		title in BOOK.bookTitle%TYPE,
		author in BOOK.bookAuthor%TYPE,
		genre in BOOK.bookGenre%TYPE,
		price in BOOK.bookPrice%TYPE,
		quantity in BOOK3.bookQuantity%TYPE,
		available in BOOK3.bookAvailable%TYPE
		)
		IS
		x number;
		title1 BOOK.bookTitle%TYPE;
		author1 BOOK.bookAuthor%TYPE;
		genre1 BOOK.bookGenre%TYPE;
		price1 BOOK.bookPrice%TYPE;
		quantity1 BOOK3.bookQuantity%TYPE;
		available1 BOOK3.bookAvailable%TYPE;
		
		cursor cur(a number) is
		select * from main_book where bookprice<100 and bookid=a;
		cursor cur2(a number) is
		select * from main_book where bookprice>=100 and bookid=a;
BEGIN
	if genre = 'Story' then
	select seqBookStory.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);	
	elsif genre = 'Comics' then
	select seqBookComics.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Sports' then
	select seqBookSports.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Novel' then
	select seqBookNovel.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Drama' then
	select seqBookDrama.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'History' then
	select seqBookHistory.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'ScienceFiction' then
	select seqBookScienceFiction.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'NonFiction' then
	select seqBookNonFiction.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Adventure' then
	select seqBookAdventure.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Travel' then
	select seqBookTravel.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Mystery' then
	select seqBookMystery.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Photography' then
	select seqBookPhotography.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Poetry' then
	select seqBookPoetry.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Education' then
	select seqBookEducation.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Engineering' then
	select seqBookEngineering.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Medical' then
	select seqBookMedical.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	elsif genre = 'Religious' then
	select seqBookReligious.nextval into x from dual;
		INSERT INTO main_book (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (x,title,author,genre,price,quantity,available);
	else
		DBMS_OUTPUT.PUT_LINE('Book Genre Not Authentic !');
	end if;
	OPEN cur(x);
	LOOP
	
	FETCH cur INTO x,title1,author1,genre1,price1,quantity1,available1;
	EXIT WHEN cur%notfound;
	DBMS_OUTPUT.PUT_LINE('Book Genre Not Authentic !');
	INSERT INTO BOOK3(bookId,bookQuantity,bookAvailable) VALUES(x,quantity1,available1);
	INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice) VALUES (x,title1,author1,genre1,price1);	
		
	
	END LOOP;
	CLOSE cur;
	OPEN cur2(x);
	LOOP
	
	FETCH cur2 INTO x,title1,author1,genre1,price1,quantity1,available1;
	EXIT WHEN cur2%notfound;
	DBMS_OUTPUT.PUT_LINE('Book Genre Not Authentic !');
	INSERT INTO BOOK3(bookId,bookQuantity,bookAvailable) VALUES(x,quantity1,available1);

	INSERT INTO BOOK2 (bookId,bookTitle,bookAuthor,bookGenre,bookPrice) VALUES (x,title1,author1,genre1,price1);

	
	END LOOP;
	CLOSE cur2;
	commit;	
	
	
	
END addBook;
END addPackage;
/