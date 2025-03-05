-- Горизонтальное  

-- INNER JOIN
-- Join позволяет объединять данные из таблиц "горизонтально". То есть указав
-- правило, по которым мы хотите объединять строки, join их объединяет.
-- При inner join в результирующую выборку попадут только те записи, которые
-- нашли себе пару по условию join (указанное после ключевого слова on).
-- Все остальные записи в результирующую выборку не попадут

-- select table1.column1, table1.column2, table2.column3
-- from table1
-- [inner] join table2
-- on table1.column = table2.column
-- [inner] join table3
-- on условие;

create database company1;
use company1;

create table employees(
	id int primary key,
    first_name varchar(64),
    last_name varchar(64),
    email varchar(128),
    department_id int
);

create table departments(
	id int primary key,
    dep_name varchar(64),
    dep_description varchar(256),
    manager_id int
);

insert into employees
values (1, 'John', 'Smith', 'jsmith@gmail.com', 2),
		(2, 'Bob', 'Brown', 'brown@gmail.com', 2),
        (3, 'David', 'Austin', 'daustin@gmail.com', 1),
        (4, 'Elen', 'Jameson', 'ejameson@gmail.com', 1);
        
insert into departments
values (1, 'IT', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis felis ipsum, vulputate ac sem ut, tincidunt maximus ex. Cras semper metus sed porta laoreet.', 2),
		(2, 'HR', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis felis ipsum, vulputate ac sem ut, tincidunt maximus ex. Cras semper metus sed porta laoreet.', 1), 
        (3, 'Sales', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis felis ipsum, vulputate ac sem ut, tincidunt maximus ex. Cras semper metus sed porta laoreet.', 3);

select * from employees;
select * from departments;

-- Вывести идентификаторы, имена, фамилии сотрудников и название их департаментов.
select id, first_name, last_name, dep_name
from employees
inner join departments
on employees.department_id = departments.id;
-- Error Code: 1052. Column 'id' in field list is ambiguous	0.015 sec

select employees.id, employees.first_name, employees.last_name, departments.dep_name
from employees
join departments
on employees.department_id = departments.id;

select employees.id, employees.first_name, employees.last_name, departments.dep_name
from departments
join employees
on employees.department_id = departments.id;

select emp.id, emp.first_name, emp.last_name, dep.dep_name
from employees as emp -- временное название таблицы 
join departments as dep
on emp.department_id = dep.id;

select t1.id, t1.first_name, t1.last_name, t2.dep_name
from employees as t1 -- t1 - table1
join departments as t2 -- t2 - table2
on t1.department_id = t2.id;

-- Вывести название департамента и имя менеджера департамента(менеджер это сотрудник из employees)
select t1.dep_name, t2.first_name
from departments as t1
join employees as t2
on t1.manager_id = t2.id;

-- Вывести имена, фамилии сотрудников, а так же название их департаментов и имена менеджеров этих департаментов.
select emp.first_name, emp.last_name, dep.dep_name, mng.first_name as mng_name
from employees as emp
join departments as dep
on emp.department_id = dep.id
join employees as mng
on mng.id = dep.manager_id;

-- Вывести все поля из трех таблиц
select emp.*, dep.*, mng.*
from employees as emp
join departments as dep
on emp.department_id = dep.id
join employees as mng
on mng.id = dep.manager_id;


-- Создать базу hr
-- https://github.com/annykh/genTech/blob/main/hr1.txt

select * from employees;
-- employee_id - primary key
-- job_id - foreign key - jobs (job_id)
-- manager_id - foreign key - employees (employee_id)
-- department_id - foreign key - departments (department_id)

select * from departments;
-- department_id - primary key 
-- manager_id - foreign key - employees (employee_id)
-- location_id - foreign key - locations (location_id)

select * from jobs;
-- job_id - primary key

select * from locations;
-- location_id - primary key
-- country_id - foreign key - countries (country_id)

select * from countries;
-- country_id - primary key
-- region_id - foreign key - regions (region_id)

select * from regions;
-- region_id - primary key

-- Вывести имена, фамилии, зарплаты и названия департаментов сотрудников.
select emp.first_name, emp.last_name, emp.salary, dep.department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id;

-- Вывести имена и фамилии сотрудников из департамента 'IT'.
select emp.first_name, emp.last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'IT';

-- Вывести имена, фамилии сотрудников, название департаментов, в которых они работают и города, в которых находятся департаменты.
select emp.first_name, emp.last_name, dep.department_name, loc.city
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id;

-- Вывести имена, фамилии сотрудников, название департаментов, в которых они работают,
-- города, в которых находятся департаменты и название стран, в которых находятся города.
select emp.first_name, emp.last_name, dep.department_name, loc.city, cnt.country_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id
join countries as cnt
on loc.country_id = cnt.country_id;

select emp.first_name, emp.last_name, dep.department_name, loc.city, cnt.country_name
from countries as cnt
join locations as loc
on cnt.country_id = loc.country_id
join departments as dep
on loc.location_id = dep.location_id
join employees as emp
on dep.department_id = emp.department_id;

-- Вывести имена и фамилии сотрудников, департаменты которых находятся в 'United Kingdom'(country_name).
select emp.first_name, emp.last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id
join countries as cnt
on loc.country_id = cnt.country_id
where cnt.country_name = 'United Kingdom';
