select id, who, msg, TO_CHAR(dh, 'DD/MM/YYYY HH24:MI:SS') DH from tb_log;
truncate table tb_log;

SELECT  SADDR, SID, USERNAME, TO_CHAR(LOGON_TIME, 'DD/MM/YYYY HH24:MI:SS') LOGON_TIME, 
        STATUS, OSUSER, MACHINE, PROGRAM, SERIAL#, LOCKWAIT
FROM V$SESSION
WHERE USERNAME is not null
ORDER BY username, program;

select sid, piece, sql_text, lockwait, username, program, osuser
from v$session ses , v$sqltext txt
where   ses.sql_address = txt.address
        and ses.sql_hash_value = txt.hash_value
        and sid in (    SELECT SID
                        FROM V$SESSION
                        WHERE USERNAME in ('DBONE', 'DBTWO') and status = 'ACTIVE'
        )
order by username;