select movies.year, title, rating
from movies, (select year, max(rating) as max_rating, min(rating) as min_rating
                from movies
                where num_ratings > 0
                group by year) as min_max
where movies.year = min_max.year
  and (movies.rating = max_rating or movies.rating = min_rating)
  and movies.year between 2005 and 2011
order by year, movies.rating desc
