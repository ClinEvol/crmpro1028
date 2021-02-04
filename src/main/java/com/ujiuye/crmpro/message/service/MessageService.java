package com.ujiuye.crmpro.message.service;

import com.ujiuye.crmpro.message.pojo.Message;

import java.util.List;

public interface MessageService {
    //收件箱  收件人是当前登录者    已经读与未读
    List<Message> receiveList(String keyword,int status,int type);
    //垃圾箱   收件人是当前登录者   状态是垃圾


    //发件箱  发件人是当前登录者
    List<Message> sendlist(String keyword,int status);

    //草稿箱  发件人是当前登录者  状态是草稿



    int save(Message message);
    int update(Message message);
    int remove(List<Integer> ids);
    Message getById(int id);
}
