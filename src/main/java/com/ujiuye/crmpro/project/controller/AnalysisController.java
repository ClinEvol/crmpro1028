package com.ujiuye.crmpro.project.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.Project;
import com.ujiuye.crmpro.project.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/programmer/analysis")
public class AnalysisController {
    @Autowired
    private AnalysisService analysisService;


    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword)
    {
        PageHelper.startPage(pageNum,5);
        //查询
        List<Analysis> list = analysisService.list(type,keyword);
        //创建分页对象
        PageInfo<Analysis> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-analysis";
    }


    @RequestMapping("/tosave")
    public String tosave(){
        return "save-analysis";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Analysis analysis){
        try {
            int result = analysisService.save(analysis);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/isAnalysis")
    @ResponseBody
    public String isAnalysis(int id){
        try {
            Analysis analysis = analysisService.getById(id);
            return JSON.toJSONString(analysis);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }


}
