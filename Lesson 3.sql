create database test1; -- Создать бд test1

use test1; -- Активировать бд test1

drop database test1; -- Удалить бд test1

use gt081024;

create table test(
	id int primary key auto_increment,
    title varchar(128),
    price int default 0
); -- Создать таблицу test

rename table test to test1; -- Переименовать таблицу test

insert into test1 (title, price)
values ('pencil', 40); -- Заплонить таблицу test1

insert into test1 (title, price)
values ('notebook', 70);

insert into test1 (title, price)
values ('pen', 35);

select * from test1; -- Вывести таблицу test1

select title
from test1
where price > 40;

drop table test; -- Удалить таблицу test
drop table test1; -- Удалить талицу test1

create table users(
	id int primary key auto_increment,
    firstname varchar(64),
    lastname varchar(128),
    age decimal(5, 2)
);

-- Изменение таблиц и столбцов
-- alter table название_таблицы 
-- add column название_столбца тип_данных [ограничение], -- создание нового поля
-- drop column название_столбца, -- удаление столбца
-- modify column название_столбца новый_тип_данных, -- изменение типа данных
-- rename column название_столбца to новое_название_столбца, -- переименование поля
-- change column название_столбца новое_название_столбца тип_данных/новый_тип_данных; -- переименование поля и изменение типа

-- Добавить поле gender тип данных char(1)
alter table users
add column gender char(1);

-- Добавить поле user_name varchar(128) и переименовать поле firstname на first_name, а lastname на last_name.
alter table users
add column user_name varchar(128),
rename column firstname to first_name,
rename column lastname to last_name;

-- Добавить поле sal int, переименовать поле sal на salary, изменить тип данных salary на decimal(8, 2)
alter table users
add column sal int,
rename column sal to salary, 
modify column salary decimal(8, 2);
-- Error Code: 1054. Unknown column 'salary' in 'users'	0.016 sec

alter table users
add column sal int;

alter table users
change column sal salary decimal(8, 2);

-- Удалить поле user_name
alter table users
drop column user_name;

-- Удалить поле gender
-- Добавить поле has_child varchar(4) по умолчанию 'No'
-- Переименовать поле id на user_id
-- Изменить тип данных поля has_child на varchar(3)

alter table users
drop column gender,
add column has_child varchar(4) default 'No',
rename column id to user_id;

alter table users
modify column has_child varchar(3);

-- first - в начало
-- after название_поле - после поля
-- before название_поле - до поля

-- Добавить поле gender char(1), вставить после age.
alter table users
add column gender char(1) after age;

-- Создать таблицу students1 с полями
-- name строка(60) (не null)
-- lastname строка(100) (не null)
-- avg_mark целое число (от 0 до 5 вкл.)
-- gender строка(128) (или 'M' или 'F')

create table students1(
	name varchar(60) not null,
    lastname varchar(100) not null,
    avg_mark int check(avg_mark between 0 and 5), -- check(avg_mark>=0 and avg_mark<= 5)
    gender varchar(128) check(gender in ('M', 'F')) -- check(gender = 'M' or gender = 'F')
);

-- Добавить поле id integer primary key auto_increment в начало таблицы 
alter table students1
add column id int primary key auto_increment first; -- before name

-- Добавить поле age (тип целое число) после lastname
alter table students1
add column age int after lastname;

-- Поменять тип у gender на char(1)
alter table students1
modify column gender char(1);

-- Переименовать поле name на firstname
alter table students1
rename column name to firstname;

-- Если в бд gt081024 есть таблица employees, удаляем
drop table employees;

create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");

select * from employees;

-- Выборка ункиальных значений 
-- select distinct названия_поля, ...
-- from название таблицы;

-- Вывести названия всех департаментов из таблицы employees
select department
from employees;
-- Вывод всех департаментов для каждого сотрудника(есть дубликаты)

-- Вывести названия департамнетов(уникальные значения)
select distinct department
from employees;

-- Вывести имена и фамилии сотрудников
select first_name, last_name
from employees;

-- Вывести имена и фамилии сотрудников без дубликатов(если и имена и фамилии совпадают)
select distinct first_name, last_name
from employees;

-- Сортировка
-- select поле1, поле2, ...
-- from название_таблицы 
-- where условие
-- order by название_поля asc(по возр./в алф. пордяке)/desc(по убыв./в обратном порядке); 
-- По умолчанию asc

-- Вывести имена, фамилии и зарплаты сотрудников. Отсортировать по зарплатам по возрастанию.
select first_name, last_name, salary
from employees
order by salary;

-- Вывести сотрудников, которые получают больше 5000. Отсортировать в алфавитном порядке департаментов.
select *
from employees
where salary > 5000
order by department;

-- Вывести имена и фамилии сотрудников из департамента IT. Отсортровать в алфавитном порядке фамилий.
select first_name, last_name
from employees
where department = 'IT'
order by last_name;
