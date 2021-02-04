package com.ujiuye.crmpro.project.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.Module;
import com.ujiuye.crmpro.project.pojo.Project;
import com.ujiuye.crmpro.project.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/programmer/module")
public class ModuleController {
    @Autowired
    private ModuleService moduleService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword)
    {
        //查询
        List<Module> list = moduleService.list(type,keyword,pageNum);
        //创建分页对象
        PageInfo<Module> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-module";
    }


    @RequestMapping("/tosave")
    public String tosave(){
        return "save-module";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Module module){
        try {
            int result = moduleService.save(module);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/listByAnalysisFk")
    @ResponseBody
    public String salistByAnalysisFk(int analysis_fk){
        try {
            List<Module> modules = moduleService.listByAnalysisFk(analysis_fk);
            return JSON.toJSONString(modules);
        } catch (Exception e) {
            e.printStackTrace();
            return "[]";//返回一个空的JSON数据组
        }
    }
}
