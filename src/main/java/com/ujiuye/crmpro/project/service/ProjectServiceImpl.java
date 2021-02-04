package com.ujiuye.crmpro.project.service;

import com.github.pagehelper.PageHelper;
import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.customer.service.CustomerService;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.pojo.EmployeeExample;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import com.ujiuye.crmpro.project.mapper.ProjectMapper;
import com.ujiuye.crmpro.project.pojo.Project;
import com.ujiuye.crmpro.project.pojo.ProjectExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private EmployeeService employeeService;

    @Override
    public int countByCustomerFk(int customer_fk) {
        ProjectExample example=new ProjectExample();
        ProjectExample.Criteria criteria = example.createCriteria();
        criteria.andCustomerFkEqualTo(customer_fk);
        int count=projectMapper.countByExample(example);
        return count;
    }

    @Override
    public List<Project> list(int type,String keyword,int pageNum) {
        ProjectExample example=new ProjectExample();
        ProjectExample.Criteria criteria = example.createCriteria();
        List<Integer> ids=new ArrayList<>();
        ids.add(0);//防止没有数据出现常

        if(type==1){//项目名称
            criteria.andNameLike("%"+keyword+"%");
        }
        List<Customer> list=null;
        if(type==2 ){//客户公司名称
            list = customerService.list(2, keyword);
        }

        if(type==3){//客户方负责人
            list = customerService.list(1, keyword);
        }
        if(type==2 ||type==3){
            //把查到的集合的数据提取id到ids里面
            for (Customer customer : list) {
                ids.add(customer.getId());
            }
            //数据库对应的字段customer_fk
            criteria.andCustomerFkIn(ids);
        }


        if(type==4){//项目经理
            List<Employee> employees = employeeService.listPMByName(keyword);
            //把查到的集合的数据提取id到ids里面
            for (Employee employee : employees) {
                ids.add(employee.getId());
            }
            //数据库对应的字段employee_fk
            criteria.andEmployeeFkIn(ids);
        }

        //本方法中就要执行多条sql语句，设置分页 分面只对第一条Sql起效，如果在controller设置，那么它只对controller中的第一条sql语句
        PageHelper.startPage(pageNum,5);
        return projectMapper.selectByExample(example);
    }

    @Override
    public List<Project> list() {
        return projectMapper.selectByExample(null);
    }

    @Override
    public List<Project> listByName(String name) {
        ProjectExample example=new ProjectExample();
        ProjectExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike("%"+name+"%");
        return projectMapper.selectByExample(example);
    }

    @Override
    public int save(Project project) {
        return projectMapper.insert(project);
    }

    @Override
    public Project getById(int id) {
        return projectMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Project project) {
        return projectMapper.updateByPrimaryKeySelective(project);
    }
}
