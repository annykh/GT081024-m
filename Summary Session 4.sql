use gt081024;

-- order by column_name 
-- order by column_name desc 

-- limit N
-- limit M, N

-- set sql_safe_updates = 0;

-- update table_name
-- set 
-- where 

-- delete from table_name
-- truncate table table_name  



-- Создать таблицу students с полями:

-- name (не null)
-- lastname (не null)
-- avg_mark int (от 0 до 5)
-- gender varchar(128) (или “M” или “F”)
drop table students;

create table students(
	name varchar(128) not null,
    lastname varchar(128) not null,
    avg_mark int check(avg_mark between 0 and 5),
    gender varchar(128) check(gender in ('M', 'F'))
);

-- Добавить поле id integer primary key auto_increment, вставить в начало.
alter table students
add column id int primary key auto_increment first;

-- Поменять тип у gender на char(1)
alter table students
modify column gender char(1);

-- Поменять тип у avg_mark на decimal(7, 4)
alter table students
modify column avg_mark decimal(7, 4);

-- Переименовать поле name на firstname
alter table students
rename column name to firstname;
-- change column name firstname varchar(128)

-- Добавить 5 записей студентов:
-- Олег Петров 4.3 M
-- Семен Степанов 3.1 M
-- Ольга Семенова 4.7 F
-- Игорь Романов 3.1 M
-- Ирина Иванова 2.2 F

insert into students(firstname, lastname, avg_mark, gender)
values ('Олег', 'Петров', 4.3, 'M'), 
		('Семен', 'Степанов', 3.1, 'M'),
        ('Ольга', 'Семенова', 4.7, 'F'),
        ('Игорь', 'Романов', 3.1, 'M'),
        ('Ирина', 'Иванова', 2.2, 'F');
        
select * from students;

-- Выборки
-- найти учеников, у которых оценка больше 4
select *
from students
where avg_mark > 4;

-- найти учеников, у которых оценка не входит в диапазон от 3 до 4
select *
from students
where avg_mark not between 3 and 4;

-- найти учеников, у которых имя начинается на И
select *
from students
where firstname like 'И%';

-- найти учеников, у которых оценка 2.2 или 3.1 или 4.7
select *
from students
where avg_mark in (2.2, 3.1, 4.7);
-- where avg_mark = 2.2 or avg_mark = 3.1 or avg_mark = 4.7;

-- найти первых трех учеников, у которых оценка меньше 4.5
select *
from students
where avg_mark < 4.5
limit 3;

-- вывести всех учеников, отсортировав по возрастанию средних оценок
select *
from students
order by avg_mark;

-- вывести имя ученика с самой низкой средней оценкой
select firstname
from students
order by avg_mark
limit 1;

-- Увеличить всем учащимся оценку в 10 раз
alter table students
drop check students_chk_1;

set sql_safe_updates = 0;

update students
set avg_mark = avg_mark * 10;

-- Поменяйте у Олега Петрова фамилию на Сидоров
update students
set lastname = 'Сидоров'
where firstname = 'Олег' and lastname = 'Петров';

-- Удалить всех учеников, у которых оценка не больше 31
delete from students
where avg_mark <= 31;

select * from students;
