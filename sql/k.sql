SELECT DISTINCT name, COUNT (DISTINCT (SELECT a2.name FROM actors a2 WHERE a2.mid IN (SELECT a1.mid FROM actors a1 WHERE a1.name = "Tom Cruise") AND name<>"Tom Cruise")) FROM actors WHERE name ="Tom Cruise";

CREATE VIEW countCoActors AS SELECT DISTINCT a3.name AS name, COUNT (DISTINCT (SELECT a2.name FROM actors a2 WHERE a2.mid IN (SELECT a1.mid FROM actors a1 WHERE a1.name = a3.name) AND name<>a3.name)) AS coactors FROM actors a3;

SELECT name, coactors FROM countCoActors GROUP BY name HAVING coactors >= MAX(coactors);



