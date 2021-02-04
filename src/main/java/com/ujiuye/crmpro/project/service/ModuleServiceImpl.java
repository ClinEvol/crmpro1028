package com.ujiuye.crmpro.project.service;

import com.github.pagehelper.PageHelper;
import com.ujiuye.crmpro.project.mapper.ModuleMapper;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.Module;
import com.ujiuye.crmpro.project.pojo.ModuleExample;
import com.ujiuye.crmpro.project.pojo.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class ModuleServiceImpl implements ModuleService {
    @Autowired
    private ModuleMapper moduleMapper;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private AnalysisService analysisService;
    @Override
    public List<Module> list(int type, String keyword,int pageNum) {
        ModuleExample example=new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        List<Integer> ids=new ArrayList<>();
        ids.add(0);
        //模块名称  项目名称  需求名称
        if(type==1){
            criteria.andModulenameLike("%"+keyword+"%");
        }
        if(type==2){//项目名称
            List<Project> projects = projectService.listByName(keyword);
            for (Project project : projects) {
                ids.add(project.getId());
            }
            criteria.andProjectFkIn(ids);
        }
        if(type==3){//需求名称
            List<Analysis> list = analysisService.list(1, keyword);
            for (Analysis analysis : list) {
                ids.add(analysis.getId());
            }
            criteria.andAnalysisFkIn(ids);
        }
        PageHelper.startPage(pageNum,5);
        return moduleMapper.selectByExample(example);
    }

    @Override
    public List<Module> listByModuleName(String name) {
        ModuleExample example=new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        criteria.andModulenameLike("%"+name+"%");
        return moduleMapper.selectByExample(example);
    }

    @Override
    public List<Module> listByAnalysisFk(int analysis_fk) {
        ModuleExample example=new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        criteria.andAnalysisFkEqualTo(analysis_fk);
        return moduleMapper.selectByExample(example);
    }

    @Override
    public int save(Module module) {
        module.setAddtime(new Date());
        module.setUpdatetime(new Date());
        return moduleMapper.insert(module);
    }
}
