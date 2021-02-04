package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.common.utils.CurrentUserUtils;
import com.ujiuye.crmpro.forum.mapper.ForumpostMapper;
import com.ujiuye.crmpro.forum.pojo.Forumpost;
import com.ujiuye.crmpro.forum.pojo.ForumpostExample;
import com.ujiuye.crmpro.hr.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
/*
2.1帖子列表，通过块版ID区分（调用1.2）
2.2查看帖子详情，通过帖子ID（调用2.4   serivce?controller?）
  之前：getById()   >update,show       controller
2.3发帖（调用1.3）
2.4更新浏览量
2.5更新评论总数据
 */
@Service
public class ForumpostServiceImpl implements ForumpostService {
    @Autowired
    private ForumsortService forumsortService;
    @Autowired
    private ForumpostMapper forumpostMapper;

    @Override
    public List<Forumpost> updateClickAndlist(int forumsort_fk) {
        //更新版块的浏览量,查看哪个生版块就更新哪个版块
        forumsortService.updateClick(forumsort_fk);

        ForumpostExample example=new ForumpostExample();
        ForumpostExample.Criteria criteria = example.createCriteria();
        criteria.andForumsortFkEqualTo(forumsort_fk);
        return forumpostMapper.selectByExample(example);
    }

    @Override
    public Forumpost getById(int id) {
        return forumpostMapper.selectByPrimaryKey(id);
    }

    @Override
    public int save(Forumpost forumpost) {
        //更新版块的帖子总数,帖子发布到哪个块就更新哪个版块
        forumsortService.updateCount(forumpost.getForumsortFk());//????
        //设置属性的默认值
        forumpost.setCreatetime(new Date());
        forumpost.setStatus(0);
        forumpost.setClick(0);
        forumpost.setCommentCount(0);
        //发布者是当前登录者
        Employee currentUser = CurrentUserUtils.getCurrentUser();
        forumpost.setEmployeeFk(currentUser.getId());
        return forumpostMapper.insert(forumpost);
    }

    @Override
    public int updateClick(int id) {
        Forumpost forumpost = getById(id);
        forumpost.setClick(forumpost.getClick()+1);
        return forumpostMapper.updateByPrimaryKeySelective(forumpost);
    }

    @Override
    public int updateCommentCount(int id) {
        Forumpost forumpost = getById(id);
        forumpost.setCommentCount(forumpost.getCommentCount()+1);
        return forumpostMapper.updateByPrimaryKeySelective(forumpost);
    }

    @Override
    public boolean isExistsByTitle(String title) {
        ForumpostExample example=new ForumpostExample();
        ForumpostExample.Criteria criteria = example.createCriteria();
        criteria.andTitleEqualTo(title);
        List<Forumpost> forumposts = forumpostMapper.selectByExample(example);

        if(forumposts!=null && forumposts.size()>0){
            return true;
        }
        return false;
    }


}
