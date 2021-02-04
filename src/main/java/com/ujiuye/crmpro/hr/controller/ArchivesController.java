package com.ujiuye.crmpro.hr.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.hr.pojo.Archives;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.ArchivesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/hr/archives")
public class ArchivesController {

    @Autowired
    private ArchivesService archivesService;
    //列表-所有人的档案

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0")int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "")String keyword)
    {

        //查询
        List<Archives> list = archivesService.list(type,keyword,pageNum);
        //创建分页对象
        PageInfo<Archives> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-archives";
    }

}
