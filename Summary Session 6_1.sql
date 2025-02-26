-- https://github.com/annykh/genTech/blob/main/staff.txt

-- 1. Создать новое поле experience_level и заполнить его значением:

	-- 	'Junior', если возраст меньше 25 лет.
	-- , если возраст от 25 до 35 лет.
	-- 	'Senior', если возраст больше 35 лет.

alter table staff
add column experience_level varchar(64);

set sql_safe_updates = 0;

update staff
set experience_level = case
							when age < 25 then 'Junior'
                            when age between 25 and 35 then 'Middle'-- when age >= 25 and age <= 35 -- when age <=35
                            else 'Senior' -- when age > 35
						end;

select * from staff;


-- 9. Вывести возраст всех сотрудников, увеличенный на 5 лет.
select firstname, lastname, age, age+5 as new_age
from staff;


-- 14. Найти сотрудников, у которых фамилии начинаются с 'A' или 'L'.
select firstname, lastname
from staff
where lastname like 'A%' or lastname like 'L%';

-- 15. Создать новое поле username_default и заполнить его значением:

	-- 	username, если имя пользователя указано.
	-- 	'unknown', если имя пользователя не указано.
    
alter table staff
add column username_default varchar(128);
-- Вариант 1
update staff
set username_default = case
							when username is not null then username
                            else 'unknown'
						end;
                        
-- Вариант 2                    
update staff
set username_default = coalesce(username, 'unknown');

-- Вариант 3
update staff
set username_default = if(username is not null, username, 'unknown');           
