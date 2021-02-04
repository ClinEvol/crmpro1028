package com.ujiuye.crmpro.hr.controller;

import com.alibaba.fastjson.JSON;
import com.ujiuye.crmpro.hr.pojo.Dept;
import com.ujiuye.crmpro.hr.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/hr/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("listJSON")
    @ResponseBody
    public String listJSON(){
        List<Dept> list = deptService.list();
        return JSON.toJSONString(list);
    }
}
