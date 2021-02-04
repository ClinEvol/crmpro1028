package com.ujiuye.crmpro.indexvalue.service;

import com.ujiuye.crmpro.indexvalue.mapper.DatacollectMapper;
import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;
import com.ujiuye.crmpro.indexvalue.pojo.DatacollectExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DatacollectServiceImpl implements DatacollectService {
    @Autowired
    private DatacollectMapper datacollectMapper;

    @Override
    public List<Datacollect> list(String keyword) {
        DatacollectExample example=new DatacollectExample();
        DatacollectExample.Criteria criteria = example.createCriteria();

        if(keyword!=null&& !keyword.equals("")){
            criteria.andCnameLike("%"+keyword+"%");
        }
        return datacollectMapper.selectByExample(example);
    }
}
