package com.github.bproenca.procedurespringbcp.core;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {

    @Autowired
    private TenantRepo tenantRepo;

    private Logger log = LoggerFactory.getLogger(MyController.class);

    @GetMapping("/data/tenant/{tenant}")
    public List<Map<String, Object>> data(@PathVariable String tenant) {
        log.info(">> [GET] /data/tenant/{} at {}", tenant, LocalDateTime.now());
        return tenantRepo.getData(tenant);
    }

    @GetMapping("/data/tenants/{tenant1}/{tenant2}")
    public List<Map<String, Object>> data(@PathVariable String tenant1, @PathVariable String tenant2) {
        log.info(">> [GET] /data/tenants/{}/{} at {}", tenant1, tenant2, LocalDateTime.now());
        List<Map<String, Object>> data = tenantRepo.getData(tenant1);
        data.addAll(tenantRepo.getData(tenant2));
        return data;
    }

    @PostMapping("/truncate/tenant/{tenant}")
    public void procedure(@PathVariable String tenant) {
        log.info(">> [POST] /truncate/tenant/{}", tenant);
        tenantRepo.truncate(tenant);
    }

    @PostMapping("/procedure")
    public void procedure(@RequestBody MyDTO body) {
        log.info(">> [POST] /procedure body: {}", body);
        tenantRepo.callProc(body);
    }

    @PostMapping("/package/tenant/{tenant}/msg/{msg}/sleep/{sleep}")
    public void xpackage(@PathVariable String tenant, @PathVariable String msg, @PathVariable Integer sleep) {
        log.info(">> [POST] /package/tenants/{}/msg/{}/sleep/{}", tenant, msg, sleep);
        tenantRepo.callPackage(tenant, msg, sleep);
    }

    @GetMapping("/ping")
    public String ping() {
        log.info(">> [GET] /ping at {}", LocalDateTime.now());
        return "pong";
    }
}