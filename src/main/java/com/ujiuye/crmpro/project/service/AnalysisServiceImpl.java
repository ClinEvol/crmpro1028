package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.mapper.AnalysisMapper;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.AnalysisExample;
import com.ujiuye.crmpro.project.pojo.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AnalysisServiceImpl implements AnalysisService {

    @Autowired
    private AnalysisMapper analysisMapper;

    @Override
    public List<Analysis> list(int type, String keyword) {
        AnalysisExample example = new AnalysisExample();
        AnalysisExample.Criteria criteria = example.createCriteria();

        if(type==1){//标题
            criteria.andTitleLike("%"+keyword+"%");
        }
        if(type==2){//项目名称
            criteria.andProjectnameLike("%"+keyword+"%");
        }
        return analysisMapper.selectByExample(example);
    }

    @Override
    public int save(Analysis analysis) {
        analysis.setAddtime(new Date());
        analysis.setUpdatetime(new Date());
        return analysisMapper.insert(analysis);
    }

    @Override
    public Analysis getById(int id) {
        return analysisMapper.selectByPrimaryKey(id);
    }


}
