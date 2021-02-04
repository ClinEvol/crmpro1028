package com.ujiuye.crmpro.hr.controller;

import com.alibaba.fastjson.JSON;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @RequestMapping("/hr/employee")
 * 如晨这里加了hr，只能人事访问，但是这个数据在项目（程序与项目经理），其它以地方可能还用，所以这里不能写hr
 */
@RequestMapping("/employee")
@Controller
public class PublicEmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/PMListJSON")
    @ResponseBody
    public String PMListJSON(){
        //查询全部的项目经理
        List<Employee> pms = employeeService.listPMByName("");
        return JSON.toJSONString(pms);
    }


    @RequestMapping("/listJSON")
    @ResponseBody
    public String listJSON(){
        //查询全部的项目经理
        List<Employee> list = employeeService.list();
        return JSON.toJSONString(list);
    }


    @RequestMapping("/ListByDeptJSON")
    @ResponseBody
    public String ListByDeptJSON(int dept_no){
        //查询全部的项目经理
        List<Employee> list = employeeService.listByDept(dept_no);
        return JSON.toJSONString(list);
    }

}
