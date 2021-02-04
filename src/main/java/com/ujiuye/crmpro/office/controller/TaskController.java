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

import java.util.List;

/**
 * 程序员
 */
@Controller
@RequestMapping("/programmer/task")
public class TaskController {
    @Autowired
    private TaskService taskService;


    @RequestMapping("list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0") int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword
    ){
        List<Task> list = taskService.list(type, keyword, pageNum, true);
        PageInfo<Task> page=new PageInfo<>(list);
        model.addAttribute("page",page);
        return "list-mytask";
    }




    @RequestMapping("update")
    @ResponseBody
    public String update(Task task){
        try {
            taskService.update(task);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }


    @RequestMapping("show")
    public String show(Model model,int id){
        Task task = taskService.getById(id);
        model.addAttribute("task",task);
        return "show-task";
    }


}
