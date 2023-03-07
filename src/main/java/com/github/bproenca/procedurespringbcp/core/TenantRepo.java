package com.github.bproenca.procedurespringbcp.core;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Repository;

import com.github.bproenca.procedurespringbcp.tenant.MultitenantDataSource;

@Repository
public class TenantRepo {

    @Autowired
    @Qualifier("multitenantDataSource")
    private MultitenantDataSource multitenantDataSource;

    private Logger log = LoggerFactory.getLogger(TenantRepo.class);

    public List<Map<String, Object>> getData(String tenant) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(multitenantDataSource.getDataSource(tenant));
        return jdbcTemplate.queryForList("select * from tb_log");
	}

    public void truncate(String tenant) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(multitenantDataSource.getDataSource(tenant));
        jdbcTemplate.update("truncate table tb_log");
	}

    //Procedure proc_loop_sleep ( p_who VARCHAR2, p_msg VARCHAR2, p_loops INT, p_sleep INT ) 
    @Async
    public void callProc(MyDTO dto) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(multitenantDataSource.getDataSource(dto.getTenant()));

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(dto.getProcedure());
        jdbcCall.execute(
            "Thread: " + Thread.currentThread().getName(), //who
            dto.toString(), //msg
            dto.getLoops(),
            dto.getSleep());
        
        log.info("Finished executing procedure with parameters: {}", dto);
	}
    
}
