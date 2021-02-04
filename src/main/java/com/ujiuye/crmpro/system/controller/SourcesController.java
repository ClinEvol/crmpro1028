package com.ujiuye.crmpro.system.controller;

import com.alibaba.fastjson.JSON;
import com.ujiuye.crmpro.system.pojo.Sources;
import com.ujiuye.crmpro.system.service.SourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/system/sources")
@Controller //这个类下面的方法都是异步方法
public class SourcesController {
    @Autowired
    private SourcesService sourcesService;

    @RequestMapping(value = "listStandard",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String listStandard(){
        try {
            return JSON.toJSONString(sourcesService.listStandard());
        } catch (Exception e) {
            e.printStackTrace();
            return "[]";
        }
    }

    @RequestMapping(value = "listSimple",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String listSimple(){
        try {
            return JSON.toJSONString(sourcesService.listSimple());
        } catch (Exception e) {
            e.printStackTrace();
            return "[]";
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Sources sources){
        try {
            sourcesService.save(sources);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
    @RequestMapping("/update")
    @ResponseBody
    public String update(Sources sources){
        try {
            sourcesService.update(sources);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(int id){
        try {
            sourcesService.remove(id);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();

            return "false";
        }
    }


    @RequestMapping(value = "getById",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getById(int id){
        try {
            return JSON.toJSONString(sourcesService.getById(id));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/tosources")
    public String tosources(){
        return "list-resources";
    }
}
