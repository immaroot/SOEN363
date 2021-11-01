create or replace view high_ratings as
select distinct actors.name
from actors
join movies m on actors.mid = m.mid
where rating >= 4 and num_ratings > 0;

create or replace view low_ratings as
select distinct actors.name
from actors
join movies m on actors.mid = m.mid
where rating < 4 and num_ratings > 0;

select count(*) from low_ratings;
select count(*) from high_ratings;

