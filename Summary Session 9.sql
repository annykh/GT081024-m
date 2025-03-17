-- Создать базу данных university
-- 1) Создать таблицу Students
-- с полями:
-- - id целое число первичный ключ автоинкремент
-- - name строка 128 не null
-- - age целое число

-- 2) Создать таблицу Teachers
-- с полями:
-- id целое число первичный ключ автоинкремент
-- name строка 128 не null
-- age целое число

-- 3) Создать таблицу Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- title строка 128 не null

-- 4) Создать таблицу Teachers2Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- competencies_id целое число

-- 5) Создать таблицу Courses
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- title строка 128 не null
-- headman_id целое число

-- 6)Создать таблицу Students2Courses
-- id целое число первичный ключ автоинкремент
-- student_id целое число
-- course_id целое число

-- Добавить 6 записей в таблицу Students
-- Анатолий 29
-- Олег 25
-- Семен 27
-- Олеся 28
-- Ольга 31
-- Иван 22

-- Добавить 6 записей в таблицу Teachers
-- Петр 39
-- Максим 35
-- Антон 37
-- Всеволод 38
-- Егор 41
-- Светлана 32

-- Добавить 4 записей в таблицу Competencies
-- Математика 
-- Информатика
-- Программирование
-- Графика

-- Добавьте 6 записей в таблицу Teachers2Competencies
-- 1 1
-- 2 1
-- 2 3
-- 3 2
-- 4 1
-- 5 3

-- Добавьте 5 записей в таблицу Courses
-- 1 Алгебра логики 2
-- 2 Математическая статистика 3
-- 4 Высшая математика 5
-- 5 Javascript 1
-- 5 Базовый Python 1

-- Добавьте 5 записей в таблицу Students2Courses
-- 1 1
-- 2 1
-- 3 2
-- 3 3
-- 4 5

-- https://github.com/annykh/GT081024-m/blob/main/university.sql
-- https://github.com/annykh/GT081024-m/blob/main/%D0%A2%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5_university.txt


create database university;
use university;

create table Students(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Teachers(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Competencies(
	id int primary key auto_increment,
	title varchar(128) not null
);

create table Teachers2Competencies(
	id int primary key auto_increment,
	teacher_id int,
    competencies_id int
);

create table Courses(
	id int primary key auto_increment,
    teacher_id int,
	title varchar(128) not null,
    headman_id int
);

create table Students2Courses(
	id int primary key auto_increment,
	student_id int,
    course_id int
);

insert into students (name, age) values ('Анатолий', 29);
insert into students (name, age) values ('Олег', 25);
insert into students (name, age) values ('Семен', 27);
insert into students (name, age) values ('Олеся', 28);
insert into students (name, age) values ('Ольга', 31);
insert into students (name, age) values ('Иван', 22);

insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title, headman_id) values (1, 'Алгебра логики', 2);
insert into courses (teacher_id, title, headman_id) values (2, 'Математическая статистика', 3);
insert into courses (teacher_id, title, headman_id) values (4, 'Высшая математика', 5);
insert into courses (teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses (teacher_id, title, headman_id) values (5, 'Базовый Python', 1);

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);

-- Задания:

select * from students; 
select * from students2courses;

-- 1. Вывести имена студентов (name) и идентификаторы курсов (course_id), которые они посещают.
select t1.name, t2.course_id
from students as t1
join students2courses as t2
on t1.id = t2.student_id;

-- 2. Вывести имена студентов и идентификаторы курсов:
--     Если студент проходит курс, указать соответствующий course_id.
--     Если студент не проходит ни одного курса, вывести NULL в качестве значения course_id.
select t1.name, t2.course_id
from students as t1
left join students2courses as t2
on t1.id = t2.student_id;

-- 3. Вывести имена студентов, которые не записаны ни на один курс.
select t1.name
from students as t1
left join students2courses as t2
on t1.id = t2.student_id
where t2.course_id is null;

-- 4. Найти курсы, которые не посещает ни один студент.
select t1.title
from courses as t1
left join students2courses as t2
on t1.id = t2.course_id
where t2.id is null;

-- 5. Найти компетенции, которые не принадлежат ни одному преподавателю.
select t1.title
from competencies as t1
left join teachers2competencies as t2
on t1.id = t2.competencies_id
where t2.id is null;

-- 6. Вывести название курса и имя преподавателя, который является заведующим кафедрой для данного курса.
-- 7. Вывести имя студента и имена преподавателей, которые являются заведующими кафедрой для курсов, на которые записан студент.

