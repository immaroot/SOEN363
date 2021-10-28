select mid, title, year, num_ratings, rating
from movies
where num_ratings = (select max(num_ratings) from movies)
intersect
select mid, title, year, num_ratings, rating
from movies
where rating = (select min(rating) from movies) order by mid