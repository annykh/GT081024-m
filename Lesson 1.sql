-- Работа в песочнице 
-- https://www.programiz.com/sql/online-compiler/

-- Выборки 

/* SELECT поле1, поле2, ... FROM имя_таблицы;

SELECT поле1, поле2, ... 
FROM имя_таблицы;

select поле1, поле2, ...
from имя_таблицы; */

/*
select *(все поля)
from имя_таблицы;
*/

-- Вывести таблицу Customers
/* select *
from customers; */

-- Вывести имена и фамилии из таблицы Customers (поля first_name и last_name).
/* select first_name, last_name
from customers; */

-- Вывести имена, возраст и страны из таблицы Customers.
/* select first_name, age, country
from customers; */

-- Вывести имена, фамилии и возраст покупателей, которым больше 25.
/* select first_name, last_name, age
from customers
where age > 25; */

-- Вывести пользователей из USA.
/* select *
from customers
where country = "USA"; */

-- Вывести пользователей с фамилией 'Doe'
/* select * 
from customers
where last_name = 'Doe'; */

-- ОШИБКИ
/* select *
from users;
Error: no such table: users */

/* selct *
from customers;
Error: near "selct": syntax error */

/* select *
from customers;
where age > 18;
Error: near "where": syntax error */

/* select *
from customers
where name = 'John';
Error: no such column: name */

/* select * 
from customers
where last_name = Doe;
Error: no such column: Doe */

-- Пустая выборка
/* select *
from customers
where first_name = 'Lily';
SQL query successfully executed. However, the result set is empty. */
