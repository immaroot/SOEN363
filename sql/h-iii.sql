select  name, count(mid) as played_movies from actors
where actors.name in(select name from high_ratings)
  and actors.name not in(select name from low_ratings)
group by name
order by played_movies desc
limit 10