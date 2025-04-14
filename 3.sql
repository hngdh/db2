-- psql -h pg -d ucheb

select count(ИД) as result
from (select Н_ЛЮДИ.ИД,
(cast(cast(CURRENT_DATE - cast(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ as date) as int)/365 as int)) as age,
Н_ФОРМЫ_ОБУЧЕНИЯ.ИМЯ_В_ИМИН_ПАДЕЖЕ as form
from ((Н_ЛЮДИ inner join Н_ОБУЧЕНИЯ on Н_ЛЮДИ.ИД = Н_ОБУЧЕНИЯ.ЧЛВК_ИД)
inner join Н_ФОРМЫ_ОБУЧЕНИЯ on Н_ОБУЧЕНИЯ.ВИД_ОБУЧ_ИД = Н_ФОРМЫ_ОБУЧЕНИЯ.ИД))
where form = 'вечерняя' and age > 25
order by 1;