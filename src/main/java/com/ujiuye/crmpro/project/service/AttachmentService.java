package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Attachment;

import java.util.List;

public interface AttachmentService {
    //type是数据库中type字段,而不是和之前那个搜索类型
    List<Attachment> list(int type, String tag, String keyword);
    int save(Attachment attachment);
    Attachment getById(int id);
}
