-- select (cast(cast(CURRENT_DATE - cast(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ as date) as int)/365 as int))
-- from (Н_УЧЕНИКИ inner join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД) where Н_УЧЕНИКИ.ГРУППА = '1101';

select Н_УЧЕНИКИ.ГРУППА,
cast(avg(extract(year from age(CURRENT_DATE, Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))) as int),
from Н_УЧЕНИКИ inner join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
group by 1
having avg(extract(year from age(CURRENT_DATE, Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))) >
(select min(extract(year from age(CURRENT_DATE, Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)))
from Н_УЧЕНИКИ inner join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
where Н_УЧЕНИКИ.ГРУППА = '1101');