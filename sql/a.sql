select title
from movies
inner join actors a on movies.mid = a.mid
where a.name like 'Daniel Craig'
order by title
