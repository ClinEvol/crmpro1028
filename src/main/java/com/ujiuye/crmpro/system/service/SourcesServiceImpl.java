package com.ujiuye.crmpro.system.service;

import com.ujiuye.crmpro.system.mapper.SourcesMapper;
import com.ujiuye.crmpro.system.pojo.Sources;
import com.ujiuye.crmpro.system.pojo.SourcesExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SourcesServiceImpl implements SourcesService {
    @Autowired
    private SourcesMapper sourcesMapper;

    //今天的重难点   递归
    @Override
    @Cacheable(value = "listStandard",key = "'listStandard_value'")
    public List<Sources> listStandard() {

        SourcesExample example=new SourcesExample();
        SourcesExample.Criteria criteria = example.createCriteria();
        //先查询根节点  父节点id=0
        criteria.andParentidEqualTo(0);
        List<Sources> sources = sourcesMapper.selectByExample(example);//sources=oa办公协同系统,人事管理
        if(sources!=null && sources.size()>0){//有根节点
            //遍历这个集，继续查找这些对象的子节点
            for (Sources source : sources) {//1 、oa办公协同系统
                findChildren(source);
            }
        }
        return sources;
    }
    //查找该source下的子节点
    private void findChildren(Sources source){  //OA   值传递与引用传递
        SourcesExample example=new SourcesExample();
        SourcesExample.Criteria criteria = example.createCriteria();
        criteria.andParentidEqualTo(source.getId());//查找parentid=当前source的id    1
        List<Sources> sourcesList = sourcesMapper.selectByExample(example);//oA子节点
        if(sourcesList!=null && sourcesList.size()>0){//有子点  项目管理  消息管理
            source.setChildren(sourcesList);//把查到的子点存入该点的Children属性
            for (Sources sources : sourcesList) {//遍历这个集合
                findChildren(sources);//查找这些对象的子节点
            }
        }

    }

    @Override
    @Cacheable(value = "listSimple",key = "'listSimple_value'")
    public List<Sources> listSimple() {
        return sourcesMapper.selectByExample(null);
    }

    @Override
    @Cacheable(value = "getById",key = "'getById_value_'+#id")
    public Sources getById(int id) {
        return sourcesMapper.selectByPrimaryKey(id);
    }

    @Override
    @CacheEvict(value = {"getById","listSimple","listStandard"},allEntries = true)
    public int save(Sources sources) {
        return sourcesMapper.insert(sources);
    }

    @Override
    @CacheEvict(value = {"getById","listSimple","listStandard"},allEntries = true)
    public int update(Sources sources) {
        return sourcesMapper.updateByPrimaryKeySelective(sources);
    }

    @Override
    @CacheEvict(value = {"getById","listSimple","listStandard"},allEntries = true)
    public int remove(int id) {
        return sourcesMapper.deleteByPrimaryKey(id);
    }
}
