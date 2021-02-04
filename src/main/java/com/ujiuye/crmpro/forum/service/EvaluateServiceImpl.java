package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.common.utils.CurrentUserUtils;
import com.ujiuye.crmpro.forum.mapper.EvaluateMapper;
import com.ujiuye.crmpro.forum.pojo.Evaluate;
import com.ujiuye.crmpro.forum.pojo.EvaluateExample;
import com.ujiuye.crmpro.hr.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluateServiceImpl implements EvaluateService {
    @Autowired
    private EvaluateMapper evaluateMapper;
    @Autowired
    private ForumpostService forumpostService;

    @Override
    public List<Evaluate> list(int forumpost_fk) {
        EvaluateExample example=new EvaluateExample();
        EvaluateExample.Criteria criteria = example.createCriteria();
        criteria.andForumFkEqualTo(forumpost_fk);
        return evaluateMapper.selectByExample(example);
    }

    @Override
    public int save(Evaluate evaluate) {
        //更新评论数量
        forumpostService.updateCommentCount(evaluate.getForumFk());

        //获取发表人
        Employee currentUser = CurrentUserUtils.getCurrentUser();
        evaluate.setEmpFk4(currentUser.getId());
        return evaluateMapper.insert(evaluate);
    }
}
