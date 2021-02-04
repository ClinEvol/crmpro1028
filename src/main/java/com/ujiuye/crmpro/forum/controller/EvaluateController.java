package com.ujiuye.crmpro.forum.controller;

import com.ujiuye.crmpro.forum.pojo.Evaluate;
import com.ujiuye.crmpro.forum.service.EvaluateService;
import com.ujiuye.crmpro.forum.service.ForumpostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/evalute")
@Controller
public class EvaluateController {
    @Autowired
    private EvaluateService evaluateService;


    @RequestMapping("/save")
    @ResponseBody
    public String save(Evaluate evaluate){
        try {

            int save = evaluateService.save(evaluate);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    //可以写一个list在这里，那么前台使用AJax获取，但是前台不好操作
}
