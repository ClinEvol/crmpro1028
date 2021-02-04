package com.ujiuye.crmpro.hr.service;

import com.ujiuye.crmpro.hr.pojo.Archives;

import java.util.List;

public interface ArchivesService {
    //通过员工id查询档案
    Archives getByEmployeeFk(int employee_fk);
    //修改
    int update(Archives archives);

    int save(Archives archives);

    int remove(List<String> ids);

    List<Archives> list(int type,String keyword,int pageNum);

}
