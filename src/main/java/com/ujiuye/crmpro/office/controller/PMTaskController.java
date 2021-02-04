package com.ujiuye.crmpro.office.controller;

import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.office.pojo.Task;
import com.ujiuye.crmpro.office.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * 项目经理
 */
@Controller
@RequestMapping("/projectManager/task")
public class PMTaskController {
    @Autowired
    private TaskService taskService;

    @RequestMapping("list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword
                       ){
        List<Task> list = taskService.list(type, keyword, pageNum, false);
        PageInfo<Task> page=new PageInfo<>(list);
        model.addAttribute("page",page);
        return "list-task";
    }
    @RequestMapping("tosave")
    public String tosave(){
        return "save-task";
    }

    @RequestMapping("save")
    @ResponseBody
    public String save(Task task){
        try {
            taskService.save(task);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("toupdate")
    public String tosave(Model model,int id){
        Task task = taskService.getById(id);
        model.addAttribute("task",task);
        return "update-task";
    }

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer[] ids){
        List<Integer> idsList = Arrays.asList(ids);
        try {
            int remove = taskService.remove(idsList);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }


}
