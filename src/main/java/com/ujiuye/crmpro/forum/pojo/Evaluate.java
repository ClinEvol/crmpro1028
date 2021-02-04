package com.ujiuye.crmpro.forum.pojo;

import com.ujiuye.crmpro.hr.pojo.Employee;

import java.io.Serializable;
import java.util.Date;

public class Evaluate implements Serializable {
    private Integer evaid;

    private Integer forumFk;

    private Integer empFk4;

    private Integer evaidFk;

    private String evacontent;

    private Date updatetime;

    private Date evatime;

    private Integer evastatus;

    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    private static final long serialVersionUID = 1L;

    public Integer getEvaid() {
        return evaid;
    }

    public void setEvaid(Integer evaid) {
        this.evaid = evaid;
    }

    public Integer getForumFk() {
        return forumFk;
    }

    public void setForumFk(Integer forumFk) {
        this.forumFk = forumFk;
    }

    public Integer getEmpFk4() {
        return empFk4;
    }

    public void setEmpFk4(Integer empFk4) {
        this.empFk4 = empFk4;
    }

    public Integer getEvaidFk() {
        return evaidFk;
    }

    public void setEvaidFk(Integer evaidFk) {
        this.evaidFk = evaidFk;
    }

    public String getEvacontent() {
        return evacontent;
    }

    public void setEvacontent(String evacontent) {
        this.evacontent = evacontent == null ? null : evacontent.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Date getEvatime() {
        return evatime;
    }

    public void setEvatime(Date evatime) {
        this.evatime = evatime;
    }

    public Integer getEvastatus() {
        return evastatus;
    }

    public void setEvastatus(Integer evastatus) {
        this.evastatus = evastatus;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", evaid=").append(evaid);
        sb.append(", forumFk=").append(forumFk);
        sb.append(", empFk4=").append(empFk4);
        sb.append(", evaidFk=").append(evaidFk);
        sb.append(", evacontent=").append(evacontent);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", evatime=").append(evatime);
        sb.append(", evastatus=").append(evastatus);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}