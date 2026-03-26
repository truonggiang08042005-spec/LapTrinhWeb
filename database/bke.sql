
CREATE TABLE users (
    user_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(25) NOT NULL,
    user_email VARCHAR(55) NOT NULL,
    user_pass VARCHAR(255) NOT NULL,
    updated_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_description TEXT NOT NULL,
    updated_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    updated_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_details (
    order_detail_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    order_id INT(11) NOT NULL,
    product_id INT(11) NOT NULL,
    updated_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO users (user_name, user_email, user_pass) VALUES
('mali', 'mali.testI@gmail.com', '123456'),
('minh', 'minh_I_test@gmail.com', '123456'),
('alice', 'alice@yahoo.com', '123456'),
('john', 'john@gmail.com', '123456'),
('maria', 'maria_I@gmail.com', '123456'),
('bob', 'bob@hotmail.com', '123456'),
('anni', 'anni@gmail.com', '123456'),
('michael', 'michael@gmail.com', '123456'),
('david', 'david@gmail.com', '123456'),
('linda', 'linda@yahoo.com', '123456');

INSERT INTO products (product_name, product_price, product_description) VALUES
('Laptop Dell', 1500.0, 'Laptop Dell core i7'),
('Chuột Logitech', 20.0, 'Chuột không dây');

INSERT INTO orders (user_id) VALUES (1), (2);

INSERT INTO order_details (order_id, product_id) VALUES (1, 1), (2, 2);
