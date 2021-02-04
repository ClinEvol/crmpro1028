package com.ujiuye.crmpro.hr.controller;

import com.ujiuye.crmpro.common.utils.FileTypeUtils;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.hr.pojo.Archives;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.ArchivesService;
import com.ujiuye.crmpro.project.pojo.Attachment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * 自已查看、修改，自已的，
 * 入职（添加Employee时就应该添加一个空的档案）
 * 离职（删除Employee时就删除对应的档案）
 */
@Controller
@RequestMapping("/archives")
public class PublicArchivesController {
    @Autowired
    private ArchivesService archivesService;

    //上传头像
    @RequestMapping("upload")
    @ResponseBody
    public String uploadLogo(@RequestParam("logo") MultipartFile logo){
        //tomcat插件有热更新，直接把图片放到项目目录下，tomcat就会直接更新
        //usr/local/tomcat1/webapps/ROOT
        //String path="/Users/ClinEvol/Workspaces/IdeaProjects/crmpro1028/src/main/webapp/upload/";
        String path="/Users/ClinEvol/Workspaces/IdeaProjects/crmpro1028/src/main/webapp/upload/";

        File file = MyFileUtils.uploadFile(logo, path);
        if(file==null){
            return "false";
        }
        return "/upload/"+file.getName();//返回什么给前台  图片路径
    }


    @RequestMapping("/update")
    @ResponseBody
    public String save(Archives archives){
        try{
            archivesService.update(archives);
            return "true";
        }catch (Exception e){
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/show")
    public String show(Model model, int employee_fk){
        Archives archives = archivesService.getByEmployeeFk(employee_fk);
        model.addAttribute("archives",archives);
        return "show-archives";
    }

    @RequestMapping("/toupdate")
    public String toupdate(Model model, int employee_fk){
        Archives archives = archivesService.getByEmployeeFk(employee_fk);
        model.addAttribute("archives",archives);
        return "update-archives";
    }
}
