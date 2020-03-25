DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products
(
    id INT
    AUTO_INCREMENT NOT NULL,
  product_name VARCHAR
    (45) NOT NULL,
  department_id VARCHAR
    (45) NOT NULL,
  price DECIMAL
    (10,2) NOT NULL,
  stock_quantity INT
    (10) NOT NULL,
  primary key
    (id)
);

    SELECT *
    FROM products;

    INSERT INTO products
        (id, product_name, department_id, price, stock_quantity)
    VALUES
        (1, 'ScreenCleaner', 1, 38.88, 20),
        (2, 'WirelessMouse', 1, 19.95, 15),
        (3, 'PowerCord', 1, 150.00, 10),
        (4, 'CompterCover', 2, 20.00, 15),
        (5, 'WirelessKeyboard', 2, 30.00, 10),
        (6, 'KeyboardCleaner', 3, 12.99, 20),
        (7, 'Computers', 4, 2500, 10)

    CREATE TABLE departments
    (
        id INT
        AUTO_INCREMENT NOT NULL,
  department_id VARCHAR
        (45) NOT NULL,
  over_head_costs DECIMAL
        (10,2) NOT NULL,
  primary key
        (department_id)
);
        SELECT *
        FROM departments;

        INSERT INTO departments
            (department_id, over_head_costs)
        VALUES
            ("1", 200),
            ("1", 100),
            ("2", 50),
            ("3", 300),
            ("4", 35),
            ("5", 0);
