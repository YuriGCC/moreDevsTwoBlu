create database loja;
use loja;

CREATE USER 'usuario'@'%' IDENTIFIED BY 'senha';
GRANT ALL PRIVILEGES ON *.* TO 'usuario'@'%';

create table Product (
	productId int auto_increment primary key,
	productName varchar(255),
    price numeric(10,5)
);

create table Client (
	clientId int auto_increment primary key,
	clientName varchar(255)
);

create table ClientOrder (
	clientOrderId int auto_increment primary key,
	dateOrder date,
    clientId int,

    foreign key (clientId) references Client(clientId)
);

CREATE TABLE OrderProduct (
    clientOrderId INT,
    productID INT,
    quantity INT,
    PRIMARY KEY (clientOrderId, productID),
    FOREIGN KEY (clientOrderId) REFERENCES ClientOrder(clientOrderId),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);