package com.ujiuye.crmpro.message.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.message.pojo.Message;
import com.ujiuye.crmpro.message.pojo.Notice;
import com.ujiuye.crmpro.message.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "status",required = false,defaultValue = "0") int status,
                       @RequestParam(value = "type",required = false,defaultValue = "4") int type,
                       @RequestParam(value = "sort",required = false,defaultValue = "1") int sort,
                       @RequestParam(value = "keyword",required = false,defaultValue = "")String keyword)
    {
        //设置分页
        PageHelper.startPage(pageNum,5);
        //查询
        List<Message> list=null;
        if(sort==1){
            list= messageService.receiveList(keyword,status,type);
        }else{
            list=messageService.sendlist(keyword,status);
        }

        //创建分页对象
        PageInfo<Message> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        String title="";
        if(sort==1 && status==3){
            title="垃圾箱";
        }else if(sort==1){
            title="收件箱";
        }else if(sort==2 && status==2){
            title="草稿箱";
        }else{
            title="发件箱";
        }
        model.addAttribute("title",title);
        return "list-message";
    }

    @RequestMapping("/tosave")
    public String tosave(Model model,@RequestParam(value ="receive",required = false,defaultValue = "0") int receive){
        model.addAttribute("receive",receive);
        return "save-message";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(@RequestParam("myfile") MultipartFile myfile,Message message){
        try {
            if (!myfile.isEmpty()) {
                //实现上传
                File file = MyFileUtils.uploadFile(myfile,null);
                if(file==null){
                    return "fileError";
                }
                //文件上传成功，把上传成功的文 件名赋对象
                message.setPath(file.getName());
            }

            int result = messageService.save(message);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }



    @RequestMapping("/show")
    public String toupdate(Model model,int id){
        Message message = messageService.getById(id);
        if(message.getStatus()==1){
            //把未读装状态改成已读
            message.setStatus(0);
            messageService.update(message);
        }

        model.addAttribute("message",message);

        return "show-message";
    }


}
