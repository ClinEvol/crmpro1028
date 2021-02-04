package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.forum.mapper.ForumsortMapper;
import com.ujiuye.crmpro.forum.pojo.Forumsort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ForumsortServiceImpl implements ForumsortService {
    @Autowired
    private ForumsortMapper forumsortMapper;

    @Override
    public List<Forumsort> list() {
        return forumsortMapper.selectByExample(null);
    }

    @Override
    public int updateClick(int id) {
        Forumsort forumsort = getById(id);
        //在原本的基础上加1
        forumsort.setClick(forumsort.getClick()+1);
        return forumsortMapper.updateByPrimaryKeySelective(forumsort);
    }

    @Override
    public int updateCount(int id) {
        Forumsort forumsort = getById(id);
        //在原本的基础上加1
        forumsort.setCount(forumsort.getCount()+1);
        return forumsortMapper.updateByPrimaryKeySelective(forumsort);
    }

    private Forumsort getById(int id){
        return forumsortMapper.selectByPrimaryKey(id);
    }
}
