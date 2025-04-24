-- CREATING THE DATABASE
CREATE DATABASE IF NOT EXISTS Ecommerce;

-- USING THE DATABASE

USE Ecommerce;

-- TABLE BRAND
CREATE TABLE Brand (
    brandId INT PRIMARY KEY AUTO_INCREMENT,
    brandName VARCHAR(100) NOT NULL,
    description TEXT,
    country VARCHAR(100) NOT NULL
);

INSERT INTO Brand (brandName, description, country) VALUES
('Adidas', 'Specializes in sports apparel and footwear.', 'Germany'),
('Tecno', 'Emerging mobile brand with affordable devices.', 'Hong Kong'),
('HP', 'Produces computers, printers, and IT solutions.', 'United States'),
('Samsung', 'Global leader in electronics and smart devices.', 'South Korea'),
('Lenovo', 'Computing technology giant with a wide product range.', 'China'),
('Sony', 'Famous for electronics, gaming, and entertainment.', 'Japan');

-- TABLE PRODUCT CATEGORY
CREATE TABLE Product_category (
    categoryId INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(100) NOT NULL,
    description TEXT,
    slug VARCHAR(100) UNIQUE
);

INSERT INTO Product_category (categoryName, description, slug) VALUES
('Wearable Tech', 'Smartwatches, fitness trackers, smart bands', 'wearable-tech'),
("Men\'s Fashion", 'Clothing, shoes, and accessories for men', 'mens-fashion'),
('Kitchen Essentials', 'Blenders, coffee makers, cookware sets', 'kitchen-essentials'),
('Health & Wellness', 'Supplements, fitness gear, massagers', 'health-wellness');

-- TABLE PRODUCT
CREATE TABLE Product (
    productId INT PRIMARY KEY AUTO_INCREMENT,
    brandId INT NOT NULL,
    categoryId INT NOT NULL,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (brandId) REFERENCES Brand(brandId),
    FOREIGN KEY (categoryId) REFERENCES Product_category(categoryId)
);

INSERT INTO Product (productName, brandId, categoryId, price) VALUES 
('Adidas Ultraboost Light', 1, 2, 180.00),
('Tecno Camon 20', 2, 1, 140.00),
('HP Pavilion x360', 3, 1, 849.00),
('Samsung Galaxy Fit 3', 4, 1, 99.00),
('Lenovo Smart Blender', 5, 3, 179.99),
('Sony Xperia 10 V', 6, 1, 449.00),
('Adidas Slides Comfort', 1, 2, 45.00),
('Samsung Galaxy Watch 6', 4, 1, 319.00);

-- TABLE PRODUCT IMAGE
CREATE TABLE Product_image (
    imageId INT PRIMARY KEY AUTO_INCREMENT,
    productId INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    altText VARCHAR(255),
    isPrimary BOOLEAN DEFAULT FALSE,
    sortOrder INT DEFAULT 0,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

INSERT INTO Product_image (productId, url, altText) VALUES
(1, 'https://example.com/images/adidas-ultraboost-light-1.jpg', 'Side View'),
(1, 'https://example.com/images/adidas-ultraboost-light-2.jpg', 'Sole View'),
(2, 'https://example.com/images/tecno-camon20.jpg', 'Front View'),
(3, 'https://example.com/images/hp-pavilion-x360.jpg', 'Convertible Mode'),
(4, 'https://example.com/images/galaxy-fit3.jpg', 'Band Display'),
(5, 'https://example.com/images/lenovo-smart-blender.jpg', 'Blender with Jar'),
(6, 'https://example.com/images/sony-xperia10v.jpg', 'Xperia 10 V Front'),
(7, 'https://example.com/images/adidas-slides.jpg', 'Adidas Slides Top View'),
(8, 'https://example.com/images/galaxy-watch6.jpg', 'Watch Face Display');

-- TABLE COLOR
CREATE TABLE Color (
    colorId INT PRIMARY KEY AUTO_INCREMENT,
    colorName VARCHAR(100) NOT NULL,
    hexValue VARCHAR(7)
);

INSERT INTO Color (colorName, hexValue) VALUES
('Black', '#000000'),
('White', '#FFFFFF'),
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Gray', '#808080'),
('Silver', '#C0C0C0'),
('Green', '#008000'),
('Midnight', '#121212');

-- TABLE SIZE CATEGORY
CREATE TABLE Size_category (
    size_categoryId INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    unit VARCHAR(20) NOT NULL
);

INSERT INTO Size_category (size_categoryId, name, unit) VALUES 
(1, 'Small', 'cm'),
(2, 'Medium', 'cm'),
(3, 'Large', 'cm'),
(4, 'Extra Small', 'inch'),
(5, 'Extra Large', 'inch'),
(7, 'Adult', 'cm');

INSERT INTO Product_variation (variationId, productId, colorId, size_optionId) VALUES 
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 1, 2, 1),
(5, 1, 2, 2);

-- Product Item
CREATE TABLE Product_item (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    variationId INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_Qty INT NOT NULL,
    sku VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (variationId) REFERENCES Product_variation(variationId)
);

INSERT INTO Product_item (variationId, price, stock_Qty, sku) VALUES
(1, 29.99, 100, 'TBL-BLU-S'),
(2, 29.99, 85, 'TBL-BLU-M'),
(3, 29.99, 75, 'TBL-BLU-L'),
(4, 29.99, 50, 'TBL-RED-S'),
(5, 29.99, 65, 'TBL-RED-M');

-- Attribute Category
CREATE TABLE Attribute_category (
    attr_cat_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Attribute_category (attr_cat_id, name) VALUES 
(1, 'Material'),
(2, 'Pattern'),
(3, 'Style'),
(4, 'Sleeve Length'),
(5, 'Neckline'),
(6, 'Fit'),
(7, 'Season'),
(8, 'Fabric Weight'),
(9, 'Occasion');

-- Attribute Type
CREATE TABLE Attribute_type (
    attr_type_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dataType VARCHAR(100) NOT NULL
);

INSERT INTO Attribute_type (attr_type_id, name, dataType) VALUES 
(1, 'Text', 'string'),
(2, 'Number', 'integer'),
(3, 'Decimal', 'decimal'),
(4, 'Boolean', 'boolean'),
(5, 'Date', 'date'),
(6, 'Selection', 'string');

-- Product Attribute
CREATE TABLE Product_attribute (
    attr_id INT PRIMARY KEY AUTO_INCREMENT,
    productId INT NOT NULL,
    attr_type_id INT NOT NULL,
    attr_cat_id INT,
    value VARCHAR(255),
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (attr_type_id) REFERENCES Attribute_type(attr_type_id),
    FOREIGN KEY (attr_cat_id) REFERENCES Attribute_category(attr_cat_id)
);

INSERT INTO Product_attribute (productId, attr_type_id, attr_cat_id, value) VALUES
(1, 2, 1, 'Red'),
(1, 1, 1, 'Cotton'),
(2, 3, 1, 'Large'),
(2, 6, 2, 'Waterproof'),
(3, 4, 3, '1.5 kg'),
(3, 5, 1, 'Generic');