package com.ujiuye.crmpro.message.service;

import com.ujiuye.crmpro.common.utils.CurrentUserUtils;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.message.mapper.MessageMapper;
import com.ujiuye.crmpro.message.pojo.Message;
import com.ujiuye.crmpro.message.pojo.MessageExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;


    @Override
    public List<Message> receiveList(String keyword, int status,int type) {
        MessageExample example=new MessageExample();
        MessageExample.Criteria criteria = example.createCriteria();
        //收件人为当前登录者
        Employee employee = CurrentUserUtils.getCurrentUser();
        criteria.andReceiveEqualTo(employee.getId());

        if(status==3){//查垃圾箱
            criteria.andStatusEqualTo(3);
        }else{//查非垃圾箱   0已读，1代表未读    不是草稿也是垃圾的
            criteria.andStatusNotEqualTo(3);
            //张三想给李四以一条消息，没有保到草稿箱了，不除去2的话，李四在收件箱中就能看见张三这条消息
            criteria.andStatusNotEqualTo(2);
        }
        if(type<4){
            criteria.andTypeEqualTo(type);
        }
        return messageMapper.selectByExample(example);
    }

    @Override
    public List<Message> sendlist(String keyword, int status) {
        MessageExample example=new MessageExample();
        MessageExample.Criteria criteria = example.createCriteria();
        //发件人为当前登录者
        Employee employee = CurrentUserUtils.getCurrentUser();
        criteria.andSendEqualTo(employee.getId());

        if(status==2){//草稿圾箱
            criteria.andStatusEqualTo(2);
        }else{//查发件箱   0已读，1代表未读    不是草稿也是垃圾的
            //不能除去3，如：张三给李发了一条消息，李四看完后设为垃圾箱，那么除去3，张三在发件箱中就看不了这条息
            criteria.andStatusNotEqualTo(2);
        }
        return messageMapper.selectByExample(example);
    }

    @Override
    public int save(Message message) {
        Employee employee = CurrentUserUtils.getCurrentUser();
        message.setSend(employee.getId());
        message.setTime(new Date());
        return messageMapper.insert(message);
    }

    @Override
    public int update(Message message) {
        return messageMapper.updateByPrimaryKeySelective(message);
    }

    @Override
    public int remove(List<Integer> ids) {
        MessageExample example=new MessageExample();
        MessageExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return messageMapper.deleteByExample(example);
    }

    @Override
    public Message getById(int id) {
        return messageMapper.selectByPrimaryKey(id);
    }


}
