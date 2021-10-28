create or replace view co_actors as
    select distinct name
    from actors
    where mid in (select mid from actors where name like 'Annette Nicole')
      and name not like 'Annette Nicole';

select count(*) from co_actors;

create or replace view all_combinations as
    select *
    from co_actors, (select mid from actors where name like 'Annette Nicole') as am;

select count(*) from all_combinations;

create or replace view non_existent as
    select all_combinations.name, all_combinations.mid
    from all_combinations
    except (select name, mid from actors);

select count(*) from non_existent;

select * from co_actors except (select distinct name from non_existent);
