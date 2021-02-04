package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.mapper.AttachmentMapper;
import com.ujiuye.crmpro.project.pojo.Attachment;
import com.ujiuye.crmpro.project.pojo.AttachmentExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class AttachmentServiceImpl implements AttachmentService {
    @Autowired
    private AttachmentMapper attachmentMapper;

    @Override
    public List<Attachment> list(int type, String tag, String keyword) {
        //type默认值为0,表示不分类型 1 表示图片,2 表示文档,3 表示视频,4 表示种子,5 表示音乐,6表示其它
        AttachmentExample example=new AttachmentExample();
        AttachmentExample.Criteria criteria = example.createCriteria();
        if(type>0){//按类型搜索
            criteria.andTypeEqualTo(type);
        }
        //按标签标搜索： 1，2，3   比如我想搜2这个标，只要包今含2就好
        if(tag!=null && !tag.equals("")){
            criteria.andTagLike("%"+tag+"%");
        }
        //按关键字搜索附件名称
        if(keyword!=null && !keyword.equals("")){
            criteria.andNameLike("%"+keyword+"%");
        }
        return attachmentMapper.selectByExample(example);
    }

    @Override
    public int save(Attachment attachment) {
        attachment.setAddtime(new Date());
        attachment.setUpdatetime(new Date());
        return attachmentMapper.insert(attachment);
    }

    @Override
    public Attachment getById(int id) {
        return attachmentMapper.selectByPrimaryKey(id);
    }
}
