package com.ujiuye.crmpro.hr.service;

import com.ujiuye.crmpro.common.utils.MD5Utils;
import com.ujiuye.crmpro.common.utils.PinyinRec;
import com.ujiuye.crmpro.hr.mapper.EmployeeMapper;
import com.ujiuye.crmpro.hr.pojo.Archives;
import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.pojo.EmployeeExample;
import com.ujiuye.crmpro.system.pojo.EmployeeRole;
import com.ujiuye.crmpro.system.service.EmployeeRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private EmployeeRoleService employeeRoleService;
    @Autowired
    private ArchivesService archivesService;

    @Override
    public List<Employee> list() {
        return employeeMapper.selectByExample(null);
    }

    @Override
    public List<Employee> listByDept(int dept_no) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andDeptFkEqualTo(dept_no);
        return employeeMapper.selectByExample(example);
    }


    @Override
    public List<Employee> listPMByName(String name) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike("%"+name+"%");
        criteria.andPositionFkEqualTo(4);//项目经理的职位id为4
        return employeeMapper.selectByExample(example);
    }

    @Override
    public List<Employee> listByName(String name) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike("%"+name+"%");
        return employeeMapper.selectByExample(example);
    }


    @Override
    public Employee login(Employee employee) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(employee.getUsername());
        //把用户输入的内容加密再和数据库判断
        criteria.andPasswordEqualTo(MD5Utils.md5(employee.getPassword()));
        List<Employee> employees = employeeMapper.selectByExample(example);
        if(employees!=null && employees.size()>0){//查到数据
            return employees.get(0);//用户是唯一的，所以查到也只是有一条数据
        }
        //用户密码不正确，查不到数据
        return null;
    }

    @Override
    public List<Employee> list(int type, String keyword) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        if(type==1){//姓名
            criteria.andNameLike("%"+keyword+"%");
        }
        if(type==2){//电话
            criteria.andTelephoneLike("%"+keyword+"%");
        }
        if(type==3){//入职时间
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
            try {
                criteria.andHiredateEqualTo(format.parse(keyword));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return employeeMapper.selectByExample(example);
    }

    @Override
    public int update(Employee employee) {
        return 0;
        //角色怎么修改（难点）
    }

    @Override
    public int save(Employee employee,String roles) {
        //设定默认密码
        employee.setPassword(MD5Utils.md5("123456"));
        if(employee.getUsername()==null || employee.getUsername().equals("")){
            //用户名使用默认的  拼音首字母+数字   规则是自定义，可以使用其算法
            String pinYinHeadChar = PinyinRec.getPinYinHeadChar(employee.getName());
            SimpleDateFormat format=new SimpleDateFormat("yyMMdd");
            String date = format.format(new Date());
            String random = String.valueOf(Math.random()).substring(3, 6);
            employee.setUsername(pinYinHeadChar+date+random);
        }
        //执行添加
        employeeMapper.insert(employee);
        int employeeId=employee.getId();//获取添加到数据中之的id
        //添加角色     1,2,4,5
        String[] split = roles.split(",");
        List<EmployeeRole> list=new ArrayList<>();
        for(int i=0;i<split.length;i++){
            EmployeeRole er=new EmployeeRole();
            er.setRoleFk(Integer.parseInt(split[i]));
            er.setEmployeeFk(employeeId);
            list.add(er);
        }
        employeeRoleService.save(list);
        //添加员工时添加一个空的档案
        Archives archives=new Archives();
        archives.setEmployeeFk(employeeId);
        archivesService.save(archives);

        return 1;
    }

    @Override
    public Employee getById(int id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int remove(List<Integer> ids) {
        return 0;
    }

    @Override
    public Employee getByUserName(String name) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(name);
        List<Employee> list = employeeMapper.selectByExample(example);
        if(list!=null && list.size()>0){
            return list.get(0);
        }
        return null;
    }


}
