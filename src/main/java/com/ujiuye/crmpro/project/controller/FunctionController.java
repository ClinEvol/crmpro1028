package com.ujiuye.crmpro.project.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.Function;
import com.ujiuye.crmpro.project.pojo.Module;
import com.ujiuye.crmpro.project.service.FunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/programmer/function")
public class FunctionController {
    @Autowired
    private FunctionService functionService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword)
    {
        //查询
        List<Function> list = functionService.list(type,keyword,pageNum);
        //创建分页对象
        PageInfo<Function> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-function";
    }


    @RequestMapping("/tosave")
    public String tosave(){
        return "save-function";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Function function){
        try {
            int result = functionService.save(function);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/listByModuleFk")
    @ResponseBody
    public String listByModuleFk(int module_fk){
        try {
            List<Function> list = functionService.listByModuleFk(module_fk);
            return JSON.toJSONString(list);
        } catch (Exception e) {
            e.printStackTrace();
            return "[]";//返回一个空的JSON数据组
        }
    }
}
