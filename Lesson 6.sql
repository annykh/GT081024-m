-- Функция CASE

-- CASE
--     WHEN условие_1 THEN результат_1
--     WHEN условие_2 THEN результат_2
--     .................................
--     WHEN условие_N THEN результат_N
--     [ELSE альтернативный_результат]
-- END

create table phones (
	id int primary key auto_increment,
    product_name varchar(128),
    product_count int,
    product_price int
);

insert into phones (product_name, product_count, product_price)
values ('iphone 15', 15, 700),
		('iphone 15 pro', 19, 750),
        ('samsung A11', 25, 600),
        ('xiaomi redmi 10', 8, 450),
        ('iphone 16', 1, 800),
        ('iphone 16 pro', 0, 900),
        ('iphone 16 pro max', 50, 1000),
        ('xiaomi redmi 11', 0, 650),
        ('sony xperia z3', 13, 720);
        
select * from phones;


-- Вывести название продукта, кол/во проданных продуктов, стоимость и посчитать общую сумму заказов(product_count*product_price)
 select product_name, product_count, product_price, product_count*product_price as total_sum
 from phones;
 
 -- Вывести название продукта, кол/во проданных продуктов, стоимость и 
 -- посчитать общую сумму заказов и вывести 'null', если кол/во(product_count) = 0, 
 -- и вывести сумму, если кол/во(product_count) больше 0 
 
 select product_name, product_count, product_price, 
		 case 
			when product_count > 0 then product_count*product_price
            when product_count = 0 then 'null'
		 end as total_sum
 from phones;
 
 
 -- Вывести название продукта, кол/во товаров в наличии(product_count) и новое поле count_info, со значениями:
 -- Нет в наличии, если кол/во = 0 
 -- Товар заканчивается, если кол/во меньше 2.
 -- Мало товара, если кол/во меньше 5.
 -- Есть в наличии, если кол/во меньше 15.
 -- Много товара, в остальных случаях.
 
 select product_name, product_count,
		case
			when product_count = 0 then 'Нет в наличии'
			when product_count < 2 then 'Товар заканчивается'
            when product_count < 5 then 'Мало товара'
            when product_count < 15 then 'Есть в наличии'
            else 'Много товара'
        end as count_info
from phones;

-- Создать поле count_info и заполнить:
	 -- Нет в наличии, если кол/во = 0 
	 -- Товар заканчивается, если кол/во меньше 2.
	 -- Мало товара, если кол/во меньше 5.
	 -- Есть в наличии, если кол/во меньше 15.
	 -- Много товара, в остальных случаях.

alter table phones
add column count_info varchar(255);

set sql_safe_updates = 0;

update phones
set count_info = case
					when product_count = 0 then 'Нет в наличии'
                    when product_count < 2 then 'Товар заканчивается'
                    when product_count < 5 then 'Мало товара'
                    when product_count < 15 then 'Есть в наличии'
                    else 'Много товара'
				 end;



-- Переименовать поле product_price на starting_price
alter table phones
rename column product_price to starting_price;

select * from phones; 

-- Вывести product_name, starting_price и новое поле tax 
-- Заполнить поле tax:
-- Если начальная цена меньше/равно 700, tax = null,
-- если больше 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

select product_name, starting_price, 
		case
			when starting_price <= 700 then null
            when starting_price < 850 then 15
            else 25
        end as tax
from phones;

-- Создать новое поле tax целое число
-- Заполнить поле tax:
-- Если начальная цена меньше/равно 700, tax = null,
-- если больше 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

alter table phones
add column tax int;

update phones
set tax = case
				when starting_price <= 700 then null
				when starting_price < 850 then 15
				else 25
			end;
            
select * from phones;

-- Посчитать конечную цену и представить его как final_price
-- final_price = (starting_price + starting_price * tax / 100)
-- Вывести product_name, starting_price, tax, final_price

select product_name, starting_price, tax, (starting_price + starting_price * tax / 100) as final_price
from phones;

select product_name, starting_price, tax, 
		case
			when tax is null then starting_price
            else starting_price + starting_price * tax / 100
		end as final_price
from phones;

-- COALESCE

-- COALESCE(выражение_1, выражение_2, выражение_N) -- возвращает первое из них, которое не равно NULL

-- coalesce('string', 0, '', null, 5) -- 'string'
-- coalesce(10 + 20 * null, round(20 / 3 * null), 'string') -- 'string'

select product_name, starting_price, tax, coalesce(starting_price + starting_price * tax / 100, starting_price) as final_price
from phones;

-- IF

-- IF(условие, значение_1, значение_2) 
-- Если условие, передаваемое в качестве первого параметра, верно, то возвращается первое значение, 
-- иначе возвращается второе значение.

-- IFNULL

-- IFNULL(выражение, значение)
-- Функция IFNULL проверяет значение некоторого выражения.
-- Если оно равно NULL, то функция возвращает значение, которое передается в качестве второго параметра

-- Использовать таблицу employees.
-- https://github.com/annykh/GT081024-m/blob/main/employees.sql
   
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

-- 1. Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для Human Resources 20% и для IT 35%. Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 
select department, salary,
		case
			when department in ('Human Resources', 'Sales') then salary + salary * 20 /100
            when department = 'Finance' then salary + salary * 15 /100
            when department = 'Shipping' then salary + salary * 10 /100
            when department = 'Marketing' then salary + salary * 25 /100
            when department = 'IT' then salary + salary * 35 /100
        end as new_salary
from employees;

-- 2. Создать поле new_salary типа numeric(7, 2)
alter table employees
add column new_salary numeric(7, 2);

-- 3. Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%.
update employees
set new_salary = case
					when department in ('Human Resources', 'Sales') then salary + salary * 20 /100
					when department = 'Finance' then salary + salary * 15 /100
					when department = 'Shipping' then salary + salary * 10 /100
					when department = 'Marketing' then salary + salary * 25 /100
					when department = 'IT' then salary + salary * 35 /100
				end;

select * from employees;

-- 4. Вывести из таблицы employees first_name как user_name, last_name как surname и новое поле full_name, которое состоит из имен и фамилий сотрудников.
select first_name as user_name, last_name as surname, concat(first_name, ' ', last_name) as full_name
from employees;