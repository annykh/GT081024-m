-- 11. Вывести имена и фамилии сотрудников с должностями(job_id) IT_PROG и ST_MAN, которые получают либо самую низкую, либо самую высокую зарплату в компании.
select first_name, last_name
from employees
where job_id in ('IT_PROG', 'ST_MAN') and (salary = (select max(salary) from employees) or salary = (select min(salary) from employees));

-- 11. Вывести имена и фамилии сотрудников из отделов(job_id) IT_PROG и ST_MAN, которые получают либо самую низкую, либо самую высокую зарплату в своих отделах. 
select first_name, last_name, salary, job_id
from employees
where job_id in ('IT_PROG', 'ST_MAN') and (salary = (select max(salary) from employees where job_id in ('IT_PROG', 'ST_MAN')) or salary = (select min(salary) from employees  where job_id in ('IT_PROG', 'ST_MAN')));
-- job_id = 'IT_PROG' and salary = max() or job_id = 'IT_PROG' and salary = min() or job_id = 'ST_MAN' and salary = max() or job_id = 'ST_MAN' and salary = min()

-- 12. Вывести имя и фамилию сотрудника с минимальной зарплатой, который работает в городе Seattle.
select emp.first_name, emp.last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id
where loc.city = 'Seattle' and emp.salary = (select min(emp.salary)
		from employees as emp
		join departments as dep
		on emp.department_id = dep.department_id
		join locations as loc
		on dep.location_id = loc.location_id
		where loc.city = 'Seattle');


-- Вывести сотрудников, которые получают столько, сколько минимальная зарплата среди сотрудников из города 'Seattle'
select first_name, last_name
from employees 
where salary = (select min(emp.salary)
		from employees as emp
		join departments as dep
		on emp.department_id = dep.department_id
		join locations as loc
		on dep.location_id = loc.location_id
		where loc.city = 'Seattle');

-- 13. Найти количество сотрудников из департамента Shipping, которые зарабатывают меньше средней зарплаты среди всех сотрудников этого департамента.
-- Средняя зарплата среди сотрудниов из Shipping.
select avg(emp.salary)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'Shipping';

-- Сотрудники из Shipping которые получают меньше средней зарплаты
select emp.first_name, emp.last_name, emp.salary
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'Shipping' and emp.salary < (select avg(emp.salary)
												from employees as emp
												join departments as dep
												on emp.department_id = dep.department_id
												where dep.department_name = 'Shipping');

-- Количество сотрудников из департамента Shipping, которые зарабатывают меньше средней зарплаты среди всех сотрудников этого департамента.
select count(emp.employee_id)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'Shipping' and emp.salary < (select avg(emp.salary)
												from employees as emp
												join departments as dep
												on emp.department_id = dep.department_id
												where dep.department_name = 'Shipping');

-- 14. Найти среднюю зарплату среди сотрудников, работающих в стране 'United Kingdom'.
select avg(emp.salary)
from employees as emp
join departments as dep
on dep.department_id = emp.department_id
join locations as loc
on loc.location_id = dep.location_id
join countries as cnt
on cnt.country_id = loc.country_id
where cnt.country_name = 'United Kingdom';

-- 15. Найти сотрудников, работающих в стране 'United States of America', чья зарплата выше средней зарплаты сотрудников, работающих в стране 'United Kingdom'. Вывести их имена, фамилии и зарплаты.
select emp.first_name, emp.last_name, emp.salary
from employees as emp
join departments as dep
on dep.department_id = emp.department_id
join locations as loc
on loc.location_id = dep.location_id
join countries as cnt
on cnt.country_id = loc.country_id
where cnt.country_name = 'United States of America' and emp.salary > (select avg(emp.salary)
		from employees as emp
		join departments as dep
		on dep.department_id = emp.department_id
		join locations as loc
		on loc.location_id = dep.location_id
		join countries as cnt
		on cnt.country_id = loc.country_id
		where cnt.country_name = 'United Kingdom');
        

-- Группировка

-- Операторы GROUP BY и HAVING позволяют сгруппировать данные. Они употребляются в рамках команды SELECT.

-- SELECT столбцы
-- FROM таблица
-- [JOIN ... ON]
-- [WHERE условие_фильтрации_строк]
-- [GROUP BY столбцы_для_группировки]
-- [HAVING условие_фильтрации_групп]
-- [ORDER BY столбцы_для_сортировки]
-- [LIMIT];   

-- Выполняются по порядку:
-- FROM
-- JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY
-- LIMIT

-- Безопасный/строгий режим группировки  
SET sql_mode = CONCAT(@@sql_mode, ',ONLY_FULL_GROUP_BY');

-- Вывести кол/во сотрудников по департаментам. department_id и emp_count
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id;

-- Вывести ид департаментов, в которых кол/во сотрудников больше 10. department_id и emp_count
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id
having count(employee_id) > 10;

-- Работает только в mysql
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id
having emp_count > 10;

-- Найти средние зарплаты по департаментам. Вывести department_id и avg_salary.
select department_id, avg(salary) as avg_salary
from employees
where department_id is not null
group by department_id;

-- Найти департаменты, в которых сумма зарплат больше 30000. Вывести department_id и sum_salary.
select department_id, sum(salary) as sum_salary
from employees
where department_id is not null
group by department_id
having sum(salary) > 30000;

-- Нельзя вывести поля вместе с агрегатными функциями, если этих полей нет в group by.
select department_id, sum(salary) as sum_salary, employee_id
from employees
where department_id is not null
group by department_id
having sum(salary) > 30000;
-- Error Code: 1055. Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'hr.employees.employee_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.015 sec


-- Найти максимальные зарплаты по департаментам. Вывести название департамента и максимальную зарплату.
select dep.department_name, max(emp.salary) as max_salary
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
group by dep.department_name;

-- Найти департаменты, где средняя зарплата выше 10000. Вывести название департамента и среднюю зарплату.
select dep.department_name, avg(emp.salary) as avg_salary
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
group by dep.department_name
having avg(emp.salary) > 10000;

-- Найти суммы зарплат в департаментах IT, Sales, Finance и Shipping. Вывести названия департаментов и суммы зарплат.
select dep.department_name, sum(emp.salary) as sum_salary
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name in ('IT', 'Sales', 'Finance', 'Shipping')
group by dep.department_name;


-- Найти кол/во департментов в каждом городе. Вывести город и кол/во департаментов.
select loc.city, count(dep.department_id) as dep_count
from departments as dep
join locations as loc
on dep.location_id = loc.location_id
group by loc.city;

-- Найти кол/во сотрудников по департаментам. Вывести название департамена и кол/во сотрудников. Отсортировать выборку по возр. кол/во сотруднков.
select dep.department_name, count(emp.employee_id) as emp_count
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
group by dep.department_name
order by emp_count;

-- ПОДЗАПРОСЫ SUBSELECT

-- Подзапрос, который возвращает таблицу 
-- select column1, aggregate(column2)
-- from table1
-- [join ... on]
-- [where ...]
-- group by column1
-- [having ...];

-- Запрос, где использован подзапрос, который возвращает таблицу.
-- select table1.column1, table2.column2
-- from table1
-- join (ПОДЗАПРОС) as table2
-- [where ...]
-- [group by ...]
-- [having ...]

-- select table1.column1, table1.column2
-- from (ПОДЗАПРОС) as table1
-- [where ...]
-- [group by ...]
-- [having ...]

-- Найти имена и фамили сотрудников, которые получают максимальную зарплату в своих департаментах.
-- 1. Найти максимальные зарплаты по департаментам. (Подзапрос)
select department_id, max(salary) as max_salary
from employees
where department_id is not null
group by department_id;

-- 2. Решение
select emp.first_name, emp.last_name
from employees as emp
join (select department_id, max(salary) as max_salary
		from employees
		where department_id is not null
		group by department_id) as max_salary_by_dep
on emp.department_id = max_salary_by_dep.department_id
where emp.salary = max_salary_by_dep.max_salary;

-- Вывести имена, фамилии и зарплаты сотрудников, которые получают больше чем средняя зарплата в их департаментах.

-- 1. Найти средние зарплаты по департаментам. Вывести ид департамента и среднюю зарплату. (Подзапрос)
select department_id, avg(salary) as avg_salary
from employees
where department_id is not null
group by department_id;

-- 2. Решение.
select emp.first_name, emp.last_name, emp.salary
from employees as emp
join (select department_id, avg(salary) as avg_salary
	from employees
	where department_id is not null
	group by department_id) as avg_salary_dep
on emp.department_id = avg_salary_dep.department_id
where emp.salary > avg_salary_dep.avg_salary;

-- Найти департаменты с наименьшим кол/вом сотрудников.

-- 1. Вывести ид департаментов и кол/во сотрудников. 
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id;

-- 2. Найти минимальное кол/во сотрудников.
select min(emp_count_by_dep.emp_count) as min_emp_count
from (select department_id, count(employee_id) as emp_count
		from employees
		where department_id is not null
		group by department_id) as emp_count_by_dep;
        
-- 3. Вывести названия департаментов с минимальным кол/вом сотрудников.
select dep.department_name, count(emp.employee_id) as emp_count
from departments as dep
join employees as emp
on dep.department_id = emp.department_id
group by department_name
having count(emp.employee_id) = (select min(emp_count_by_dep.emp_count) as min_emp_count
								from (select department_id, count(employee_id) as emp_count
										from employees
										where department_id is not null
										group by department_id) as emp_count_by_dep);
