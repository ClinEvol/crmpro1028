package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Module;

import java.util.List;

public interface ModuleService {
    List<Module> list(int type, String keyword,int pageNum);
    List<Module> listByModuleName(String name);
    List<Module> listByAnalysisFk(int analysis_fk);


    int save(Module module);
}
