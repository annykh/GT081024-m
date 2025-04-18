Использовать таблицу employees.
https://github.com/annykh/GT081024-m/blob/main/employees.sql
  
1. Повысить зарплаты для отдела Sales на 20%, для Finance 15%, для Shipping 10%, для Marketing 25%, для Human Resources 20% и для IT 35%. Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 
2. Создать поле new_salary типа numeric(7, 2)
3. Заполнить поле: повысить зарплаты для отдела Sales на 20%, для Finance 15%, для Shipping 10%, для Marketing 25%, для Human Resources 20% и для IT 35%.
4. Вывести из таблицы employees first_name как user_name, last_name как surname и новое поле full_name, которое состоит из имен и фамилий сотрудников.
5. Вывести новое поле commission, которое будет null, если зарплата сотрудника меньше 3000, будет 10, если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.
6. Создать новое поле commission и соответственно заполнить.
7. Создать поле final_salary и заполнить формулой salary + salary * commission / 100. Проверить commission на null, так чтобы в случае неопределенности final_salary принимал значение salary. 
8. Вывести поле email в нижнем регистре.
9. Создать новое поле chk_email типа varchar(128).
10. Заполнить поле chk_email. Если длина email меньше 3, значением chk_email будет 'Введите больше символов', если длина email больше/равно 3 и меньше 7,  значением chk_email будет 'Кол/во символов совпадает', если длина email больше/равно 7,  значением chk_email будет 'Введите меньше символов'.
