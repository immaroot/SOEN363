select distinct genre
from (select genre, count(*) as count
from genres as g
inner join movies m on g.mid = m.mid
group by genre) as gc
where gc.count >= 1000
order by genre
