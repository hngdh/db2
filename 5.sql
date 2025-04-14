-- select (cast(cast(CURRENT_DATE - cast(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ as date) as int)/365 as int))
-- from (Н_УЧЕНИКИ inner join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД) where Н_УЧЕНИКИ.ГРУППА = '1101';

select * from (with stud_list as
(select cast(Н_УЧЕНИКИ.ГРУППА as int) as group_num,
cast(cast(CURRENT_DATE - cast(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ as date) as int)/365 as int) as age
from (Н_УЧЕНИКИ inner join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД))
select group_num, cast(avg(age) as int) as avg_age, (select min(age) from stud_list where group_num = '1101') as min_age from stud_list
group by 1 order by 1)
where avg_age > min_age;