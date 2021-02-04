package com.ujiuye.crmpro.system.pojo;

import java.io.Serializable;

public class EmployeeRole implements Serializable {
    private Integer id;

    private Integer roleFk;

    private Integer employeeFk;
    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleFk() {
        return roleFk;
    }

    public void setRoleFk(Integer roleFk) {
        this.roleFk = roleFk;
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
        sb.append(", roleFk=").append(roleFk);
        sb.append(", employeeFk=").append(employeeFk);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}