select count(*)
from (select distinct name from actors) as dn
where name in(select name from high_ratings)
and name not in(select name from low_ratings)