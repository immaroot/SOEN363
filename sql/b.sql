select name
from actors
inner join movies m on actors.mid = m.mid
where m.title like 'The Dark Knight'
order by name
