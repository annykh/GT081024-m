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
select *
from products
where price > 100 and quantity < 10;

-- is null
-- is not null

-- Вывести продукт, где цена не указана
select * 
from products
where price is null;

-- create table название_таблицы(
-- 	название_поля1 тип_данных [ограничения],
--  назнавие_поля2 тип_данных [ограничения],
--     ...
-- );

-- Ограничения/атрибуты таблиц 

-- unique - значения в поле должны быть уникальными 
-- not null - значения в поле не могут быть незаполненными (null)
-- primary key - not null + unique - в таблцие можно использовать только один раз
-- check(условие) - значение поле сответствует какому-либо условию 
-- default значение - у поля будет значение по умолчанию 
-- auto_increment - позволяет создавать уникальный номер автоматически, когда новая 
-- запись вставляется в таблицу. Часто это поле основного ключа, которое мы хотели бы создать 
-- автоматически каждый раз, когда будет вставлена новая запись.

-- Создать таблицу students
-- id целое число, уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10 (вкл)
-- subject_name varchar not null
-- mark integer от 0 до 5 (вкл)
-- school_no integer по умолч. 0
-- checked char(1) значение Y либо N

create table students(
	id int primary key auto_increment,
    firstname varchar(100) not null,
    lastname varchar(100) not null,
    class int check(class between 1 and 10),
    subject_name varchar(100) not null,
    mark int check(mark between 0 and 5),
    school_no int default 0,
    checked char(1) check(checked in ('Y', 'N'))
);

select * from students;

-- Заполнение с ошибками 
insert into students
values ('John', 'Smith', 5, 'Math', 4, 120, 'N');
-- Error Code: 1136. Column count doesn't match value count at row 1	0.000 sec

-- Решение
insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('John', 'Smith', 5, 'Math', 4, 120, 'N');

insert into students (lastname, class, subject_name, mark, school_no, checked)
values ('Smith', 5, 'Math', 4, 120, 'N');
-- Error Code: 1364. Field 'firstname' doesn't have a default value	0.000 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('John', 'Smith', 15, 'Math', 4, 120, 'N');
-- Error Code: 3819. Check constraint 'students_chk_1' is violated.	0.016 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('John', 'Smith', 10, 'Math', 10, 120, 'N');
-- Error Code: 3819. Check constraint 'students_chk_2' is violated.	0.000 sec

insert into students (firstname, lastname, class, subject_name, mark, checked)
values ('John', 'Smith', 10, 'Math', 5, 'N');

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('John', 'Smith', 10, 'Math', 4, 120, 'L');
-- Error Code: 3819. Check constraint 'students_chk_3' is violated.	0.000 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('John', 'Smith', 10, 'Math', 4, 120, 'NN');
-- Error Code: 1406. Data too long for column 'checked' at row 1	0.016 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('John', 'Smith', 'ten', 'Math', 4, 120, 'N');
-- Error Code: 1366. Incorrect integer value: 'ten' for column 'class' at row 1	0.000 sec

select * from students;
