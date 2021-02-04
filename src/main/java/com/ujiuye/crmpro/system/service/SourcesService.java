package com.ujiuye.crmpro.system.service;

import com.ujiuye.crmpro.system.pojo.Sources;

import java.util.List;

public interface SourcesService {
    //标准JSON格式
    List<Sources> listStandard();
    //简单的数据格式
    List<Sources> listSimple();
    Sources getById(int id);
    int save(Sources sources);
    int update(Sources sources);
    int remove(int id);
}
