package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.forum.pojo.Forumpost;

import java.util.List;

public interface ForumpostService {

    //帖子列表，通过块版ID区分
    List<Forumpost> updateClickAndlist(int forumsort_fk);
    //查看帖子详情，通过帖子ID
    Forumpost getById(int id);
    //2.3发帖（调用1.3）
    int save(Forumpost forumpost);
    //更新浏览量
    int updateClick(int id);
    //更新评论总数据
    int updateCommentCount(int id);

    boolean isExistsByTitle(String title);
}
