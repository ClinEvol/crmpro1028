package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.forum.pojo.Forumsort;

import java.util.List;

public interface ForumsortService {
    //列表
    List<Forumsort> list();
    //更新浏览量
    int updateClick(int id);
    //更新帖子总数
    int updateCount(int id);
}
