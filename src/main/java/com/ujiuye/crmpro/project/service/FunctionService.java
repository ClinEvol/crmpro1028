package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Function;

import java.util.List;

public interface FunctionService {
    List<Function> list(int type, String keyword, int pageNum);
    int save(Function function);
    List<Function> listByModuleFk(int module_fk);
}
