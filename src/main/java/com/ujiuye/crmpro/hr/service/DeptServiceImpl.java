package com.ujiuye.crmpro.hr.service;

import com.ujiuye.crmpro.hr.mapper.DeptMapper;
import com.ujiuye.crmpro.hr.pojo.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    @Override
    public List<Dept> list() {
        return deptMapper.selectByExample(null);
    }
}
