package com.github.bproenca.procedurespringbcp.core;

public class MyDTO {
    
    private String procedure;
    private String tenant;
    private String msg;
    private Integer loops;
    private Integer sleep;
    
    @Override
    public String toString() {
        return "MyDTO [procedure=" + procedure + ", tenant=" + tenant + ", msg=" + msg + ", loops="
                + loops + ", sleep=" + sleep + "]";
    }

    public MyDTO() {
    }

    public String getProcedure() {
        return procedure;
    }

    public void setProcedure(String procedure) {
        this.procedure = procedure;
    }

    public String getTenant() {
        return tenant;
    }

    public void setTenant(String tenant) {
        this.tenant = tenant;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getLoops() {
        return loops;
    }

    public void setLoops(Integer loops) {
        this.loops = loops;
    }

    public Integer getSleep() {
        return sleep;
    }

    public void setSleep(Integer sleep) {
        this.sleep = sleep;
    }
    
    
}
