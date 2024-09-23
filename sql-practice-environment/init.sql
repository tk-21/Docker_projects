-- テーブルの作成
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- データの挿入
INSERT INTO customers (name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com'),
('Charlie Lee', 'charlie@example.com');

INSERT INTO products (name, description, price) VALUES
('Laptop', 'A high-performance laptop.', 1200.00),
('Smartphone', 'Latest model smartphone.', 800.00),
('Headphones', 'Noise-cancelling headphones.', 200.00),
('Monitor', '4K Ultra HD monitor.', 350.00);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-01-15'),
(2, '2024-02-20'),
(1, '2024-03-05');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 3, 2, 200.00),
(2, 2, 1, 800.00),
(3, 4, 2, 350.00),
(3, 3, 1, 200.00);
