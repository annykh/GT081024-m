-- round
-- ceiling
-- floor
-- abs
-- pow
-- sqrt
-- rand - 0 (вкл) - 1(не вкл.), [0:1)

-- concat
-- concat_ws(' ', str1, str2, str3)
-- length
-- trim
-- ltrim
-- rtrim
-- left
-- right
-- substring(str, start, [length])
-- substring_index(str, delimiter, count)
-- replace(str, find, replace)
-- lower
-- upper

use gt081024;

create table emp_test(
	id int primary key auto_increment, 
    full_name varchar(255),
    email varchar(128),
    age int
);

insert into emp_test(full_name, email, age)
values ('boB broWn', 'bobby1@gmail.com', 23),
		('john smith  ', 'jsmith@yahoo.com', 43),
        (' DEN HAMPSON', 'denny5@gmail.com', 22),
        ('lola jamesoN', 'lolajamson@mail.ru', 40),
        ('mIkE lOgAn', 'logan_mike@hotmail.com', 20);
        
-- Задание 1:
-- Необходимо обновить данные в таблице emp_test, чтобы значения в столбце full_name соответствовали следующему формату:
  -- Формат: 'Имя Фамилия'
  -- Требования к оформлению:
  	-- Имя и фамилия должны начинаться с заглавной буквы.
  	-- Остальные буквы в имени и фамилии должны быть строчными.
  	-- Лишние пробелы в начале и конце строки должны быть удалены.
    
select * from emp_test;    

select full_name, concat(upper(left(trim(full_name), 1)), lower(substring((substring_index(trim(full_name), ' ', 1)), 2))) as name,
concat(upper(left(substring_index(trim(full_name), ' ', -1), 1)), lower(substring(substring_index(trim(full_name), ' ', -1), 2))) as surname,
concat(upper(left(trim(full_name), 1)), -- первая буква имени
		lower(substring((substring_index(trim(full_name), ' ', 1)), 2)), -- остальные буквы
		' ', 
		upper(left(substring_index(trim(full_name), ' ', -1), 1)), -- первая буква фамилии
		lower(substring(substring_index(trim(full_name), ' ', -1), 2))) as new_full_name -- остальные
from emp_test;


set sql_safe_updates = 0;

update emp_test
set full_name = concat(upper(left(trim(full_name), 1)), 
						lower(substring((substring_index(trim(full_name), ' ', 1)), 2)), 
						' ', 
						upper(left(substring_index(trim(full_name), ' ', -1), 1)), 
						lower(substring(substring_index(trim(full_name), ' ', -1), 2)));
select * from emp_test;

-- Задание 2: Необходимо извлечь и вывести доменное имя (часть адреса электронной почты после символа '@', но до '.') из столбца email в таблице emp_test.
select email, substring_index(substring_index(email, '@', -1), '.', 1) as domen_name
from emp_test;

-- Задание 3: Необходимо извлечь инициалы сотрудников из столбца full_name и вывести их в формате 'И.И.' (первые буквы имени и фамилии с точками). 
select full_name, concat(left(full_name, 1), '.', left(substring_index(full_name, ' ', -1), 1), '.') as initials
from emp_test;