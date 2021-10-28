create or replace view actors_career as
select name, carreer_years
from (select name, max(m.year) - min(m.year) as carreer_years
      from actors
               join movies m on actors.mid = m.mid
      group by actors.name
      order by carreer_years desc) as am;

select name, carreer_years
from actors_career
where carreer_years = (select max(carreer_years) from actors_career)