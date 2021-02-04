package com.ujiuye.crmpro.indexvalue.pojo;

import java.io.Serializable;
import java.util.Date;

public class Indexvalue implements Serializable {
    private Integer id;

    private Double turnover;

    private String business;

    private Integer comnameFk;

    private String remark;

    private String file;

    private Integer empFk5;

    private Date starttime;

    private Date endtime;

    private Date updatetime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getTurnover() {
        return turnover;
    }

    public void setTurnover(Double turnover) {
        this.turnover = turnover;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business == null ? null : business.trim();
    }

    public Integer getComnameFk() {
        return comnameFk;
    }

    public void setComnameFk(Integer comnameFk) {
        this.comnameFk = comnameFk;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file == null ? null : file.trim();
    }

    public Integer getEmpFk5() {
        return empFk5;
    }

    public void setEmpFk5(Integer empFk5) {
        this.empFk5 = empFk5;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", turnover=").append(turnover);
        sb.append(", business=").append(business);
        sb.append(", comnameFk=").append(comnameFk);
        sb.append(", remark=").append(remark);
        sb.append(", file=").append(file);
        sb.append(", empFk5=").append(empFk5);
        sb.append(", starttime=").append(starttime);
        sb.append(", endtime=").append(endtime);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}