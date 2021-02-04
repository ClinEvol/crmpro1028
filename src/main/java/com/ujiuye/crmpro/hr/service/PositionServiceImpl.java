package com.ujiuye.crmpro.hr.service;

import com.ujiuye.crmpro.hr.mapper.PositionMapper;
import com.ujiuye.crmpro.hr.pojo.Position;
import com.ujiuye.crmpro.hr.pojo.PositionExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PositionServiceImpl implements PositionService {
    @Autowired
    private PositionMapper positionMapper;

    @Override
    public List<Position> listByDeptFk(int dept_fk) {
        PositionExample example=new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andDeptFkEqualTo(dept_fk);
        return positionMapper.selectByExample(example);
    }
}
