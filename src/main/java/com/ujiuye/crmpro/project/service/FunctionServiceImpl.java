package com.ujiuye.crmpro.project.service;

import com.github.pagehelper.PageHelper;
import com.ujiuye.crmpro.project.mapper.FunctionMapper;
import com.ujiuye.crmpro.project.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class FunctionServiceImpl implements FunctionService {
    @Autowired
    private FunctionMapper functionMapper;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private AnalysisService analysisService;
    @Autowired
    private ModuleService moduleService;

    @Override
    public List<Function> list(int type, String keyword, int pageNum) {

        FunctionExample example=new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        List<Integer> ids=new ArrayList<>();
        ids.add(0);
        if(type==1){//功能名称
            criteria.andFunctionnameLike("%"+keyword+"%");
        }
        if(type==2){//模块名称
            List<Module> modules = moduleService.listByModuleName(keyword);
            for (Module module : modules) {
                ids.add(module.getId());
            }
            criteria.andModuleFkIn(ids);
        }
        if(type==3){//需求名称
            List<Analysis> analysiss = analysisService.list(1, keyword);
            for (Analysis analysis : analysiss) {
                ids.add(analysis.getId());
            }
            criteria.andAnalysisFkIn(ids);
        }
        if(type==4){//项目名称
            List<Project> projects = projectService.listByName(keyword);
            for (Project project : projects) {
                ids.add(project.getId());
            }
            criteria.andProFkIn(ids);
        }
        PageHelper.startPage(pageNum,5);
        return functionMapper.selectByExample(example);
    }

    @Override
    public int save(Function function) {
        function.setAddtime(new Date());
        function.setUpdatetime(new Date());
        return functionMapper.insert(function);
    }

    @Override
    public List<Function> listByModuleFk(int module_fk) {
        FunctionExample example=new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        criteria.andModuleFkEqualTo(module_fk);
        return functionMapper.selectByExample(example);
    }
    //晚上任务：1.优上面这个代码，把for提取到一个方法中  private List<Integer> getIDS(List<T> list){}
    //做成一个工具类也可以

}
