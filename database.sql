--	Virginia Saurer Database Management Systems Course

-- Final Assignment to create a .sql script that generates a SQLite database 
-- My database represents a store with products and customers

--CREATE DATABASE TABLES
--=======================

DROP TABLE IF EXISTS customers ;
CREATE TABLE customers(
	name text NOT NULL, -- full name of the customer
	customerID text NOT NULL UNIQUE, -- customer id number
	password text NOT NULL, -- password of customer
	phoneNum text NOT NULL, -- phone number of customer
	email text NOT NULL, -- email of customer
	primary key (customerID)
	);

DROP TABLE IF EXISTS shipping_address;
CREATE TABLE shipping_address(
	address_l1 text NOT NULL, -- address line 1
	address_l2 text, -- address line 2
	addressNum text NOT NULL UNIQUE, -- unique address number
	country text NOT NULL, -- customer's country
	customerID text NOT NULL UNIQUE, -- customer id number
	zipcode text NOT NULL, -- customer's zipcode
	city text NOT NULL, -- customer's city
	bill_address_bool text NOT NULL, -- billing address which is boolean
	primary key (addressNum, customerID),
	foreign key (customerID) references customers(customerID) on delete cascade

);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	customerID text NOT NULL UNIQUE, -- customer id number
	addressNum int NOT NULL UNIQUE, -- unique address number
	orderNum int UNIQUE, -- customer order number
	orderDate text, -- customer order date
	payment_receipt text , -- payment receipt boolean
	payPal_ref int , -- Paypal payment reference number
	paymentDate text , --payment date
	pNum int  NOT NULL UNIQUE, -- product number,
	primary key (customerID, addressNum, orderNum,pNum)
	foreign key (customerID) references customers(customerID) on delete cascade,
	foreign key (addressNum) references shipping_address(addressNum) on delete cascade,
	foreign key (pNum) references products(pNum) on delete cascade
);

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	pName text NOT NULL, -- product name
	pNum int  NOT NULL UNIQUE, -- product number
	pType text NOT NULL, -- type of product
	description text NOT NULL, -- product description
	image text NOT NULL, -- product image, for now image description
	primary key(pNum)

);

DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory(
	unitNum int NOT NULL, -- number of units
	pAddedDate text NOT NULL, -- date when product was added
	pNum text NOT NULL, -- product number
	pPrice text NOT NULL, -- product price
	primary key (pNum),
	foreign key (pNum) references products(pNum) on delete cascade
);

DROP TABLE IF EXISTS shopping_cart;
CREATE TABLE shopping_cart(
	orderNum text NOT NULL UNIQUE, -- order number
	numItems text NOT NULL, -- number of items
	deliveryPrice text NOT NULL, -- delivery price
	primary key (orderNum),
	foreign key (orderNum) references orders(orderNum) on delete cascade
);


BEGIN TRANSACTION;

-- Insert data into employee table
insert into customers (name, customerID, password, phoneNum, email)
	values ('John Smith','123456789','secret1','613-333-4444','js@gmail.com');
insert into customers (name, customerID, password, phoneNum, email)
	values ('Franklin Wong','333445555','secret2','613-232-3321','fw@gmail.com');
insert into customers (name, customerID, password, phoneNum, email)
	values ('Alicia Zelaya','999887777','secret3','613-111-2222','ez@gmail.com');
insert into customers (name, customerID, password, phoneNum, email)
	values ('Jennifer Wallace','987654321','secret4','613-321-4321','jw@gmail.com');
insert into customers (name, customerID, password, phoneNum, email)
	values ('Virginia Saurer','101037563','secret5','655-777-8881','vs@gmail.com');

--/shipping_address

-- Insert into shipping_address
insert into shipping_address (address_l1, address_l2, addressNum, country, customerID, zipcode, city, bill_address_bool )
	values ('19 Cranberry cres.', '',100, 'Canada', '123456789', 'K0H1F2', 'Toronto','yes');
insert into shipping_address (address_l1, address_l2, addressNum, country, customerID, zipcode, city, bill_address_bool )
	values ('1 City rd.', '',101, 'Canada', '333445555', 'K0G1J0', 'Kemptville','yes');
insert into shipping_address (address_l1, address_l2, addressNum, country, customerID, zipcode, city, bill_address_bool )
	values ('77 Third Line rd.', '',102, 'Canada', '999887777', 'G9O1K2', 'Kars','yes');
insert into shipping_address (address_l1, address_l2, addressNum, country, customerID, zipcode, city, bill_address_bool )
	values ('99 Lester st.', '',103, 'Canada', '987654321', 'H3J1K0', 'Oxford Mills','yes');
insert into shipping_address (address_l1, address_l2, addressNum, country, customerID, zipcode, city, bill_address_bool )
	values ('9 Smith rd.', '',104, 'Canada', '01037563', 'J1J1K0', 'Spencerville','yes');

-- / shipping_address

-- Insert into orders
insert into orders (customerID, addressNum, orderNum, orderDate, payment_receipt, payPal_ref, paymentDate, pNum)
	values ('123456789',100, 200,'2017-2-22', 'yes', 5379, '2017-2-22', 001);
insert into orders (customerID, addressNum, orderNum, orderDate, payment_receipt, payPal_ref, paymentDate, pNum)
	values ('333445555',102, 202,'2015-5-12', 'yes', 6733, '2015-5-12', 004);
insert into orders (customerID, addressNum, orderNum, orderDate, payment_receipt, payPal_ref, paymentDate, pNum)
	values ('999887777',103, 203,'2016-11-3', 'yes', 1234, '2016-11-12', 002);
insert into orders (customerID, addressNum, orderNum, orderDate, payment_receipt, payPal_ref, paymentDate, pNum)
	values ('987654321',104, 204,'2017-2-28', 'yes', 4443, '2017-3-2', 005);

-- / orders

-- Insert into products
insert into products (pName, pNum, pType, description, image)
	values ('Ballerina', 001,'Card', 'Stationary Card Set','ballerinaCard.png');
insert into products (pName, pNum, pType, description, image)
	values ('Castle in Clouds', 002,'Card', 'Stationary Card Set','castleCard.png');
insert into products (pName, pNum, pType, description, image)
	values ('Vogue', 003,'Accessorie', 'Chiffon Scarf','vogueScarf.png');
insert into products (pName, pNum, pType, description, image)
	values ('Shakespeare', 004,'Accessorie', 'Leather Clutch','shakespeareClutch.png');
insert into products (pName, pNum, pType, description, image)
	values ('When in Paris', 005,'Artwork', 'Framed Print','whenInParisPrint.png');
	--/ products

-- Insert into inventory
insert into inventory(unitNum, pAddedDate, pNum, pPrice)
	values (22, '2018-2-30', 001, '$15.00');
insert into inventory(unitNum, pAddedDate, pNum, pPrice)
	values (10, '2018-5-0', 002, '$15.00');
insert into inventory(unitNum, pAddedDate, pNum, pPrice)
	values (5, '2015-8-9', 003, '$38.00');
insert into inventory(unitNum, pAddedDate, pNum, pPrice)
	values (80, '2018-11-4', 004, '$45.00');
insert into inventory(unitNum, pAddedDate, pNum, pPrice)
	values (7, '2018-4-28', 005, '$20.00');
-- / inventory

-- Insert into shopping_cart
insert into shopping_cart (orderNum, numItems, deliveryPrice)
	values (100, 2, "$6.50");
insert into shopping_cart (orderNum, numItems, deliveryPrice)
	values (102, 1, "$6.50");
insert into shopping_cart (orderNum, numItems, deliveryPrice)
values (103, 3, "$10.50");
-- / shipping_cart

COMMIT TRANSACTION;
