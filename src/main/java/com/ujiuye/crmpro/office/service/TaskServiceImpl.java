package com.ujiuye.crmpro.office.service;

import com.github.pagehelper.PageHelper;
import com.ujiuye.crmpro.common.utils.CurrentUserUtils;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import com.ujiuye.crmpro.office.mapper.TaskMapper;
import com.ujiuye.crmpro.office.pojo.Task;
import com.ujiuye.crmpro.office.pojo.TaskExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskMapper taskMapper;
    @Autowired
    private EmployeeService employeeService;
    @Override
    public Task getById(int id) {
        return taskMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Task> list(int type, String keyword, int pageNum, boolean isMyList) {
        TaskExample example=new TaskExample();
        List<Integer> ids=new ArrayList<>();
        ids.add(0);
        TaskExample.Criteria criteria = example.createCriteria();
        if(isMyList){//查询我的任务列表  我-当前登录者
            Employee currentUser = CurrentUserUtils.getCurrentUser();
            criteria.andEmpFk2EqualTo(currentUser.getId());
        }

        if(type==1){//任务标题
            criteria.andTasktitleLike("%"+keyword+"%");
        }
        if(type==2 || type==3){
            List<Employee> employees = employeeService.listByName(keyword);
            for (Employee employee : employees) {
                ids.add(employee.getId());
            }
        }
        if(type==2){//执行者
            criteria.andEmpFk2In(ids);

        }
        if(type==3){//执行者
            criteria.andEmpFkIn(ids);
        }

        PageHelper.startPage(pageNum,5);
        return taskMapper.selectByExample(example);
    }

    @Override
    public int save(Task task) {
        task.setStatus(0);//代表刚刚分配
        //设定分配任务的人
        Employee currentUser = CurrentUserUtils.getCurrentUser();
        task.setEmpFk(currentUser.getId());

        return taskMapper.insert(task);
    }

    @Override
    public int update(Task task) {
        return taskMapper.updateByPrimaryKeySelective(task);
    }

    @Override
    public int remove(List<Integer> ids) {
        TaskExample example=new TaskExample();
        TaskExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return taskMapper.deleteByExample(example);
    }
}
