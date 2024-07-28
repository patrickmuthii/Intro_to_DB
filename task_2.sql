--creating table books

CREATE TABLE IF NOT EXISTS books (
	book_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(130) NOT NULL,
        author_id INT,
	price DOUBLE NOT NULL,
	publication_date DATE NOT NULL,
	FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

--creating auhors table

CREATE TABLE IF NOT EXISTS authors (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
	author_name VARCHAR(215)
);

--creating customers table

CREATE TABLE IF NOT EXISTS customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(215) NOT NULL,
	email VARCHAR(215) NOT NULL,
	address TEXT NOT NULL
);

--creating orders table

CREATE TABLE IF NOT EXISTS orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	order_date DATE NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

--creating order details table

CREATE TABLE IF NOT EXISTS Order_details (
	orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
	order_id INT,
	book_id INT,
	quantity DOUBLE NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders (order_id),
	FOREIGN KEY (book_id) REFERENCES books (book_id)
