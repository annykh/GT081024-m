-- 6. Вывести название курса и имя преподавателя, который является заведующим кафедрой для данного курса.
-- select * from teachers;
-- select * from courses;
select t1.title, t2.name
from courses as t1
join teachers as t2
on t1.headman_id = t2.id;

-- 6.1. Вывести название курса и имя преподавателя, который ведет этот курс.
select t1.title, t2.name
from courses as t1
join teachers as t2
on t1.teacher_id = t2.id;

-- 7. Вывести имя студента и имена преподавателей, которые являются заведующими кафедрой для курсов, на которые записан студент.
select * from students;
select * from teachers;
select * from courses;
select * from students2courses;

select st.name as student_name, tch.name as teacher_name
from students as st
join students2courses as s2c
on st.id = s2c.student_id
join courses as crs
on s2c.course_id = crs.id
join teachers as tch
on crs.headman_id = tch.id;

-- SELF JOIN

-- select column1, column2, ...
-- from table_name as table1
-- inner join/left join/right join table_name as table2
-- on table1.column1 = table2.column2;

select * from employees;
select * from employees;
select * from departments;

-- Вывести имена и фамилии сотрудников и имена и фамилии их менеджеров.
select emp_table.first_name as emp_first_name, emp_table.last_name as emp_last_name, mng_table.first_name as mng_first_name, mng_table.last_name as mng_last_name
from employees as emp_table
join employees as mng_table
on emp_table.manager_id = mng_table.employee_id; -- id менеджеров всех сотрудников = id менеджеров

insert into employees
values (207, 'John', 'Smith', 'JSMITH', '515.123.8181', 'AC_ACCOUNT', 8000, null, 315, 110);

-- Вывести сотрудников у которых нет менеджера.
select emp_table.first_name as emp_first_name, emp_table.last_name as emp_last_name
from employees as emp_table
left join employees as mng_table
on emp_table.manager_id = mng_table.employee_id
where mng_table.employee_id is null;


-- Вывести имена, фамилии и зарплаты сотрудников, которые получают больше чем 'Jennifer' 'Dilly'.
-- select first_name, last_name, salary
-- from employees
-- where salary > 3600;

-- select salary
-- from employees
-- where first_name = 'Jennifer' and last_name = 'Dilly';

select all_emp.first_name, all_emp.last_name, all_emp.salary
from employees as all_emp -- все сотрудники кроме 'Jennifer' 'Dilly'
join employees as j_d -- Только 'Jennifer' 'Dilly'
on all_emp.employee_id != j_d.employee_id
where j_d.first_name = 'Jennifer' and j_d.last_name = 'Dilly' and all_emp.salary > j_d.salary;

select all_emp.first_name, all_emp.last_name, all_emp.salary
from employees as all_emp -- все сотрудники кроме 'Jennifer' 'Dilly'
join employees as j_d -- Только 'Jennifer' 'Dilly'
on all_emp.salary > j_d.salary
where j_d.first_name = 'Jennifer' and j_d.last_name = 'Dilly';

-- Найти сотрудников, коротые работают в том же депараменте, что 'Laura' 'Bissot'. (Все кроме 'Laura' 'Bissot')
select all_emp.first_name, all_emp.last_name, all_emp.department_id
from employees as all_emp
join employees as l_b
on all_emp.employee_id != l_b.employee_id
where l_b.first_name = 'Laura' and l_b.last_name = 'Bissot' and all_emp.department_id = l_b.department_id;

-- Найти сотрудников, коротые работают в том же депараменте, что 'Laura' 'Bissot'. (+ 'Laura' 'Bissot')
select all_emp.first_name, all_emp.last_name, all_emp.department_id
from employees as all_emp
join employees as l_b
on all_emp.department_id = l_b.department_id
where l_b.first_name = 'Laura' and l_b.last_name = 'Bissot';

-- ПОДЗАПРОСЫ - SUBSELECT

-- Подзапрос с одним полем/значением
-- select column1
-- from table1
-- where ...;

-- Запрос с подзапросом
-- select column1, column2, ...
-- from table_name1
-- [joins ...]
-- where column1 = (select column1
-- 				from table1
-- 				where ...);


-- Вывести имена, фамилии и зарплаты сотрудников, которые получают больше чем 'Jennifer' 'Dilly'.
select salary
from employees
where first_name = 'Jennifer' and last_name = 'Dilly'; -- запрос имеет одно значение

select first_name, last_name, salary
from employees
where salary > (select salary
				from employees
				where first_name = 'Jennifer' and last_name = 'Dilly');
                
                
-- Найти сотрудников, коротые работают в том же депараменте, что 'Laura' 'Bissot'. (+ 'Laura' 'Bissot')
select first_name, last_name
from employees
where department_id = (select department_id from employees where first_name = 'Laura' and last_name = 'Bissot');

-- Найти сотрудников, коротые работают в том же депараменте, что 'Laura' 'Bissot'. (Все кроме 'Laura' 'Bissot')
select first_name, last_name
from employees
where department_id = (select department_id from employees where first_name = 'Laura' and last_name = 'Bissot') and first_name != 'Laura' and last_name != 'Bissot';
-- and employee_id != (select employee_id from employees where first_name = 'Laura' and last_name = 'Bissot')

-- Вывести имя, фамилию и зарплату первых трех сотрудников, которые зарабатывают меньше "Adam" "Fripp"
-- И через self join, и через подзапросы 
select all_emp.first_name, all_emp.last_name, all_emp.salary
from employees as all_emp
join employees as a_f
on all_emp.salary < a_f.salary
where a_f.first_name = 'Adam' and a_f.last_name = 'Fripp'
limit 3;

select first_name, last_name, salary
from employees
where salary < (select salary from employees where first_name = 'Adam' and last_name = 'Fripp')
limit 3;

-- Выведите сотрудников, которые зарабатывают больше, чем Charles Johnson, но работают в другом департаменте.
-- И через self join, и через подзапросы 
select all_emp.first_name, all_emp.last_name, all_emp.salary
from employees as all_emp
join employees as ch_j
on all_emp.salary > ch_j.salary and all_emp.department_id != ch_j.department_id 
where ch_j.first_name = 'Charles' and ch_j.last_name = 'Johnson';

select first_name, last_name, salary
from employees
where salary > (select salary from employees where first_name = 'Charles' and last_name = 'Johnson') and 
		department_id != (select department_id from employees where first_name = 'Charles' and last_name = 'Johnson');
