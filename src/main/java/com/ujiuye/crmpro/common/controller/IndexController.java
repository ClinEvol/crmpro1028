package com.ujiuye.crmpro.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class IndexController {

    @RequestMapping
    public String index(){
        return "index";
    }

    @RequestMapping("/index_v148b2")
    public String indexv148b2(){
        return "index_v148b2";
    }
}
