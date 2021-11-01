CREATE FUNCTION sim(X int, Y int)
RETURNS integer
LANGUAGE plpgsql
AS
$$
DECLARE 
	X AS integer;
    Y As integer;
    nActors integer;
    dActors integer;
    nTags integer;
    dTags integer;
    nGeneres integer;
    dGeneres integer;
    aX integer
    aY integer;
    rX integer;
    rY integer;

BEGIN
    SELECT COUNT(*) 
    INTO nActors 
    FROM actors one, actors two 
    WHERE one.mid=X AND two.mid=Y AND one.name=two.name;

    SELECT COUNT(*) 
    INTO dActors 
    FROM actors one 
    WHERE one.mid=X OR one.mid=Y;

    SELECT COUNT(*) 
    INTO nTags 
    FROM tags one, tags two 
    WHERE one.mid=X AND two.mid=Y AND one.tid=two.tid;

    SELECT COUNT(*) 
    INTO dTags 
    FROM tags one
    WHERE one.mid=X OR one.mid=Y;

    SELECT COUNT(*) 
    INTO nGeneres 
    FROM generes one, generes two 
    WHERE one.mid=X AND two.mid=Y AND one.genere=two.genere;

    SELECT COUNT(*) 
    INTO dGeneres 
    FROM generes one
    WHERE one.mid=X OR one.mid=Y;

    SELECT ROUND(rating) 
    INTO rX FROM movies
    WHERE mid = X;

    SELECT ROUND(rating) 
    INTO rY FROM movies
    WHERE mid = Y;

    SELECT CONVERT(INTEGER, CONVERT(DATETIME,year)) 
    INTO aX FROM movies WHERE mid =X;

    SELECT CONVERT(INTEGER, CONVERT(DATETIME,year)) 
    INTO aY FROM movies WHERE mid =Y;

    return ((nActors/dActors)+(nTags/dTags)+(nGeneres/dGeneres)+SQRT((aX-aY)*(aX-aY))+SQRT((rX-rY)*(rX-rY)))/5;

end;
$$;

CREATE VIEW top10 AS 
SELECT X.title, X.rating, sim((SELECT mid FROM movies WHERE title="Mr. & Mrs. Smith"), X.mid)*100 AS sims
FROM movies X ORDER BY sims desc LIMIT 10;
