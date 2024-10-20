use restaurant_db;

select * from menu_items;

-- TO FIND TOTAL NO. OF MENU ITEMS
SELECT count(menu_item_id) from menu_items;

-- LEAST & MOST EXPENSIVE ITEM
SELECT item_name,price from menu_items 
where price = (select max(price) from menu_items) or
price = (select min(price) from menu_items);

-- TOTAL ITALIAN DISHES
select count(menu_item_id) from menu_items;

-- LEAST & MOST EXPENSIVE ITALIAN DISHES
SELECT item_name,price,category from menu_items 
where (price = (select max(price) from menu_items where category ="italian") or 
price = (select min(price) from menu_items where category ="italian") ) and
category ="italian";


-- How many dishes are in each category? What is the average dish price within each category?
SELECT count(menu_item_id) dishes_in_category,avg(price) avg_price
from menu_items group by category;

-- View the order_details table. What is the date range of the table?
select * from order_details;
select min(order_date),max(order_date) from order_details;

-- How many orders were made within this date range? How many items were ordered within this date range?
select count(order_id) total_orders,  count(distinct item_id) items from order_details;

-- Which orders had the most number of items?
select order_id,count(item_id) items  from order_details 
group by order_id  order by items desc ;

-- How many orders had more than 12 items?
select count(*) from (select count(order_id) from order_details
group by order_id having count(item_id) > 12  ) as filtered_rows;

-- Combine the menu_items and order_details tables into a single table
SELECT *
 FROM order_details od LEFT JOIN  menu_items mi 
 ON od.item_id=mi.menu_item_id;

-- What were the least and most ordered items? What categories were they in?
SELECT mi.item_name,category,count(od.order_details_id) as total_orders
 FROM order_details od LEFT JOIN  menu_items mi 
 ON od.item_id=mi.menu_item_id
 group by mi.item_name,category
 order by total_orders desc;

-- What were the top 5 orders that spent the most money?
SELECT od.order_id,sum(mi.price) as Purchase_Value
 FROM order_details od LEFT JOIN  menu_items mi 
 ON od.item_id=mi.menu_item_id
 group by od.order_id
 order by Purchase_Value desc
 LIMIT 5;

-- TOP 5 ORDERS (440.2075,1957,330,2675)

-- View the details of the highest spend order. Which specific items were purchased?

SELECT mi.category,count(od.item_id) as Total_items
 FROM order_details od LEFT JOIN  menu_items mi 
 ON od.item_id=mi.menu_item_id 
 where od.order_id=440
 group by mi.category;
 
 --  View the details of the top 5 highest spend orders
 
 SELECT mi.category,count(od.item_id) as total_items
 FROM order_details od LEFT JOIN  menu_items mi 
 ON od.item_id=mi.menu_item_id 
 where od.order_id in (440,2075,1957,330,2675)
 group by mi.category;
 


