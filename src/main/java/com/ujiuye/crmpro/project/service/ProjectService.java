package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.project.pojo.Project;

import java.util.List;

public interface ProjectService {
    //统计该客户的id的数据的数量
    int countByCustomerFk(int customer_fk);
    List<Project> list(int type,String keyword,int pageNum);
    List<Project> list();
    List<Project> listByName(String name);
    int save(Project project);

    Project getById(int id);
    int update(Project project);
}
