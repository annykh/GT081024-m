-- 1. Вывести имена и фамилии сотрудников, работающих в департаментах 'IT' и 'Shipping', с зарплатой выше 10000.
select emp.first_name, last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name in ('IT', 'Shipping') and emp.salary > 10000;

-- 2. Вывести названия департаментов, расположенных в регионе 'Americas'.
select dep.department_name
from departments as dep
join locations as loc
on dep.location_id = loc.location_id
join countries as cntr
on loc.country_id = cntr.country_id
join regions as reg
on cntr.region_id = reg.region_id
where reg.region_name = 'Americas';

-- 3. Вывести имена, фамилии и зарплаты сотрудников, занимающих должность(job_title) 'Accountant'.
select emp.first_name, emp.last_name, emp.salary
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
where jb.job_title = 'Accountant';

-- 4. Вывести имена, фамилии, зарплаты, названия департаментов, должности сотрудников и их телефонные номера, начинающиеся с '650'.
select emp.first_name, emp.last_name, emp.salary, dep.department_name, jb.job_title, emp.phone_NUMERIC
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join jobs as jb
on emp.job_id = jb.job_id
where emp.phone_NUMERIC like '650%';

-- 5*. Вывести имена, фамилии и зарплаты сотрудников, а также дополнительное поле currency (создавать его в таблице не нужно) со значением:
--   'USD', если департамент сотрудника находится в регионе 'Americas',
--   'EUR', если департамент находится в регионе 'Europe'.

select emp.first_name, emp.last_name, emp.salary, 
		case
			when reg.region_name = 'Americas' then 'USD'
            when reg.region_name = 'Europe' then 'EUR'        
        end as currency
from employees as emp
join departments as dep
on dep.department_id = emp.department_id
join locations as loc
on loc.location_id = dep.location_id
join countries as cntr
on cntr.country_id = loc.country_id
join regions as reg
on reg.region_id = cntr.region_id;


CREATE DATABASE store;
USE store;

-- Таблица клиентов
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Таблица товаров
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

-- Таблица категорий товаров
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

-- Таблица заказов
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total DECIMAL(10, 2)
);

-- Таблица деталей заказа
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);


-- Заполнение таблицы клиентов
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Alice', 'Johnson', 'alice@example.com'),
('Bob', 'Brown', 'bob@example.com'),
('Ben', 'King', 'ben@example.com'),
('Mike', 'Cors', 'mike@example.com'),
('Jack', 'Smith', 'jack@example.com'),
('Emma', 'King', 'emma@example.com');

-- Заполнение таблицы категорий товаров
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Furniture'),
('Clothing'),
('Toys');

-- Заполнение таблицы товаров
INSERT INTO products (product_name, price, category_id) VALUES
('Laptop', 1000.00, 1),
('Table', 150.00, 2),
('T-shirt', 20.00, 3),
('Bed', 100.00, 2),
('Phone', 1520.00, 1),
('Skirt', 50.00, 3);

-- Заполнение таблицы заказов
INSERT INTO orders (customer_id, order_date, total) VALUES
(1, '2024-09-10', 1020.00),
(2, '2024-09-12', 170.00),
(3, '2024-09-09', 70.00),
(4, '2024-08-09', 1520.00);

-- Заполнение таблицы деталей заказа
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1000.00),
(1, 3, 1, 20.00),
(2, 2, 1, 150.00),
(2, 3, 1, 20.00),
(3, 3, 1, 20.00),
(3, 6, 1, 50.00),
(4, 5, 1, 1520.00);

-- 1. Вывести список категорий(category_name) и товаров(product_name), которые относятся к этим категориям.
select cat.category_name, prod.product_name
from categories as cat
join products as prod
on cat.category_id = prod.category_id;

-- 2. Получить список всех товаров(product_name), включённых в заказы, с указанием их цен(price) и категорий(category_name).
select distinct prod.product_name, prod.price, cat.category_name
from products as prod
join order_items as o_i
on prod.product_id = o_i.product_id
join categories as cat
on prod.category_id = cat.category_id;

-- 3. Найти заказы, содержащие товар "Laptop". Вывести order_id, order_date, first_name, last_name.
select ord.order_id, ord.order_date, cust.first_name, cust.last_name
from orders as ord
join customers as cust
on ord.customer_id = cust.customer_id
join order_items as o_i
on ord.order_id = o_i.order_id
join products as prod
on o_i.product_id = prod.product_id
where prod.product_name = 'Laptop';

-- 4. Вывести даты заказов(order_date) и имена клиентов(first_name, last_name), которые их сделали.
select ord.order_date, cust.first_name, cust.last_name
from orders as ord
join customers as cust
on ord.customer_id = cust.customer_id;

-- 5. Вывести названия товаров(product_name), которые заказывал клиент с фамилией 'Smith'.
select prod.product_name
from products as prod
join order_items as o_i
on prod.product_id = o_i.product_id
join orders as ord
on o_i.order_id = ord.order_id
join customers as cust
on cust.customer_id = ord.customer_id
where cust.last_name = 'Smith';


-- Доп. задания
-- 6. Найти имена и фамилии клиентов, которые купили товары из категории "Electronics".
-- 7. Вывести названия товаров и их количество(quantity) в каждом заказе.
-- 8. Получить список всех товаров(product_name), включённых в заказ клиента с email 'john@example.com'.
-- 9. Вывести список всех заказанных товаров с указанием клиентов, которые их заказали.
-- 10. Получить список клиентов(first_name, last_name), которые заказали "Phone".
