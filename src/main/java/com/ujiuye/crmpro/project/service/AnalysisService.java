package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Analysis;


import java.util.List;

public interface AnalysisService {
    List<Analysis> list(int type, String keyword);

    int save(Analysis analysis);
    Analysis getById(int id);
}

