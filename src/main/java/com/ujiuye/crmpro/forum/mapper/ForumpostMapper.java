package com.ujiuye.crmpro.forum.mapper;

import com.ujiuye.crmpro.forum.pojo.Forumpost;
import com.ujiuye.crmpro.forum.pojo.ForumpostExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ForumpostMapper {
    int countByExample(ForumpostExample example);

    int deleteByExample(ForumpostExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Forumpost record);

    int insertSelective(Forumpost record);

    List<Forumpost> selectByExampleWithBLOBs(ForumpostExample example);

    List<Forumpost> selectByExample(ForumpostExample example);

    Forumpost selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Forumpost record, @Param("example") ForumpostExample example);

    int updateByExampleWithBLOBs(@Param("record") Forumpost record, @Param("example") ForumpostExample example);

    int updateByExample(@Param("record") Forumpost record, @Param("example") ForumpostExample example);

    int updateByPrimaryKeySelective(Forumpost record);

    int updateByPrimaryKeyWithBLOBs(Forumpost record);

    int updateByPrimaryKey(Forumpost record);
}