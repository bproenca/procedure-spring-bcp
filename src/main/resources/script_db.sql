create table tb_log (
    id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    who VARCHAR2(100),
    msg VARCHAR2(100),
    dh date
    );
    
CREATE OR REPLACE Procedure proc_loop_sleep ( p_who VARCHAR2, p_msg VARCHAR2, p_loops INT, p_sleep INT ) IS
BEGIN
    FOR v_cnt IN 1..p_loops LOOP   
        insert into tb_log (who, msg, dh) values (p_who, p_msg, sysdate);
        dbms_session.sleep(p_sleep);
    END LOOP;  
END;
/

CREATE OR REPLACE Procedure proc_aa ( p_who VARCHAR2, p_msg VARCHAR2, p_loops INT, p_sleep INT ) IS
BEGIN
    PROC_LOOP_SLEEP ( p_who , p_msg , p_loops , p_sleep  );
END;
/

CREATE OR REPLACE Procedure proc_bb ( p_who VARCHAR2, p_msg VARCHAR2, p_loops INT, p_sleep INT ) IS
BEGIN
    PROC_LOOP_SLEEP ( p_who , p_msg , p_loops , p_sleep  );
END;
/

CREATE OR REPLACE Procedure proc_cc ( p_who VARCHAR2, p_msg VARCHAR2, p_loops INT, p_sleep INT ) IS
BEGIN
    PROC_LOOP_SLEEP ( p_who , p_msg , p_loops , p_sleep  );
END;
/

CREATE OR REPLACE Procedure proc_dd ( p_who VARCHAR2, p_msg VARCHAR2, p_loops INT, p_sleep INT ) IS
BEGIN
    PROC_LOOP_SLEEP ( p_who , p_msg , p_loops , p_sleep  );
END;
/