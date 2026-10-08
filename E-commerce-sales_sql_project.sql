   create database ecommerce_analysis;
   use ecommerce_analysis;
   create table customers(customer_id int primary key,customer_name varchar(100),
   city varchar(50),state varchar(50));
   create table product(product_id int primary key,product_name varchar(50),category varchar(50),price decimal(10,2));
   create table orders(order_id int primary key ,customer_id int,order_date date,foreign key (customer_id)references customers(customer_id));
   create table order_items(order_item_id int primary key,order_id int,product_id int,quantity int,foreign key(order_id )references orders(order_id),foreign key(product_id)references product(product_id));
    show tables;
    insert into customers(customer_id,customer_name,city,state) values(1,"Arun","Chennai","Tamilnadu"), (2,"Anbu","Chennai","Tamilnadu"),
     (3,"Babu","Chennai","Tamilnadu"),
      (4,"Banu","Coimbatore","Tamilnadu"),
       (5,"Priya","Coimbatore","Tamilnadu"),
        (6,"Ansar","Bangalore","Karnataka"),
         (7,"sheela","Bangalore","Karnataka"),
          (8,"Mariya","Mysore","Karnataka"),
           (9,"Manju","Mysore","Karnataka");
           select * from customers;
           drop table products;
           insert into product(product_id,product_name,category,price ) values(1,"watch","Electronis",499.99),
           (2,"watch","Electronis",499.99),
           (3,"Remote","Electronis",699.99),
           (4,"Iron box","Electronis",799.99),
           (5,"Soap","Groceries",99.99),
           (6,"Oil","Groceries",199.99),
           (7,"Mouse","Electronis",299.99),
           (8,"Saree","Fashion",399.99),
           (9,"Shirt","Fashion",599.99);
           select * from product;
insert into orders(order_id,customer_id ,order_date)values(1,1,"2026-09-04"),
(2,2,"2026-09-03"),
(3,3,"2026-09-02"),
(4,4,"2026-09-01"),
(5,5,"2026-09-13"),
(6,6,"2026-09-14"),
(7,7,"2026-09-16"),
(8,8,"2026-09-18"),
(9,9,"2026-09-26");
select * from orders;
insert into order_items(order_item_id,order_id,product_id,quantity)values (1,1,1,1),
(2,9,2,7),
(3,7,4,5),
(4,8,6,8),
(5,6,8,4),
(6,5,9,2),
(7,3,7,9),
(8,4,3,6),
(9,2,5,3);
/*question 1:how many customers are there?*/ 
select count(*) as total_customers from customers;
/*question 1:how many orders are there?*/ 
select count(*) as total_orders from orders;
/*question 1:Display the orders?*/ 
select * from product;
/*question 1:how many order_items are there?*/ 
select count(*)as total_order_items from order_items;
/*question 1:what is the total quantity of product sold?*/ 
select sum(quantity)as total_quantity_sold from order_items;
/*question 1:what is the totaal sales amount off all products?*/ 
select sum(price)as total_sales from product;
/*question 1:what is the average order value?*/ 
select avg(price)as average_order_value from product;
select round(avg(price),2)as average_order_value from product;
/*question 1:what is the highest order value?*/ 
select max(price)as higest_order_value from product;
/*question 1:what is the highest order value?*/ 
select min(price)as lowest_order_value from product;
/*question 1:Find the number of ordersplaced by each customer?*/ 
select customer_id,count(*)as total_orders from orders group by customer_id order by total_orders desc;
/*question 1:Find the customers who hve placed more than one order?*/ 
select customer_id ,count(*) as total_orders from orders group by customer_id having count(*)>1;
select sum(price)as product_value from product;
/*question 1:Find the  total sales amount for each product?*/ 
select order_items.product_id,product.price,order_items.quantity from order_items join product on order_items.product_id = product.product_id;
/*question 1:Find the total amount spent by each customer?*/ 
select sum(order_items.quantity*product.price)astotal_sales from order_items join product on order_items.product_id = product.product_id;
/*question 1:Find the product with the highest total values?*/ 
select order_items.product_id,sum(order_items.quantity*product.price)as product_sales from order_items join product on order_items.product_id = product.product_id group by order_items.product_id order by product_sales desc;
