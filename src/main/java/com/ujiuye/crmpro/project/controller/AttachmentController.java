package com.ujiuye.crmpro.project.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.FileTypeUtils;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.Attachment;
import com.ujiuye.crmpro.project.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@RequestMapping("/programmer/attachment")
@Controller
public class AttachmentController {
    @Autowired
    private AttachmentService attachmentService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0") int type,
                       @RequestParam(value = "tag",required = false,defaultValue = "") String tag,
                       @RequestParam(value = "keyword",required = false,defaultValue = "") String keyword)
    {
        PageHelper.startPage(pageNum,5);
        //查询
        List<Attachment> list = attachmentService.list(type,tag,keyword);
        //创建分页对象
        PageInfo<Attachment> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-attachment";
    }

    @RequestMapping("/tosave")
    public String tosave(){
        return "save-attachment";
    }

    //文 件上传
    @RequestMapping("/save")
    @ResponseBody
    public String save(@RequestParam("myfile") MultipartFile myfile,Attachment attachment){
        try {
            //实现上传
            File file = MyFileUtils.uploadFile(myfile,null);
            if(file==null){
                return "fileError";
            }
            //文件上传成功，把上传成功的文 件名赋对象
            attachment.setPath(file.getName());
            //判断文件类型
            int type = FileTypeUtils.getType(file.getName());
            attachment.setType(type);
            int result = attachmentService.save(attachment);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/show")
    public String show(Model model,int id){
        Attachment attachment = attachmentService.getById(id);
        model.addAttribute("attachment",attachment);
        return "show-attachment";
    }


    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(String filename){
        return MyFileUtils.download(filename,null);
    }
}
