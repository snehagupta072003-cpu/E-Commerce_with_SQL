/**database**/
create database E_Commerce_Sales;
use E_Commerce_Sales;

/**customer table**/
create table customer
(customer_id int primary key, name varchar(50),
 age int, phone_number varchar(15),
 email_id varchar(50), 
 address varchar(50));
 
/** Product Table **/
create table product( product_id int primary key,
product_name varchar(100),
category varchar(50),
stock_quantity int,
price decimal(10,2)
);


/** Order Table **/
create table orders(order_id int primary key auto_increment,
customer_id int,
order_date date,
total_amount decimal(10,2),
foreign key (customer_id) references customer(customer_id)on delete cascade on update cascade
);


/** Order Items Table **/
create table order_items(item_id int primary key auto_increment,
order_id int, 
product_id int,
unit_price decimal(10,2),
item_quantity int,
foreign key (order_id) references orders(order_id) on delete cascade on update cascade,
foreign key (product_id) references product(product_id)on delete cascade on update cascade
);


/** Payment Table **/ 
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


/**shiping**/
create table shipping (shipping_id int primary key auto_increment,
order_id int,
shipping_date date,
delivery_date date,
shipping_status varchar(50) default "pending",
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
