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

-- Вывсти пользователей которым больше 18 и живут они в USA.
/* select *
from customers
where age > 18 and country = 'USA'; */

-- Вывести пользователей которые из USA или из UK.
/* select *
from customers
where country = 'USA' or country = 'UK'; */

-- Вывести покупателей, которым больше 30 или меньше 25.
/* select *
from customers
where age > 30 or age < 25; */

-- Вывести покупателей, в возрасте от 20 до 30 вкл. концы.
/* select *
from customers
where age >= 20 and age <= 30; */

-- column between min and max (вкл. min, max)
/* select * 
from customers
where age between 20 and 30; */

-- Вывести покупателей, которым больше 30 или меньше 25.
-- [-infinity: 25] [30: +infinity]
-- not [25:30]
/* select *
from customers
where age not between 25 and 30; */

-- column in (value1, value2, value3, ...)

-- Вывести пользователей которые из USA или из UK.
/*  select *
from customers
where country in ('USA', 'UK'); */

-- Вывести всех покупателей, кроме John, David, Alex
/* select *
from customers
where first_name != 'John' and first_name != 'David' and first_name != 'Alex'; */

/* select * 
from customers
where first_name not in ('John', 'David', 'Alex'); */

-- column like 'шаблон'
/*
% - любое кол/во любых символов
_ - один символ(любой)
*/

/*
имя начинается на букву 'B' - first_name like 'b%'
мейл заканчивается на '.com' - mail like '%.com'
описание товара содержит подстоку 'book' - description like '%book%'
'..... notebook .....'
описание товара содержит слово 'book'(не может быть 'notebook', только '...... book .......') - description like '% book %'
страна USA (равенство без проверки регистра) - country like 'usa'
имя где вторая буква 'o' - first_name like '_o%' 
имя где предпоследняя буква 't' - first_name like '%t_'
третий символ 'd' - first_name like '__d%'
*/

-- Вывести пользователей у которых имя начинается на 'b'
/* select *
from customers
where first_name like 'b%'; */

-- Вывести пользователей у которых имя начинается на 'r' и заканчивается на 't'
/* select * 
from customers
where first_name like 'r%t'; */

-- Вывести покупателей где вторая буква имени О.
/* select *
from customers
where first_name like '_o%'; */

-- Вывести покупателей где в середине имени встречается буква 'b'.
/* 
Ben -
Rob - 
Barbarra +
Robert + 
*/
/* select *
from customers
where first_name like '_%b%_'; */


-- link
-- Найти ссылки по шаблону '[любые символы]www.[любые символы]sql[любые символы].com'

-- https://www.onlinesqleditor.com
-- https://www.sqleditor.com
-- https://www.onlinesql.com
-- www.onlinesql.com

-- link like '%www.%sql%.com'
