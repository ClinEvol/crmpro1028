package com.ujiuye.crmpro.customer.pojo;

import java.io.Serializable;
import java.util.Date;

public class Customer implements Serializable {
    private Integer id;

    private String name;

    private String companyperson;

    private String address;

    private String phone;

    private String camera;

    private String present;

    private String remark;

    private Date addtime;

    private static final long serialVersionUID = 1L;

    public Customer() {
    }

    public Customer(String name, String companyperson, String address, String phone, String camera, String present, String remark) {
        this.name = name;
        this.companyperson = companyperson;
        this.address = address;
        this.phone = phone;
        this.camera = camera;
        this.present = present;
        this.remark = remark;
    }

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

    public String getCompanyperson() {
        return companyperson;
    }

    public void setCompanyperson(String companyperson) {
        this.companyperson = companyperson == null ? null : companyperson.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getCamera() {
        return camera;
    }

    public void setCamera(String camera) {
        this.camera = camera == null ? null : camera.trim();
    }

    public String getPresent() {
        return present;
    }

    public void setPresent(String present) {
        this.present = present == null ? null : present.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", companyperson=").append(companyperson);
        sb.append(", address=").append(address);
        sb.append(", phone=").append(phone);
        sb.append(", camera=").append(camera);
        sb.append(", present=").append(present);
        sb.append(", remark=").append(remark);
        sb.append(", addtime=").append(addtime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}