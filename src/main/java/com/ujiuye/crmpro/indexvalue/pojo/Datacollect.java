package com.ujiuye.crmpro.indexvalue.pojo;

import java.io.Serializable;
import java.util.Date;

public class Datacollect implements Serializable {
    private Integer id;

    private String cname;

    private Double turnover;

    private Date time;

    private String business;

    private String superiority;

    private String inforiority;

    private Integer sort;

    private Integer employeecount;

    private Date buildtime;

    private String remark;

    private String other;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Double getTurnover() {
        return turnover;
    }

    public void setTurnover(Double turnover) {
        this.turnover = turnover;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business == null ? null : business.trim();
    }

    public String getSuperiority() {
        return superiority;
    }

    public void setSuperiority(String superiority) {
        this.superiority = superiority == null ? null : superiority.trim();
    }

    public String getInforiority() {
        return inforiority;
    }

    public void setInforiority(String inforiority) {
        this.inforiority = inforiority == null ? null : inforiority.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getEmployeecount() {
        return employeecount;
    }

    public void setEmployeecount(Integer employeecount) {
        this.employeecount = employeecount;
    }

    public Date getBuildtime() {
        return buildtime;
    }

    public void setBuildtime(Date buildtime) {
        this.buildtime = buildtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other == null ? null : other.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", cname=").append(cname);
        sb.append(", turnover=").append(turnover);
        sb.append(", time=").append(time);
        sb.append(", business=").append(business);
        sb.append(", superiority=").append(superiority);
        sb.append(", inforiority=").append(inforiority);
        sb.append(", sort=").append(sort);
        sb.append(", employeecount=").append(employeecount);
        sb.append(", buildtime=").append(buildtime);
        sb.append(", remark=").append(remark);
        sb.append(", other=").append(other);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}