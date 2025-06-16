-- CRUD

-- CREATE - create database, create table, insert into
-- READ - select ... from, where, order by, limit, join(inner join/outer join), union/union all, group by, having
-- UPDATE - alter table (add, drop, change, rename, modify), update ... set
-- DELETE - drop database, drop table, delete...from, drop column

-- Вывести имена, фамилии сотрудников, название департаментов, и города, в которых находятся департаменты.
select emp.first_name, emp.last_name, dep.department_name, loc.city
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id;

SET sql_mode = 'ONLY_FULL_GROUP_BY';

select max(salary), first_name, last_name
from employees;
-- Error Code: 1140. In aggregated query without GROUP BY, expression #2 of SELECT list contains nonaggregated column 'hr.employees.first_name'; this is incompatible with sql_mode=only_full_group_by	0.000 sec

-- Вывести суммы зарплат по департаментам.
select dep.department_name, sum(emp.salary) as sum_salary
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
group by dep.department_id;
-- Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'hr.dep.department_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.000 sec

-- Найти сотрудника, который получает максимальную зарплату.
select max(salary)
from employees;

select first_name, last_name
from employees
where salary = (select max(salary) from employees);

-- Найти департаменты, в которых сотрудники получают больше средней зарплаты по компании.
select avg(salary) from employees;

select first_name, last_name
from employees 
where salary > (select avg(salary) from employees);

select distinct dep.department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where emp.salary > (select avg(salary) from employees);
