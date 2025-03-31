-- https://github.com/NelliEfr/hr_data/blob/master/script.sql 

-- 1. Найти общее количество департаментов в компании.
select count(department_id)
from departments;

-- 2. Вывести имена и фамилии сотрудников с максимальной и минимальной зарплатой.
select first_name, last_name, salary
from employees
where salary = (select max(salary) from employees) or salary = (select min(salary) from employees);

-- 3. Найти самую низкую и самую высокую зарплату среди сотрудников с должностями IT_PROG и ST_MAN.
select min(salary), max(salary)
from employees
where job_id in ('IT_PROG', 'ST_MAN');

-- 4. Вывести имя, фамилию, зарплату и название департамента сотрудника с максимальной зарплатой в компании.
select emp.first_name, emp.last_name, emp.salary, dep.department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where emp.salary = (select max(salary) from employees);

-- 5. Найти самую большую зарплату среди сотрудников, работающих в департаментах с ID 70 и 80.
select max(salary)
from employees
where department_id in (70, 80);

-- 6. Найти среднюю зарплату в департаменте с ID 90.
select avg(salary)
from employees
where department_id = 90;

-- 7. Найти количество сотрудников из департамента с ID 100, которые зарабатывают более 5000.
select count(employee_id)
from employees
where department_id = 100 and salary > 5000;

-- 8. Найти количество сотрудников из департамента с ID 60, которые зарабатывают больше средней зарплаты по компании.
select count(employee_id)
from employees
where department_id = 60 and salary > (select avg(salary) from employees);

-- 9. Найти количество департаментов, в которых никто не работает.
select count(dep.department_id)
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
where emp.employee_id is null;

-- 10. Найти количество сотрудников из департамента IT, которые зарабатывают больше средней зарплаты по компании.
select count(emp.employee_id)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'IT' and emp.salary > (select avg(salary) from employees);

-- 11. Вывести имена и фамилии сотрудников с должностями IT_PROG и ST_MAN, которые получают либо самую низкую, либо самую высокую зарплату.
-- 12. Вывести имя и фамилию сотрудника с минимальной зарплатой, который работает в городе Seattle.
-- 13. Найти количество сотрудников из департамента Shipping, которые зарабатывают меньше средней зарплаты среди всех сотрудников этого департамента.
-- 14. Найти среднюю зарплату среди сотрудников, работающих в стране 'United Kingdom'.
-- 15. Найти сотрудников, работающих в стране 'United States of America', чья зарплата выше средней зарплаты сотрудников, работающих в стране 'United Kingdom'. Вывести их имена, фамилии и зарплаты.
