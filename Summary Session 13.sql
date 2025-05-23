1. Создать и активировать базу данных tasks.  
2. Создать таблицу store с полями:  
   • id — целое число, первичный ключ, автоинкремент.  
   • title — строка (128 символов), не NULL.  
   • price — целое число.  
   • quantity — целое число.  
3. Добавить в таблицу store записи:  
   • title — 'Skirt', price — 120, quantity — 10.  
   • title — 'Shirt', price — 55, quantity — 4.  
   • title — 'Jeanse', price — 135, quantity — 15.  
4. Из таблицы store вывести те товары, цена которых больше 100.  
5. Из таблицы store вывести те товары, название которых начинается на букву 'S'.  
6. Увеличить количество товара с названием 'Jeanse' на 5.  
7. Добавить новое поле quality — целое число.  
8. Заполнить поле quality:  
   • Если цена товара больше 100, установить значение 5.  
   • Если цена товара меньше или равна 100, установить значение 4.  
9. Удалить из таблицы store товары, где количество меньше 10.  
10. Удалить таблицу store.  
11. Удалить базу данных tasks.  
12. Создать базу данных shop и заполнить её, используя скрипт:  
    https://github.com/annykh/GT081024-m/blob/main/shop.sql  
    Техническое описание этой базы данных доступно по ссылке:  
    https://github.com/annykh/GT081024-m/blob/main/%D0%A2%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5_shop.txt  
13. Вывести всех продавцов, чьи имена начинаются на букву 'Л'.  
14. Вывести всех клиентов из города Тула с рейтингом больше 100.  
15. Вывести всех продавцов, чьи комиссии между 0.10 и 0.15 (включительно).  
16. Вывести пары покупателей и обслуживших их продавцов из одного города.  
17. Вывести имена продавцов, у которых нет заказов.  
18. Вывести имена всех продавцов, которые продают товары клиентам из Тулы.  
19. Найти среднюю сумму заказа для каждого клиента.  
20. Найти общее количество клиентов в каждом городе.  
21. Вывести города, в которых средняя сумма заказа превышает 2000.  
22. Вывести продавцов, у которых количество заказов больше 2.  
23. Определить количество заказов, сделанных клиентами из Тулы.
