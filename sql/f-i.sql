select mid, title, year, num_ratings, rating
from movies
where num_ratings = (select max(num_ratings) from movies)