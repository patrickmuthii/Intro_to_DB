CREATE DATABASE IF NOT EXIST alx_book_store;

USE alx_book_store;

CREATE TABLE Books (
	book_id INT AUTO_INCREMENT PRIMARY  KEY,
	title VARCHAR(130),
	author_id INT,
	price DOUBLE NOT NULL,
        publication_date Date NOT NULL,
	FOREIGN KEY (author_id) REFERENCES Authors (author_id));

--creating authors table
CREATE TABLE Authors(
	author_id INT AUTO_INCREMENT PRIMARY KEY,
	author_name VARCHAR(215) NOT NULL
);

--creatin customer table

CREATE TABLE Customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(215) NOT NULL,
	email VARCHAR(215) NOT NULL,
	address TEXT NOT NULL
);

--Creating order Detail table

CREATE TABLE Order_Details (
	orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
	order_id INT,
	book_id INT,
	quantity DOUBLE NOT NULL
	FOREIGN KEY(order_id) REFERENCES Orders(order_id),
	FOREIGN KEY(book_id) REFERENCES Books(book_id)
);

--creating Order table

CREATE TABLE Orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	order_date DATE NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

