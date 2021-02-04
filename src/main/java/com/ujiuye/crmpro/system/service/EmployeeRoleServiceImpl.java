package com.ujiuye.crmpro.system.service;

import com.ujiuye.crmpro.system.mapper.EmployeeRoleMapper;
import com.ujiuye.crmpro.system.pojo.EmployeeRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeeRoleServiceImpl implements EmployeeRoleService {

    @Autowired
    private EmployeeRoleMapper employeeRoleMapper;
    @Override
    public int save(List<EmployeeRole> list) {

        try {
            for (EmployeeRole employeeRole : list) {
                employeeRoleMapper.insert(employeeRole);
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

    }
}
