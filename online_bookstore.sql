select * from books;
select * from customers;
select * from orders;

-- 1) retrive all books in the " fiction" genre: 
select * from books where genre='Fiction';

-- 2) find books published afterthe year 1950:
select * from  books where published_year>1950;

-- 3) list all customers from canada:
select * from customers where country='canada';

--  4)list orders placed in november 2023:
select * from orders where oredr_date between '2023-11-01' and '2023-11-30';

--  5)find the details of the most expensive book:
select * from Books order by price desc limit 1;

-- 6) retrive  the total stocks of the available books:
select  sum(stock) from books;

-- 7) retrive all orders  where the total amount exceeds $20:
select * from orders  where toatl_amount>20;

-- 8) show all customers who ordered more than 1 quantity of  a book:
 select * from orders where quantity > 1;
 
 -- 9) list all genres available in the books table:
 select  distinct genre from books;
 
 -- 10) find the book with the lowest stock;
 select * from books  order by stock limit 1;
 
 -- 11) calculate the total revenue generated from all orders:
 select  sum(toatl_amount)  from orders as revenue ;
 --------------------------------------------------------------------------------------
 -- advanced commanda --
 
 -- 1) retrive the total number of books sold for each genre:
 select genre, sum(quantity) 
 from Orders 
 join books  on  orders.book_id=books.book_id group by genre ;
 
 -- 2)find the average price of books in the "fantacy" genre:
 select  avg(price)  as averagepriceoffantasy from books  where genre='fantasy' ;
 
 -- 3)list customers who have placed at least 2 orders:
 select orders.customer_id, count(orders.order_id), customers.name as order_count
  from orders 
  join customers on  customers.customer_id=orders.customer_id 
  group by orders.customer_id, customers.name 
  having count(order_id) >=2;
  
  -- 4) find the most frequently ordered book:
  select o.book_id, b.title, count(order_id) as order_count
  from Orders o
  join books b on o.book_id=b.book_id 
  group by book_id
  order by order_count  desc
  limit 1;
  
  -- 5)show the top 3 most expensive books of 'fantasy' genre:
  select * from books where genre='fantasy' order by price desc limit 3;
  
  -- 6) retrive the total quantity of books sold by each author:
  select  books.author, sum(orders.quantity) as books_count
   from books
   join orders on books.book_id=orders.book_id  group by author;
   
   -- 7) list the cities where customers who spent over $30 are located:
   select distinct customers.city, toatl_amount
   from orders join customers on orders.customer_id=customers.customer_id
   where toatl_amount > 30;
   
   -- 8) find the customer who spent the most on orders:
   select  customers.customer_id , customers.name, sum(orders.toatl_amount) as total_spent
   from orders
   join customers on orders.customer_id=customers.customer_id
   group by  customers.customer_id , customers.name
   order by total_spent desc limit 1;
   
   -- 9) calculate the stock remaining after fulfilling all orders:
   select  b.book_id, b.title,b.stock, coalesce(sum(o.quantity),0) as order_quantity,
   b.stock- coalesce(sum(o.quantity),0) as remaining_quantity
   from books b
   left join orders o on b.book_id=o.book_id
   group by b.book_id order by b.book_id
   
  
   
  
  
  
  
 
  
 

  
 
 









