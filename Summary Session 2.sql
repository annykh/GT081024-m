-- create database database_name;

-- use database_name;

use gt081024;

-- create table table_name1(
-- 	column_name1 data_type constraint,
--     column_name2 data_type constraint,
--     ...
-- );

-- int
-- decimal/numeric
-- varchar(max_str_count)
-- char(fixed_str_count)

-- unique
-- not null
-- primary key
-- check()
-- default 
-- auto_increment

-- create table students(
-- 	id int primary key auto_increment,
--     firstname varchar(100) not null,
--     lastname varchar(100) not null,
--     class int check(class between 1 and 10),
--     subject_name varchar(100) not null,
--     mark int check(mark between 0 and 5),
--     school_no int default 0,
--     checked char(1) check(checked in ('Y', 'N'))
-- );

-- insert into students(firstname, lastname, class, subject_name, school_no,  mark, checked)
-- values ('John', 'Smith', 3, 'Math', 120,  5, 'Y'), 
-- ('Bob', 'Brown', 5, 'IT', default, 4, 'Y');

-- select * from students;

-- 1. Создайте таблицу с названием Employees, которая будет содержать информацию о сотрудниках компании. 
-- Таблица должна иметь следующие поля:

-- employee_id - уникальный идентификатор сотрудника (Primary Key) и автозаполнение
-- first_name - имя сотрудника (Not Null)
-- last_name - фамилия сотрудника (Not Null)
-- email - адрес электронной почты сотрудника (уникальное значение, не пустое)
-- age - возраст сотрудника (в диапазоне от 20 до 50 (вкл.))

create table Employees(
	employee_id int primary key auto_increment,
	first_name varchar(128) not null,
	last_name varchar(128) not null,
	email varchar(128) unique not null,
	age int check(age between 20 and 50)
);

-- 2. Заполните таблицу данными с помощью следующих записей:

-- Сотрудник с именем "John", фамилией "Doe", адресом электронной почты "john.doe@example.ge" и возрастом 39 лет.
-- Сотрудник с именем "Jane", фамилией "Smith", адресом электронной почты "jane.smith@example.com" и возрастом 25 лет.
-- Сотрудник с именем "Michael", фамилией "Johnson", адресом электронной почты "michael.johnson@example.am" и возрастом 22 года.
-- Сотрудник с именем "Emily", фамилией "Brown", адресом электронной почты "emily.brown@example.com" и возрастом 29 лет.

insert into Employees(first_name, last_name, email, age)
values ('John', 'Doe', 'john.doe@example.ge', 39),
		('Jane', 'Smith', 'jane.smith@example.com', 25),
        ('Michael', 'Jonson', 'michael.johnson@example.am', 22),
        ('Emily', 'Brown', 'emily.brown@example.com', 29);
        
select * from Employees;        

insert into Employees(first_name, last_name, email, age)
values ('Bob', 'Doe', 'bob.doe@example.ge', 40),
		('Jane', 'Hardy', 'jane.hardy@example.com', 20),
        ('Jack', 'Jonson', 'jack.johnson@example.am', 60),
        ('Emily', 'Brown', 'emily.brown@example.com', 29);

insert into Employees(first_name, last_name, email, age)
values ('Bob', 'Doe', 'bob.doe@example.ge', 40),
		('Jane', 'Hardy', 'jane.hardy@example.com', 20),
        ('Jack', 'Jonson', 'jack.johnson@example.am', 50),
        ('Emily', 'Brown', 'emily.brown@example.com', 29);
        

insert into Employees(first_name, last_name, email, age)
values ('Bob', 'Doe', 'bob.doe@example.ge', 40),
		('Jane', 'Hardy', 'jane.hardy@example.com', 20),
        ('Jack', 'Jonson', 'jack.johnson@example.am', 50),
        ('Emily', 'Brown', 'emily.brown1@example.com', 29);

-- Error Code: 3819. Check constraint 'employees_chk_1' is violated.	0.016 sec
-- Error Code: 1062. Duplicate entry 'emily.brown@example.com' for key 'employees.email'	0.000 sec

insert into Employees(first_name, last_name, email, age)
values ('Bob', 'Doe', 'bob.doe1@example.ge', 40);

insert into Employees(first_name, last_name, email, age)
values ('Bob', 'Doe', 'bob.doe2@example.ge', 40);

insert into Employees(first_name, last_name, email, age)
values ('Bob', 'Doe', 'bob.doe3@example.ge', 40);

rename table Employees to Employees1;

create table staff(
	id int primary key auto_increment,
    firstname varchar(60) not null,
    lastname varchar(100) not null,
    position varchar(100),
    age int check(age between 0 and 110),
    has_child char(1) check(has_child in ('Y', 'N')),
    username varchar(100) unique not null
);

-- Найти ошибку в коде:
insert into staff (firstname, lastname, age, has_child, username)
values ('Dave', 'Faviet', 23, 'YY', 'favietDv');
-- Error Code: 1406. Data too long for column 'has_child' at row 1	0.016 sec

insert into staff (firstname, lastname, age, has_child, username)
values ('DaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDaveDave', 'Faviet', 23, 'Y', 'favietDv');
-- Error Code: 1406. Data too long for column 'firstname' at row 1	0.000 sec
