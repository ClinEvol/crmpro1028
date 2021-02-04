package com.ujiuye.crmpro.office.service;

import com.ujiuye.crmpro.office.pojo.Task;

import java.util.List;

public interface TaskService {
    Task getById(int id);
    List<Task> list(int type,String keyword,int pageNum,boolean isMyList);
    int save(Task task);
    int update(Task task);
    int remove(List<Integer> ids);
}
