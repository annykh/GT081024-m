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
    
-- Задание 2: Необходимо извлечь и вывести доменное имя (часть адреса электронной почты после символа '@', но до '.') из столбца email в таблице emp_test.
-- Задание 3: Необходимо извлечь инициалы сотрудников из столбца full_name и вывести их в формате 'И.И.' (первые буквы имени и фамилии с точками).
