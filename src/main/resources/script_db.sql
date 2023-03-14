create table tb_log (
    id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    who VARCHAR2(100),
    msg VARCHAR2(100),
    dh date
);
/    

CREATE OR REPLACE EDITIONABLE PROCEDURE "PROC_LOOP_SLEEP" ( p_who VARCHAR2, p_msg VARCHAR2, p_loops INT, p_sleep INT ) 
IS
    v_session NUMBER;
BEGIN
    select Sys_Context('USERENV', 'SID') into v_session from dual;
    FOR v_cnt IN 1..p_loops LOOP   
        insert into tb_log (who, msg, dh) values (p_who || ' - DB Session:' || v_session, p_msg, sysdate);
        commit;
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


-----------------------------

CREATE OR REPLACE PACKAGE TEST_PKG IS
  t_pkg_msg  VARCHAR2(100);
  t_pkg_date  DATE;
  PROCEDURE do_something (p_who VARCHAR2, p_msg VARCHAR2, p_sleep INT);
END TEST_PKG;
/

CREATE OR REPLACE PACKAGE BODY TEST_PKG IS
    PROCEDURE do_something (p_who VARCHAR2, p_msg VARCHAR2, p_sleep INT)
    IS
        v_session NUMBER;
    BEGIN
        select Sys_Context('USERENV', 'SID') into v_session from dual;
        dbms_session.sleep(p_sleep);
        insert into tb_log (who, msg, dh) values (p_who || ' - DB Session:' || v_session, 'Before: ' || t_pkg_msg, sysdate);
        commit;
        t_pkg_msg := p_msg;
        insert into tb_log (who, msg, dh) values (p_who || ' - DB Session:' || v_session, 'After: ' || t_pkg_msg, sysdate);        
        commit;
    END do_something;
BEGIN
  SELECT SYSDATE INTO t_pkg_date FROM DUAL;
END TEST_PKG;
/
