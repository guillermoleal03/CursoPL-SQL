set serveroutput on

CREATE OR REPLACE PROCEDURE read_file IS
    string VARCHAR2(32767);
    vfile  utl_file.file_type;
BEGIN 
-- Open FILE
    vfile := utl_file.fopen('EXERCISES', 'f1.txt', 'R');
    LOOP
        BEGIN
        --read line
            utl_file.get_line(vfile, string);
            INSERT INTO f1 VALUES ( string );

        EXCEPTION
            WHEN no_data_found THEN
                EXIT;
        END;
    END LOOP;
-- close file
    utl_file.fclose(vfile);
END;