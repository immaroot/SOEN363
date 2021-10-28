create or replace view high_ratings as
select distinct name
from actors
         join movies m on actors.mid = m.mid
where m.num_ratings != 0 and m.rating >= 4;

create or replace view low_ratings as
select distinct name
from actors
         join movies m on actors.mid = m.mid
where m.num_ratings != 0 and m.rating < 4;

select count(*) from high_ratings;
select count(*) from low_ratings
