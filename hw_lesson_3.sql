1. В базе данных homeworks создайте таблицу workers со следующими полями:
worker_id – целое число, первичный ключ, автоинкремент
fname – строка (не NULL)
last_name – строка (не NULL)
email – строка (не NULL)
phone – строка (не NULL)

2. Ой, забыли про зарплату!
Добавьте поле salary с типом NUMERIC(9,2).

3. Ой-ой, нет, зарплата должна быть целым числом!
Измените тип salary на INTEGER.

4. Как-то странно… fname?
Переименуйте поле fname в first_name.

5. Телефон нам не нужен!
Удалите поле phone. 

6. А где отдел?
Добавьте поле department (строка, NOT NULL), и пусть оно будет сразу после last_name.

7. Заполняем таблицу
Добавьте 7 сотрудников с произвольными данными (имя, фамилия, email, отдел и зарплата).
