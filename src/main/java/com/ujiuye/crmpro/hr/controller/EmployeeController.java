package com.ujiuye.crmpro.hr.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import com.ujiuye.crmpro.system.pojo.Role;
import com.ujiuye.crmpro.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/hr/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0")int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "")String keyword)
    {
        //设置分页
        PageHelper.startPage(pageNum,5);
        //查询
        List<Employee> list = employeeService.list(type,keyword);
        //创建分页对象
        PageInfo<Employee> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-employee";
    }

    @RequestMapping("/tosave")
    public String tosave(Model model){
        List<Role> roles = roleService.list();
        model.addAttribute("roles",roles);
        return "save-employee";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Employee employee,String roles){
        try {
            int result = employeeService.save(employee,roles);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
}
