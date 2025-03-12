select * from customers;
select * from orders;
select * from order_items;
select * from products;
select * from categories;

-- 6. Найти имена и фамилии клиентов, которые купили товары из категории "Electronics".
select cust.first_name, cust.last_name
from customers as cust
join orders as ord
on cust.customer_id = ord.customer_id
join order_items as ord_it
on ord.order_id = ord_it.order_id
join products as prod
on ord_it.product_id = prod.product_id
join categories as cat
on prod.category_id = cat.category_id
where cat.category_name = 'Electronics';

-- 7. Вывести названия товаров и их количество(quantity) в каждом заказе.
select prod.product_name, ord_it.quantity
from products as prod
join order_items as ord_it
on prod.product_id = ord_it.product_id;

-- 8. Получить список всех товаров(product_name), включённых в заказ клиента с email 'john@example.com'.
select prod.product_name
from products as prod
join order_items as ord_it
on prod.product_id = ord_it.product_id
join orders as ord
on ord_it.order_id = ord.order_id
join customers as cust
on ord.customer_id = cust.customer_id
where cust.email  = 'john@example.com';

-- 9. Вывести список всех заказанных товаров с указанием клиентов, которые их заказали.
select prod.product_name, cust.first_name, cust.last_name
from products as prod
join order_items as ord_it
on prod.product_id = ord_it.product_id
join orders as ord
on ord_it.order_id = ord.order_id
join customers as cust
on ord.customer_id = cust.customer_id;

-- 10. Получить список клиентов(first_name, last_name), которые заказали "Phone".
select cust.first_name, cust.last_name
from customers as cust
join orders as ord
on cust.customer_id = ord.customer_id
join order_items as ord_it
on ord.order_id = ord_it.order_id
join products as prod
on ord_it.product_id = prod.product_id
where prod.product_name = 'Phone';



use hr;

-- OUTER JOIN - LEFT JOIN, RIGHT JOIN

-- select column1, column2, ..
-- from left_table
-- left/right join right_table 
-- on left_table.column = right_table.column;

-- Второй распространенный вариант — внешнее соединение. 
-- Если внутреннее объединение имеет сходство с бинарным «и», то внешнее — несколько вариаций бинарного
-- «или». Такой JOIN более гибкий, он возвращает не только строгое пересечение между двумя таблицами, 
-- но и отдельные элементы, которые принадлежат только одному из множеств. Какому — зависит от типа.

-- Left Join. Возвращает пересечение множеств и все элементы из левой таблицы. 
-- Например, человек хочет посмотреть кино, но на русский фильм согласен, только если это боевик. 
-- Фильтр вернет ему все фильмы из множества «боевики», фильмы из подмножества «русские боевики», 
-- но других фильмов из множества «русские» там не будет.

-- Right Join. Работает по тому же принципу, но вместо левой таблицы — правая. 
-- То есть человек получит в результатах боевики, только если они русские.

-- Left Join с NULL. Возвращает данные из левой таблицы, но без пересечений с правой. 
-- Человеку покажутся все боевики, но русского кино и в частности русских боевиков среди них не будет.

-- Right Join с NULL. Соответственно, работает так же, но по отношению к «правой», второй таблице.

select * from employees;
select * from jobs;
select * from departments;
select * from locations;
select * from countries;
select * from regions;

-- employees - 107
-- departments - 27

-- Вывести всех сотрудников и названия их департаментов
select emp.first_name, emp.last_name, dep.department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id;

-- Вывести все департаменты, в которых работает хотя бы один сотрудник.
select distinct dep.department_name
from departments as dep
join employees as emp
on dep.department_id = emp.department_id;

-- Вывести всех сотрудников и название их департментов, если департамент не указан вывести null.
select emp.first_name, emp.last_name, dep.department_name
from employees as emp -- left table
left join departments as dep -- right table
on emp.department_id = dep.department_id;

-- Вывести сотрудников, которые не работают в департаментах.
select emp.first_name, emp.last_name, dep.department_name
from employees as emp
left join departments as dep
on emp.department_id = dep.department_id
where dep.department_name is null;

-- Лучше проверить department_id - primary key поля
select emp.first_name, emp.last_name, dep.* -- все поля из departments
from employees as emp
left join departments as dep
on emp.department_id = dep.department_id
where dep.department_id is null;

select emp.first_name, emp.last_name, dep.*
from departments as dep -- left table
right join employees as emp -- right join
on dep.department_id = emp.department_id
where dep.department_id is null;

-- Вывести департаменты, в которых никто не работает.
select dep.department_name
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id -- можно emp.department_id = dep.department_id
where emp.employee_id is null;

select city from locations; -- 27 городов

-- Те города, в которых есть департаменты 
select distinct loc.city 
from locations as loc
join departments as dep
on loc.location_id = dep.location_id;

-- Вывести города, в которых нет департаментов
select loc.city
from locations as loc -- left
left join departments as dep -- right
on loc.location_id = dep.location_id
where dep.department_id is null;

-- Вывести названия стран и городов, в которых нет департаментов.
select cnt.country_name, loc.city
from countries as cnt
join locations as loc
on cnt.country_id = loc.country_id
left join departments as dep
on loc.location_id = dep.location_id
where dep.department_id is null;

-- Вывести имена, фамилии и должность(job_title) сотрудников, которые не работают ни в каких департаментах.
select emp.first_name, emp.last_name, jb.job_title
from employees as emp
left join departments as dep
on emp.department_id = dep.department_id
join jobs as jb
on emp.job_id = jb.job_id
where dep.department_id is null;

select emp.first_name, emp.last_name, jb.job_title
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
left join departments as dep
on dep.department_id = emp.department_id
where dep.department_id is null;

-- Вывести название(department_name) и адрес(street_address) тех департаментов, в которых никто не работает.
select dep.department_name, loc.street_address
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
join locations as loc
on dep.location_id = loc.location_id
where emp.employee_id is null;

-- select dep.department_name, loc.street_address
-- from employees
-- right join departments
-- on ...
-- join locations
-- on ...;

-- select dep.department_name, loc.street_address
-- from locations
-- join departments
-- on ...
-- left join employees
-- on ...

-- Из региона 'Americas' вывести названия стран, городов и департаментов, в которых никто не работает.
select cnt.country_name, loc.city, dep.department_name 
from countries as cnt
join locations as loc
on cnt.country_id = loc.country_id
join departments as dep
on loc.location_id = dep.location_id
left join employees as emp
on dep.department_id = emp.department_id
join regions as reg
on reg.region_id = cnt.region_id
where emp.employee_id is null and reg.region_name = 'Americas';

-- from regions
-- join countries
-- join locations
-- join departments
-- left join employees

-- from employees
-- right join departments
-- join locations
-- join countries
-- join regions

select cnt.country_name, loc.city, dep.department_name 
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
join locations as loc
on loc.location_id = dep.location_id
join countries as cnt
on loc.country_id = cnt.country_id
join regions as reg
on cnt.region_id = reg.region_id
where emp.employee_id is null and reg.region_name = 'Americas';

-- Вывести из таблицы countries те страны, которых нет в locations 
select cnt.country_name
from countries as cnt
left join locations as loc
on cnt.country_id = loc.country_id
where loc.location_id is null;
