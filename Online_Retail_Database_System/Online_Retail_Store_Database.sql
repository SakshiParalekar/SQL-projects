--Online Retail Store Database

-- 1. Customers Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

-- 2. Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

-- 3. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 4. Order_Items Table
CREATE TABLE Order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 5. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Sample Data

-- Customers
INSERT INTO Customer (name, email, phone, city)
VALUES
    ('Amita Mishra', 'amit@gmail.com', 9122334456, 'Mumbai'),
    ('Sanika Mohite', 'sanika@gmail.com', 8712345692, 'Pune'),
    ('Vishal Rao', 'vishu@gmail.com', 7899292833, 'Nashik');

-- Products
INSERT INTO Products (name, category, price, stock)
VALUES
    ('Maxi Dress', 'Clothing', 499.00, 100),
    ('Nike Shoes', 'Footwear', 999.00, 100),
    ('Titan Watch', 'Watch', 1000.00, 200),
    ('T-Shirt', 'Clothing', 599.00, 100);

-- Orders
INSERT INTO Orders (customer_id, order_date)
VALUES
    (1, '2024-01-11'),
    (2, '2024-06-06'),
    (3, '2024-10-02');

-- Order_Items
INSERT INTO Order_items (order_id, product_id, quantity)
VALUES
    (1, 2, 1),
    (2, 3, 2),
    (3, 4, 5);

-- Payments
INSERT INTO Payments (order_id, amount, payment_date, payment_method)
VALUES
    (1, 999.00, '2024-01-11', 'UPI'),
    (2, 1000.00, '2024-06-12', 'COD'),
    (3, 599.00, '2024-10-02', 'UPI');

-- Select all Customer records
SELECT * FROM Customer;

-- Display all Products;
SELECT * FROM Products;

-- 1. List all customers from Mumbai
SELECT * FROM Customers WHERE city = 'Mumbai';

-- 2. Show all orders with product names
SELECT o.order_id, c.name AS customer, p.name AS product, oi.quantity
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- 3. Total sales per product
SELECT p.name, SUM(oi.quantity * p.price) AS total_sales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name;

-- 4. Top customer by total amount spent
SELECT c.name, SUM(p.amount) AS total_spent
FROM Payments p
JOIN Orders o ON p.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;
