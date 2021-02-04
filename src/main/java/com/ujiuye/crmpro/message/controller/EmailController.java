package com.ujiuye.crmpro.message.controller;

import com.ujiuye.crmpro.common.quartz.EmailScheduler;
import com.ujiuye.crmpro.common.utils.CurrentUserUtils;
import com.ujiuye.crmpro.common.utils.EmailUtils;
import com.ujiuye.crmpro.hr.pojo.Archives;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.ArchivesService;
import com.ujiuye.crmpro.message.pojo.Email;
import com.ujiuye.crmpro.message.pojo.EmailExt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/email")
public class EmailController {

    @Autowired
    private ArchivesService archivesService;

    @RequestMapping("/send")
    @ResponseBody
    public String send(EmailExt emailExt){
        //查询接收者的email
        Archives archives = archivesService.getByEmployeeFk(Integer.parseInt(emailExt.getReceiver()));
        //没有查到接者的邮件
        if(archives==null || archives.getEmail()==null || archives.getEmail().equals("")){
            return "noReceiver";
        }
        //把前台传过的来的id换成具体的邮箱
        emailExt.setReceiver(archives.getEmail());

        //查询发送者（当前登录者）的邮箱与授权码
        Employee employee = CurrentUserUtils.getCurrentUser();
        Archives myArchives = archivesService.getByEmployeeFk(employee.getId());
        //没有查到发送的邮箱信息(邮箱与授权码)
        if(myArchives==null || myArchives.getEmail()==null || myArchives.getEmail().equals("") || myArchives.getCode()==null || myArchives.getCode().equals("")){
            return "noSender";
        }
        emailExt.setSender(myArchives.getEmail());
        emailExt.setCode(myArchives.getCode());

        //调用工具类发送邮件
        try {
            if(emailExt.getIsTime()==null){//立即发送
                EmailUtils.send(emailExt);
            }else{//定时
                //调用任务调度器
                EmailScheduler.scheduler(emailExt);
            }

            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }


    }

    @RequestMapping("/tosend")
    public String tosend(){
        return "save-email";
    }
}
