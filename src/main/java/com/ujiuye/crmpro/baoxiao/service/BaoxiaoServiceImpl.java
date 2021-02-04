package com.ujiuye.crmpro.baoxiao.service;

import com.ujiuye.crmpro.baoxiao.mapper.BaoxiaoMapper;
import com.ujiuye.crmpro.baoxiao.pojo.Baoxiao;
import com.ujiuye.crmpro.baoxiao.pojo.BaoxiaoExample;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BaoxiaoServiceImpl implements BaoxiaoService {
    @Autowired
    private BaoxiaoMapper baoxiaoMapper;
    @Autowired
    private EmployeeService employeeService;

    @Override
    public List<Baoxiao> list(int type, String keyword, int status) {
        BaoxiaoExample example=new BaoxiaoExample();
        BaoxiaoExample.Criteria criteria = example.createCriteria();
        if(type==1){//订单号
            criteria.andBxidLike("%"+keyword+"%");
        }
        if(type==2){//申请人
            List<Employee> employees = employeeService.listByName("%" + keyword + "%");
            List<Integer> ids=new ArrayList<>();
            ids.add(0);
            if(employees!=null && employees.size()>0){
                for (Employee employee:employees){
                    ids.add(employee.getId());
                }
            }
            criteria.andEmpFkIn(ids);
        }
        //报销的状态
        criteria.andBxstatusEqualTo(status);
        return baoxiaoMapper.selectByExample(example);
    }

    @Override
    public List<Baoxiao> mylist(String keyword, int emp_fk) {
        BaoxiaoExample example=new BaoxiaoExample();
        BaoxiaoExample.Criteria criteria = example.createCriteria();
        criteria.andEmpFkEqualTo(emp_fk);//申请人，当前登者
        //订单号
        if(keyword!=null && !keyword.equals("")){
            criteria.andBxidLike("%"+keyword+"%");
        }
        return baoxiaoMapper.selectByExample(example);
    }

    @Override
    public int update(Baoxiao baoxiao) {
        return baoxiaoMapper.updateByPrimaryKeySelective(baoxiao);
    }

    @Override
    public int save(Baoxiao baoxiao) {
        return baoxiaoMapper.insert(baoxiao);
    }

    @Override
    public int remove(String bxid) {
        return baoxiaoMapper.deleteByPrimaryKey(bxid);
    }

    @Override
    public Baoxiao getById(String bxid) {
        return baoxiaoMapper.selectByPrimaryKey(bxid);
    }
}
