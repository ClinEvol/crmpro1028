package com.ujiuye.crmpro.indexvalue.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;
import com.ujiuye.crmpro.indexvalue.service.DatacollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/programmer/datacollect")
public class DatacollectController {

    @Autowired
    private DatacollectService datacollectService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword
                       ){
        PageHelper.startPage(pageNum,10);
        List<Datacollect> list = datacollectService.list(keyword);
        PageInfo<Datacollect> page=new PageInfo<>(list);
        model.addAttribute("page",page);
        return "list-benchmarking";
    }


    @RequestMapping("/listJSON")
    @ResponseBody
    public String listJSON(
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum
    ){
        PageHelper.startPage(pageNum,10);
        List<Datacollect> list = datacollectService.list("");
        PageInfo<Datacollect> page=new PageInfo<>(list);
        return JSON.toJSONString(page.getList());
    }

    @RequestMapping("/toecharts")
    public String toecharts(){
        return "list-echarts";
    }

}
