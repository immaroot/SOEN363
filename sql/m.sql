CREATE FUNCTION hasDup(tar TEXT)
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
BEGIN
RETURN SELECT IF(COUNT(SELECT * FROM tar)<>COUNT(SELECT DISTINCT * FROM tar), 1, 0);
END;
$$;

select * from information_schema.tables t
WHERE hasDup(t.name)=1

do $$
DECLARE
    o regclass;
BEGIN
    FOR o IN
        select * 
        from information_schema.tables t
        WHERE hasDup(t.name)=1
    LOOP
        EXECUTE 
            'CREATE VIEW fromQuery AS SELECT DISTINCT * FROM '||o;
        END LOOP;
    END
    $$: