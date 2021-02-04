package com.ujiuye.crmpro.project.pojo;

import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.hr.pojo.Employee;

import java.io.Serializable;
import java.util.Date;

public class Project implements Serializable {
    private Integer id;

    private String name;

    private String companyname;

    private String companyperson;

    private Integer customerFk;

    private Integer employeeCount;

    private Date starttime;

    private Date buildtime;

    private Integer cost;

    private String level;

    private Date endtime;

    private String remark;

    private Integer employeeFk;

    private Customer customer;//一个项目对应一个客户
    private Employee employee;//一个项目对应一个项目经理

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public String getCompanyperson() {
        return companyperson;
    }

    public void setCompanyperson(String companyperson) {
        this.companyperson = companyperson == null ? null : companyperson.trim();
    }

    public Integer getCustomerFk() {
        return customerFk;
    }

    public void setCustomerFk(Integer customerFk) {
        this.customerFk = customerFk;
    }

    public Integer getEmployeeCount() {
        return employeeCount;
    }

    public void setEmployeeCount(Integer employeeCount) {
        this.employeeCount = employeeCount;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getBuildtime() {
        return buildtime;
    }

    public void setBuildtime(Date buildtime) {
        this.buildtime = buildtime;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getEmployeeFk() {
        return employeeFk;
    }

    public void setEmployeeFk(Integer employeeFk) {
        this.employeeFk = employeeFk;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", companyname=").append(companyname);
        sb.append(", companyperson=").append(companyperson);
        sb.append(", customerFk=").append(customerFk);
        sb.append(", employeeCount=").append(employeeCount);
        sb.append(", starttime=").append(starttime);
        sb.append(", buildtime=").append(buildtime);
        sb.append(", cost=").append(cost);
        sb.append(", level=").append(level);
        sb.append(", endtime=").append(endtime);
        sb.append(", remark=").append(remark);
        sb.append(", employeeFk=").append(employeeFk);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}