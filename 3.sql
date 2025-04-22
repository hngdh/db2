-- psql -h pg -d ucheb

select count(Н_ЛЮДИ.ИД)
from ((Н_ЛЮДИ inner join Н_ОБУЧЕНИЯ on Н_ЛЮДИ.ИД = Н_ОБУЧЕНИЯ.ЧЛВК_ИД)
inner join Н_ФОРМЫ_ОБУЧЕНИЯ on Н_ОБУЧЕНИЯ.ВИД_ОБУЧ_ИД = Н_ФОРМЫ_ОБУЧЕНИЯ.ИД)
where Н_ФОРМЫ_ОБУЧЕНИЯ.ИМЯ_В_ИМИН_ПАДЕЖЕ = 'вечерняя'
and extract(year from age(CURRENT_DATE, Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)) > 25
order by 1;