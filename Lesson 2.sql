-- Первая молния - ctrl+shift+enter
-- Вторая молния - ctrl+enter

-- Comment
/*
...
*/

-- Создание базы данных 
create database gt081024;

-- Активация базы данных 
use gt081024;

-- Создание таблицы 
-- create table название_таблицы(
-- 	название_поля1 тип_данных [ограничения],
--  назнавие_поля2 тип_данных [ограничения],
--     ...
-- );

-- Простые типы данных 

-- integer/int - целое число
-- numeric/decimal/dec - числовые данные
-- varchar(N) - строки - N - максимальное кол/во символов в  строке 
-- char(M) - строки - M - фиксированое кол/во символов в строке

-- decimal(N, M) - N максимальное кол/во цифр, которое может хранить число (от 1 до 65) (по умолч. 10)
				-- M максимальное кол/во цифр, которое может содержать число после точки (от 0 до N) (по умолч. 0)

-- decimal(5, 2) 
-- [-999.99 ; 999.99]
               
create table products(
	product_id int,
    title varchar(100),
    price decimal,
    quantity int
);

-- Вывести таблицу products
select * from products;

-- Заполнить таблицу products
-- insert into название_таблицы
-- values (значение1, значение2, значение3, ...);

-- insert into название_таблицы (поле1, поле2, поле3, ...)
-- values (значение1, значение2, значение3, ...);

-- insert into название_таблицы (поле1, поле2, поле3, ...)
-- values (значение1, значение2, значение3, ...), 
-- (значение1, значение2, значение3, ...),
-- (значение1, значение2, значение3, ...),
-- (...);

insert into products
values (1, 'Apple', 100, 6), 
(2, 'Orange', 150, 10),
(3, 'Kiwi', 120, 4),
(4, 'Banana', 150, 11),
(5, 'Mango', 250, 15),
(6, 'Grapes', 100, 12);

select * from products;

-- Ошибки
insert into product
values (7, 'Pear', 150, 8);
-- Error Code: 1146. Table 'gt081024.product' doesn't exist	0.000 sec

insert into products
values (7, 'Pear', 150, 8, 5);
-- Error Code: 1136. Column count doesn't match value count at row 1	0.000 sec

insert into products
values (7, 'Pear', 150);
-- Error Code: 1136. Column count doesn't match value count at row 1	0.000 sec

insert into products (id, title, quantity)
values (8, 'Watermelon', 10);
-- Error Code: 1054. Unknown column 'id' in 'field list'	0.000 sec

insert into products (product_id, title, quantity)
values (7, 'Pear', 8);

select * from products;

-- null != 0, null != '', null != undefined

-- Вывести названия продуктов, где кол/во больше 10.
select title
from products
where quantity > 10;

-- Вывести продукты, названия которых начинаются на букву 'M'.
select *
from products
where title like 'm%';

-- Вывести продукты Apple, Mango и Kiwi
select * 
from products
where title in ('Apple', 'Mango', 'Kiwi');
-- where title = 'Apple' or title = 'Mango' or title = 'Kiwi';

-- Вывести продукты, где цена находится в диапазоне от 100 до 150
select * 
from products
where price between 100 and 150;

-- Вывести продукты, где цена больше 100 и кол/во меньше 10.
