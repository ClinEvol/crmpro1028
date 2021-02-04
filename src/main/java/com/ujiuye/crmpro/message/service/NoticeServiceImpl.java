package com.ujiuye.crmpro.message.service;

import com.ujiuye.crmpro.common.shiro.ShiroDbRealm;
import com.ujiuye.crmpro.common.utils.CurrentUserUtils;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.message.mapper.NoticeMapper;
import com.ujiuye.crmpro.message.pojo.Notice;
import com.ujiuye.crmpro.message.pojo.NoticeExample;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> list(String keyword) {
        NoticeExample example=new NoticeExample();
        example.setOrderByClause("date desc");
        NoticeExample.Criteria criteria = example.createCriteria();
        if(keyword!=null && !keyword.equals("")){
            criteria.andTitleLike("%"+keyword+"%");
        }
        return noticeMapper.selectByExample(example);
    }

    @Override
    public int save(Notice notice) {
        notice.setDate(new Date());
        //设置发布人----当前登录者，行政（a,b），获取当前登录者
        Employee employee = CurrentUserUtils.getCurrentUser();
        notice.setCreateby(employee.getId());
        return noticeMapper.insert(notice);
    }

    @Override
    public int update(Notice notice) {
        return noticeMapper.updateByPrimaryKeySelective(notice);
    }

    @Override
    public int remove(List<Integer> ids) {
        NoticeExample example=new NoticeExample();
        NoticeExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return noticeMapper.deleteByExample(example);
    }

    @Override
    public Notice getById(int id) {
        return noticeMapper.selectByPrimaryKey(id);
    }
}
