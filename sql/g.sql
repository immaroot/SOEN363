select m.year, m.title, m.rating
from movies as m, (select year, max(rating) as max_rating, min(rating) as min_rating
                   from movies
                   where num_ratings != 0
                   group by year) as min_max
where m.year >= 2005
  and m.year <= 2011
  and m.year = min_max.year
  and (m.rating = max_rating or m.rating = min_rating)
  and m.num_ratings != 0
order by m.year