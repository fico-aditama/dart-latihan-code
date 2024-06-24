DO $$ 
DECLARE 
    db_row record;
BEGIN
    -- Revoke CONNECT from PUBLIC for all non-template databases
    FOR db_row IN 
        SELECT datname 
        FROM pg_database 
        WHERE datistemplate = false AND datname != 'postgres'
    LOOP
        EXECUTE 'REVOKE CONNECT ON DATABASE "' || db_row.datname || '" FROM PUBLIC;';

        -- Terminate active sessions
        EXECUTE 'SELECT pg_terminate_backend (pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = ' || quote_literal(db_row.datname) || ';';
        
        -- Drop the database
--         EXECUTE 'DROP DATABASE "' || db_row.datname || '";';
        RAISE NOTICE 'DROP DATABASE "%";', db_row.datname;

    END LOOP;
END $$;





select 'drop database "'||datname||'";'
from pg_database
where datistemplate=false;
