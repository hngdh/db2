-- select Н_ЛЮДИ.ИД, Н_УЧЕНИКИ.ЧЛВК_ИД from
-- Н_ЛЮДИ right join Н_УЧЕНИКИ on Н_ЛЮДИ.ИД = Н_УЧЕНИКИ.ЧЛВК_ИД
-- where Н_УЧЕНИКИ.ЧЛВК_ИД is null;

with stud_list as
(select Н_УЧЕНИКИ.ЧЛВК_ИД as id, (Н_ОТДЕЛЫ.КОРОТКОЕ_ИМЯ != 'КТиУ') as faculty_check
from ((Н_УЧЕНИКИ inner join Н_ПЛАНЫ on Н_УЧЕНИКИ.ПЛАН_ИД = Н_ПЛАНЫ.ИД)
inner join Н_ОТДЕЛЫ on Н_ПЛАНЫ.ОТД_ИД = Н_ОТДЕЛЫ.ИД)
group by 1,2),
check_list as
(select id as stud_id from stud_list where faculty_check = 't')
select id, count(id) as o from
(stud_list inner join check_list on stud_list.id = check_list.stud_id)
group by 1
having count(id) = 1
order by 1;