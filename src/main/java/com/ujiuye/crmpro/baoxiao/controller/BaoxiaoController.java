package com.ujiuye.crmpro.baoxiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.baoxiao.pojo.Baoxiao;
import com.ujiuye.crmpro.baoxiao.service.BaoxiaoService;
import com.ujiuye.crmpro.hr.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/baoxiao")
public class BaoxiaoController {
    @Autowired
    private BaoxiaoService baoxiaoService;
    //列表页
    @RequestMapping("/list")
    public String list(
            Model model,
            @RequestParam(value = "type",required = false,defaultValue = "0") int type,
            @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword,
            @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
            @RequestParam(value = "size",required = false,defaultValue = "5") int size,
            @RequestParam(value = "status",required = false,defaultValue = "5") int status
    ){
        //设置分页
        PageHelper.startPage(pageNum,size);
        //查询
        List<Baoxiao> list=baoxiaoService.list(type,keyword,status);
        //创建分页对象
        PageInfo<Baoxiao> page=new PageInfo<>(list);
        model.addAttribute("list",list);
        model.addAttribute("type",type);
        model.addAttribute("keyword",keyword);
        model.addAttribute("page",page);
        //1待审批，，2待付款，3已付款
        if(status==1){
            return "list-approve";
        }
        if(status==2){
            return "list-pay";
        }
        return "list-payed";
    }

    //我的报销
    @RequestMapping("/mylist")
    public String mylist(
            Model model, HttpSession session,
            @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword,
            @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
            @RequestParam(value = "size",required = false,defaultValue = "5") int size,
            @RequestParam(value = "status",required = false,defaultValue = "5") int status
    ){
        //获取当前登录者
        Employee employee=(Employee)session.getAttribute("gray");
        //设置分页
        PageHelper.startPage(pageNum,size);
        //查询
        List<Baoxiao> list=baoxiaoService.mylist(keyword,employee.getId());
        //创建分页对象
        PageInfo<Baoxiao> page=new PageInfo<>(list);
        model.addAttribute("list",list);
        model.addAttribute("keyword",keyword);
        model.addAttribute("page",page);
        return "list-myaccount";
    }


    //删除单个
    @ResponseBody
    @RequestMapping("remove")
    public String removeById(String bxid){
        try {
            int result=baoxiaoService.remove(bxid);
            if (result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Baoxiao baoxiao,HttpSession session){
        SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
        String random=String.valueOf(Math.random()).substring(3,7);
        String bxid="BX"+format.format(new Date())+random;
        baoxiao.setBxid(bxid);
        //获取当前登录者
        Employee employee=(Employee)session.getAttribute("gray");
        baoxiao.setEmpFk(employee.getId());
        try {
            int result=baoxiaoService.save(baoxiao);
            if (result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Baoxiao baoxiao){
        try {
            int result=baoxiaoService.update(baoxiao);
            if (result>0){
                return "true";
            }
            return "false";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    //跳转到修改页
    @RequestMapping("/toupdate")
    public String toUpdate(Model model,String bxid){
       Baoxiao baoxiao = baoxiaoService.getById(bxid);
        model.addAttribute("baoxiao",baoxiao);
        return "update-myaccount";
    }

    //跳转到审批页
    @RequestMapping("/toapprove")
    public String toapprove(Model model,String bxid){
        Baoxiao baoxiao = baoxiaoService.getById(bxid);
        model.addAttribute("baoxiao",baoxiao);
        return "update-approve";
    }

    //跳转到查看
    @RequestMapping("/show")
    public String show(Model model,String bxid){
        Baoxiao baoxiao =baoxiaoService.getById(bxid);
        model.addAttribute("baoxiao",baoxiao);
        return "show-myaccount";
    }
    //跳转到添加
    @RequestMapping("/tosave")
    public String tosave(){
        return "save-myaccount";
    }


}
