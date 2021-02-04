package com.ujiuye.crmpro.system.mapper;

import com.ujiuye.crmpro.system.pojo.EmployeeRole;
import com.ujiuye.crmpro.system.pojo.EmployeeRoleExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeRoleMapper {
    int countByExample(EmployeeRoleExample example);

    int deleteByExample(EmployeeRoleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeRole record);

    int insertSelective(EmployeeRole record);

    List<EmployeeRole> selectByExample(EmployeeRoleExample example);

    EmployeeRole selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EmployeeRole record, @Param("example") EmployeeRoleExample example);

    int updateByExample(@Param("record") EmployeeRole record, @Param("example") EmployeeRoleExample example);

    int updateByPrimaryKeySelective(EmployeeRole record);

    int updateByPrimaryKey(EmployeeRole record);
    List<EmployeeRole> listByEmployeeFk(int employee_fk);
}