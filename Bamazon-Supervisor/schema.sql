CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products
(
    item_id INT
    AUTO_INCREMENT = NOT NLL,
  product_name VARCHAR
    (45) =NOT NULL,
  product_sales DECIMAL
    (10,2) DEFAULT 0,
  department_name VARCHAR
    (45) NOT NULL,
  price DECIMAL
    (10,2) NOT NULL,
  stock_quantity INT
    (10) NOT NULL,
  primary key
    (item_id)
);

    SELECT *
    FROM products;

    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("LED Light Bulbs", "Lighting", 19, 95, 150),
        ("Bluetooth Smart Senors", "Energy Saver", 45.00, 200),
        ("Water Faucet", "Water Conservation", 20.50, 50),
        ("Toilet Tank Efficiency", "Water Conservation", 9.00, 15),
        ("TValve Shower Head", "Water Conservation", 22.95, 35),
        ("Torchier Lamp", "Lighting", 99.99, 50),
        ("Reflector Down Lights", "Outside Lighting", 15.00, 30),
        ("Smart Thermostat", "Heating", 100.00, 45),
        ("Water Heater Blanket", "Insulators", 30.50, 35),
        ("Water Heater Pipe Insulater", "Insulators", 19.95, 35);

    CREATE TABLE departments
    (
        department_id INT
        AUTO_INCREMENT NOT NULL,
  department_name VARCHAR
        (45) NOT NULL,
  over_head_costs DECIMAL
        (10,2) NOT NULL,
  primary key
        (department_id)
);

        SELECT *
        FROM departments;

        INSERT INTO departments
            (department_name, over_head_costs)
        VALUES
            ("Energy Saver", 200),
            ("Water Conservation", 100),
            ("lighting", 200),
            ("Insulators", 70),
            ("Heating", 45),
            ("Outside Lighting", 30);