package com.ujiuye.crmpro.system.service;

import com.ujiuye.crmpro.system.mapper.RoleMapper;
import com.ujiuye.crmpro.system.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> list() {
        return roleMapper.selectByExample(null);
    }
}
