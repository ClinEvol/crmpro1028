package com.ujiuye.crmpro.hr.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import com.ujiuye.crmpro.system.pojo.EmployeeRole;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Employee implements Serializable {
    private Integer id;

    private String name;

    private String sex;

    private Integer age;

    private String telephone;

    private Date hiredate;

    private String num;

    private String username;

    private String password;

    private String remark;

    private Integer positionFk;

    private Integer deptFk;

    private Integer levelFk;

    private Position position;
    private Dept dept;

    @JSONField(serialize = false)
    private Archives archives;

    public Archives getArchives() {
        return archives;
    }

    public void setArchives(Archives archives) {
        this.archives = archives;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    private List<EmployeeRole> employeeRoleList;

    public List<EmployeeRole> getEmployeeRoleList() {
        return employeeRoleList;
    }

    public void setEmployeeRoleList(List<EmployeeRole> employeeRoleList) {
        this.employeeRoleList = employeeRoleList;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num == null ? null : num.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getPositionFk() {
        return positionFk;
    }

    public void setPositionFk(Integer positionFk) {
        this.positionFk = positionFk;
    }

    public Integer getDeptFk() {
        return deptFk;
    }

    public void setDeptFk(Integer deptFk) {
        this.deptFk = deptFk;
    }

    public Integer getLevelFk() {
        return levelFk;
    }

    public void setLevelFk(Integer levelFk) {
        this.levelFk = levelFk;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", sex=").append(sex);
        sb.append(", age=").append(age);
        sb.append(", telephone=").append(telephone);
        sb.append(", hiredate=").append(hiredate);
        sb.append(", num=").append(num);
        sb.append(", username=").append(username);
        sb.append(", password=").append(password);
        sb.append(", remark=").append(remark);
        sb.append(", positionFk=").append(positionFk);
        sb.append(", deptFk=").append(deptFk);
        sb.append(", levelFk=").append(levelFk);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}