package com.ujiuye.crmpro.forum.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.forum.pojo.Evaluate;
import com.ujiuye.crmpro.forum.pojo.Forumpost;
import com.ujiuye.crmpro.forum.service.EvaluateService;
import com.ujiuye.crmpro.forum.service.ForumpostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/forumpost")
public class ForumpostController {
    @Autowired
    private ForumpostService forumpostService;
    @Autowired
    private EvaluateService evaluateService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "0") int pageNum,
                       int forumsort_fk){
        PageHelper.startPage(pageNum,6);
        List<Forumpost> list = forumpostService.updateClickAndlist(forumsort_fk);
        PageInfo<Forumpost> page=new PageInfo<>(list);
        model.addAttribute("page",page);
        return "list-forum";
    }


    @RequestMapping("/show")
    public String show(Model model,int id){
        //更新浏览量
        try {
            forumpostService.updateClick(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //查看哪个帖子就把哪个帖子的评论列表加载出来
        List<Evaluate> list = evaluateService.list(id);
        Forumpost forumpost = forumpostService.getById(id);
        model.addAttribute("forumpost",forumpost);
        model.addAttribute("list",list);
        return "show-forum";
    }


    @RequestMapping("/save")
    @ResponseBody
    public String save(Forumpost forumpost){
        try {
            int save = forumpostService.save(forumpost);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
    @RequestMapping("/tosave")
    public String tosave(){
        return "save-forum";
    }


    @RequestMapping("/isExistsByTitle")
    @ResponseBody
    public String isExistsByTitle(String title){
        return String.valueOf(forumpostService.isExistsByTitle(title));
    }
}
