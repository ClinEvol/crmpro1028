package com.ujiuye.crmpro.indexvalue.mapper;

import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;
import com.ujiuye.crmpro.indexvalue.pojo.DatacollectExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DatacollectMapper {
    int countByExample(DatacollectExample example);

    int deleteByExample(DatacollectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Datacollect record);

    int insertSelective(Datacollect record);

    List<Datacollect> selectByExample(DatacollectExample example);

    Datacollect selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Datacollect record, @Param("example") DatacollectExample example);

    int updateByExample(@Param("record") Datacollect record, @Param("example") DatacollectExample example);

    int updateByPrimaryKeySelective(Datacollect record);

    int updateByPrimaryKey(Datacollect record);
}