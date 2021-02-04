package com.ujiuye.crmpro.message.controller;

import com.ujiuye.crmpro.common.utils.FileTypeUtils;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.message.pojo.Notice;
import com.ujiuye.crmpro.message.service.NoticeService;
import com.ujiuye.crmpro.project.pojo.Attachment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Arrays;
import java.util.List;

/**
 * 行政做发布，删除，修改
 */
@Controller
@RequestMapping("/administration/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer[] ids){
        List<Integer> idsList = Arrays.asList(ids);
        try {
            int result=noticeService.remove(idsList);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    //发布公告  文 件上传
    @RequestMapping("/save")
    @ResponseBody
    public String save(@RequestParam("myfile") MultipartFile myfile, Notice notice){
        try {
            //实现上传
            File file = MyFileUtils.uploadFile(myfile,null);
            if(file==null){
                return "fileError";
            }
            //文件上传成功，把上传成功的文 件名赋对象
            notice.setPath(file.getName());
            int result = noticeService.save(notice);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(@RequestParam("myfile") MultipartFile myfile, Notice notice){
        try {
            if(!myfile.isEmpty()){
                //实现上传
                File file = MyFileUtils.uploadFile(myfile,null);
                if(file==null){
                    return "fileError";
                }
                //文件上传成功，把上传成功的文 件名赋对象
                notice.setPath(file.getName());
            }

            int result = noticeService.update(notice);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }


    @RequestMapping("/toupdate")
    public String toupdate(Model model,int id){
        Notice notice = noticeService.getById(id);
        model.addAttribute("notice",notice);
        return "update-notice";
    }

    @RequestMapping("/tosave")
    public String tosave(){
        return "save-notice";
    }



}
