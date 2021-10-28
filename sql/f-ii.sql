select mid, title, year, num_ratings, rating
from movies
where rating = (select max(rating) from movies) order by mid