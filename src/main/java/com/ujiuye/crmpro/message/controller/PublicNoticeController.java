package com.ujiuye.crmpro.message.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.message.pojo.Notice;
import com.ujiuye.crmpro.message.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 所有人读取公告列表,查看详情
 */
@RequestMapping("/notice")
@Controller
public class PublicNoticeController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "keyword",required = false,defaultValue = "")String keyword)
    {
        //设置分页
        PageHelper.startPage(pageNum,5);
        //查询
        List<Notice> list = noticeService.list(keyword);
        //创建分页对象
        PageInfo<Notice> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-notice";
    }

    @RequestMapping("/show")
    public String toupdate(Model model,int id){
        Notice notice = noticeService.getById(id);
        model.addAttribute("notice",notice);
        return "show-notice";
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(String filename){
        return MyFileUtils.download(filename,null);
    }

}
