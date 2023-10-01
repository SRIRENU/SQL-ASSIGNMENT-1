-- Create the Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50)
);

-- Create the Region table
CREATE TABLE Region (
    region_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create the TimePeriod table
CREATE TABLE TimePeriod (
    time_period_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create the Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    age INT,
    loyalty_status VARCHAR(50)
);

-- Create the Purchase table
CREATE TABLE Purchase (
    purchase_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    time_period_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (time_period_id) REFERENCES TimePeriod(time_period_id)
);

-- Create the PurchaseProduct table for the many-to-many relationship between Purchase and Product
CREATE TABLE PurchaseProduct (
    purchase_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create the ProductRegion table for the many-to-many relationship between Product and Region
CREATE TABLE ProductRegion (
    product_id INT NOT NULL,
    region_id INT NOT NULL,
    PRIMARY KEY (product_id, region_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

-- Create the Inventory table
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    stock_level INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
