package com.ujiuye.crmpro.project.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.project.pojo.Project;
import com.ujiuye.crmpro.project.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/programmer/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword)
    {
        //查询
        List<Project> list = projectService.list(type,keyword,pageNum);
        //创建分页对象
        PageInfo<Project> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-project";
    }


    @RequestMapping("/tosave")
    public String tosave(){
        return "save-project";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Project project){
        try {
            int result = projectService.save(project);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }


    @RequestMapping("/toupdate")
    public String toupdate(Model model,int id){
        Project project = projectService.getById(id);
        model.addAttribute("project",project);
        return "update-project";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Project project){
        try {
            int result = projectService.update(project);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
    @RequestMapping("/listJSON")
    @ResponseBody
    public String listJSON(){
        List<Project> list = projectService.list();
        return JSON.toJSONString(list);
    }
}
