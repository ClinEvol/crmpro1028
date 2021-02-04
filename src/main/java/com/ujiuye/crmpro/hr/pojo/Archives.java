package com.ujiuye.crmpro.hr.pojo;

import java.io.Serializable;
import java.util.Date;

public class Archives implements Serializable {
    private String no;

    private String telephone;

    private String school;

    private String major;

    private String contact;

    private Date graduate;

    private String politics;

    private String nation;

    private String education;

    private String email;

    private Integer employeeFk;

    private String remark;

    private String path;

    private String code;

    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    private static final long serialVersionUID = 1L;

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public Date getGraduate() {
        return graduate;
    }

    public void setGraduate(Date graduate) {
        this.graduate = graduate;
    }

    public String getPolitics() {
        return politics;
    }

    public void setPolitics(String politics) {
        this.politics = politics == null ? null : politics.trim();
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation == null ? null : nation.trim();
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getEmployeeFk() {
        return employeeFk;
    }

    public void setEmployeeFk(Integer employeeFk) {
        this.employeeFk = employeeFk;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", no=").append(no);
        sb.append(", telephone=").append(telephone);
        sb.append(", school=").append(school);
        sb.append(", major=").append(major);
        sb.append(", contact=").append(contact);
        sb.append(", graduate=").append(graduate);
        sb.append(", politics=").append(politics);
        sb.append(", nation=").append(nation);
        sb.append(", education=").append(education);
        sb.append(", email=").append(email);
        sb.append(", employeeFk=").append(employeeFk);
        sb.append(", remark=").append(remark);
        sb.append(", path=").append(path);
        sb.append(", code=").append(code);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}