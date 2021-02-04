package com.ujiuye.crmpro.hr.service;

import com.ujiuye.crmpro.hr.pojo.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> list();
    //所有开发部的员工
    List<Employee> listByDept(int dept_no);

    //按名称查找项目经理
    List<Employee> listPMByName(String name);

    List<Employee> listByName(String name);
    //登录
    Employee login(Employee employee);

    List<Employee> list(int type,String keyword);

    int update(Employee employee);

    int save(Employee employee,String roles);

    Employee getById(int id);

    int remove(List<Integer> ids);//比较复杂

    Employee getByUserName(String name);
}
