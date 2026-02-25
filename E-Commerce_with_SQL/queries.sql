-- 1. List all customers who have placed at least one order.
select distinct c.* 
from customer as c
join orders as o 
on c.customer_id = o.customer_id ;
  
-- 2. Find the top 5 most expensive products.
SELECT *
FROM product
ORDER BY price DESC
LIMIT 5;

-- 3. Show total number of orders per customer.
select c.name ,o.customer_id,count(*) as total_orders 
from orders as o
join customer as c
on o.customer_id = c.customer_id
group by o.customer_id;

-- 4. Display total revenue generated from all orders.
select sum(total_amount) as total_revenue from orders;

-- 5. List all orders along with the customer name and total amount.
select distinct o.order_id, c.name as customer_name , o.total_amount 
from orders as o 
left join customer as c
on c.customer_id = o.customer_id;

-- 6. Find the total quantity of each product sold.
select p.product_id,
p.product_name,
SUM(i.item_quantity) AS total_quantity_sold 
from product as p
join order_items as i
on p.product_id = i.product_id
group by p.product_id ,p.product_name;  

-- 7. Show the most popular product (by quantity sold).
select p.product_id , p.product_name, sum(i.item_quantity) as total_quantity_sold 
from product p
join order_items i
on p.product_id = i.product_id 
group by p.product_id , p.product_name 
order by total_quantity_sold desc
limit 1;

-- 8. List all customers who have never placed an order.
select c.name , c.customer_id 
from customer c
left join orders o
on c.customer_id = o.customer_id 
where o.order_id is null;

-- 9. Display orders placed in the last 30 days.
SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY; 

-- 10. Find the average order amount.
select avg(total_amount) as average_order_amount from orders;

-- 11. Show total sales by category.
select p.category, sum(i.unit_price*i.item_quantity) as total_sales
 from product p
 join order_items i
 on p.product_id=i.product_id
 group by p.category;


-- 12. Find all payments made using 'Credit Card'.
select * from payments where payment_method = 'credit card';

-- 13. Get total payment amount grouped by payment method.
select payment_method, sum(amount) as total_payment
from payments
group by payment_method;

-- 14. List the names of customers who made payments over ₹3000.
select c.name, p.amount
from orders o 
join customer c on c.customer_id = o.customer_id
join payments p on o.order_id = p.order_id
where p.amount > 3000;

-- 15. Find orders that contain more than one product item.
select order_id,count(product_id) as total_product 
from order_items
group by order_id
having count(product_id) >1;


-- 16. Show the number of orders shipped and their current shipping status.
select shipping_status ,count(order_id) as total_orders
from shipping
group by shipping_status;



-- 17. List all orders that have not been delivered yet.
select order_id from shipping where lower(shipping_status) != 'delivered';

-- 18. Show the delivery date of each order along with shipping status.
select order_id, delivery_date, shipping_status
 from shipping ;

-- 19. Display customers and the number of products they have purchased.
select c.customer_id,c.name,count(i.product_id) 
from orders o
join customer c on o.customer_id = c.customer_id
join order_items i on i.order_id = o.order_id
group by c.name, c.customer_id;

-- 20. Find the product with the highest stock remaining.
select product_id, product_name, stock_quantity
from product
where stock_quantity = (select max(stock_quantity) as hightest_stock
from product);

-- 21. Get total sales per month from order_date.
select date_format(order_date, '%y-%m') as month ,sum(total_amount) as total_sales
from orders 
group by date_format(order_date, '%y-%m');

-- 22. Find the average payment amount per customer.
select c.customer_id , c.name , avg(p.amount) as avg_amt
from customer c
join orders o on c.customer_id = o.customer_id
join payments p on o.order_id = p.order_id
group by c.customer_id , c.name; 



-- 23. Display all orders with their corresponding shipping and payment details.
select o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    s.shipping_date,
    s.delivery_date,
    s.shipping_status,
    p.payment_method,
    p.payment_date,
    p.amount AS payment_amount
from orders o
left join shipping s on o.order_id = s.order_id 
left join payments p on o.order_id = p.order_id;

-- 24. Find out how many products are out of stock.
SELECT COUNT(*) AS out_of_stock_count
FROM product
WHERE stock_quantity = 0;

-- 25. List customers who placed an order and received it within 5 days.
SELECT DISTINCT c.customer_id, c.name
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN shipping s ON o.order_id = s.order_id
WHERE DATEDIFF(s.delivery_date, o.order_date) <= 5;
