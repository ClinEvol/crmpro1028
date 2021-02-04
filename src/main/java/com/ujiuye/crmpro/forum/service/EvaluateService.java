package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.forum.pojo.Evaluate;

import java.util.List;

public interface EvaluateService {
    //通过帖子ID
    List<Evaluate> list(int forumpost_fk);
    //发表评论
    int save(Evaluate evaluate);
}
