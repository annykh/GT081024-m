-- https://github.com/annykh/GT081024-m/blob/main/shop.sql
-- https://github.com/annykh/GT081024-m/blob/main/%D0%A2%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5_shop.txt

select * from customers;
select * from sellers;
select * from orders;

-- 1. Вывести имена продавцов и их начальников.
select sell.sname as seller_name, boss.sname as boss_name
from sellers as sell
join sellers as boss
on sell.BOSS_ID = boss.SELL_ID;

-- 2. Вывести продавцов, у которых тот же начальник, что и у "Екатерины".
-- Вывод boss_id(ид босса) Екатрерины.
select boss_id
from sellers
where sname = 'Екатерина';

select sname
from sellers
where BOSS_ID = (select boss_id
				from sellers
				where sname = 'Екатерина') and sname != 'Екатерина';

-- 3. Вывести пары продавцов, работающих в одном городе.
select sell1.sname as sell_name1, sell2.sname as sell_name2, sell1.CITY
from sellers as sell1
join sellers as sell2
on sell1.SELL_ID < sell2.SELL_ID
where sell1.CITY = sell2.CITY;

-- 4. Вывести продавцов, у которых есть хотя бы один подчиненный.
select distinct boss.sname
from sellers as sell
join sellers as boss
on sell.BOSS_ID = boss.SELL_ID;

-- 5. Вывести продавцов, у которых тот же начальник, что и у продавца из 'Сочи'.
select boss_id
from sellers
where city = 'Сочи';

select sname
from sellers
where boss_id = (select boss_id
					from sellers
					where city = 'Сочи') and city != 'Сочи';

-- 6. Вывести пары клиентов из одного города, у которых разный рейтинг.
-- 7. Вывести заказы, оформленные продавцами, у которых есть подчиненные.
-- 8. Вывести имена начальников и их подчиненных, если у начальника комиссия выше, чем у подчиненного.
-- 9. Вывести продавцов, у которых есть начальник, но сами не имеют подчиненных.
