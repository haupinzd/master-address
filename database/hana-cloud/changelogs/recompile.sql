DECLARE

   CURSOR c_objects(p_type IN VARCHAR2) IS
	  SELECT object_name,
             object_type
      FROM   all_objects
      WHERE  object_type = 'PACKAGE'
		AND status = 'INVALID'
		AND owner in ('STAGE','TRANSFORM','WAREHOUSE')
;

BEGIN

   FOR crow IN c_objects('VIEW')
   LOOP
      EXECUTE IMMEDIATE 'ALTER ' || crow.object_type || ' ' || crow.object_name || ' COMPILE';
   END LOOP;

   FOR crow IN c_objects('PACKAGE')
   LOOP
      EXECUTE IMMEDIATE 'ALTER ' || crow.object_type || ' ' || crow.object_name || ' COMPILE';
   END LOOP;

   FOR crow IN c_objects('PACKAGE BODY')
   LOOP
      EXECUTE IMMEDIATE 'ALTER PACKAGE ' || crow.object_name || ' COMPILE BODY';
   END LOOP;

END;
