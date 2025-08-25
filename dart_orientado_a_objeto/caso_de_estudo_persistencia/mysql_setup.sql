drop database loja;
create database loja;
use loja;

DROP USER 'usuario'@'%';
CREATE USER 'usuario'@'%' IDENTIFIED BY 'senha';
GRANT ALL PRIVILEGES ON *.* TO 'usuario'@'%';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS OrderProduct;
DROP TABLE IF EXISTS ClientOrder;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Client;

CREATE TABLE Product (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(255),
    price NUMERIC(10,5)
);

CREATE TABLE Client (
    clientId INT AUTO_INCREMENT PRIMARY KEY,
    clientName VARCHAR(255)
);

CREATE TABLE ClientOrder (
    clientOrderId INT AUTO_INCREMENT PRIMARY KEY,
    dateOrder DATE,
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);

CREATE TABLE OrderProduct (
    clientOrderId INT,
    productID INT,
    quantity INT,
    PRIMARY KEY (clientOrderId, productID),
    FOREIGN KEY (clientOrderId) REFERENCES ClientOrder(clientOrderId),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);