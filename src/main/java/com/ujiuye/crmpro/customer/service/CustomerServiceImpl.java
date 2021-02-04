package com.ujiuye.crmpro.customer.service;

import com.ujiuye.crmpro.customer.mapper.CustomerMapper;
import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.customer.pojo.CustomerExample;
import com.ujiuye.crmpro.project.mapper.ProjectMapper;
import com.ujiuye.crmpro.project.service.ProjectService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private ProjectService projectService;

    @Override
    public List<Customer> list(int type,String keyword) {
        CustomerExample example=new CustomerExample();
        CustomerExample.Criteria criteria = example.createCriteria();


        if(type==1){//按联系人搜
            criteria.andCompanypersonLike("%"+keyword+"%");
        }
        if(type==2){//按公司名称搜
            criteria.andNameLike("%"+keyword+"%");
        }
        //如果不=1、2的这个example没有条件，就查全部
        return customerMapper.selectByExample(example);
    }

    @Override
    public int save(Customer customer) {
        customer.setAddtime(new Date());
        return customerMapper.insert(customer);
    }

    @Override
    public Customer getById(int id) {
        return customerMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Customer customer) {
        return customerMapper.updateByPrimaryKeySelective(customer);
    }

    @Override
    public List<Integer> remove(List<Integer> ids) {
        List<Integer> remove=new ArrayList<>();//用于保存可以删除的id
        List<Integer> notRemove=new ArrayList<>();//用于保存不可以被删除的id

        CustomerExample example=new CustomerExample();
        CustomerExample.Criteria criteria = example.createCriteria();

        //判断ids哪些是能删除的，哪些是不能删除的
        for (Integer id : ids) {
            //调用projectservice
            int count=projectService.countByCustomerFk(id);
            if(count>0){//说明id在peoject表中有数据，不能删除
                notRemove.add(id);
                continue;
            }
            //上面条件不成立说明id在peoject表中没有数据，可以删除
            remove.add(id);
        }
        if(remove.size()>0){//说明有id可以删除的，执行删除操作
            criteria.andIdIn(remove);
            customerMapper.deleteByExample(example);
        }
        return notRemove;
    }

    @Override
    public void saveList(File excel) throws IOException {

        //先把Excel中的数据读取到一个List中
        List<Customer> customers = excelToList(excel);
        //调用Mapper的批量添加
        customerMapper.saveList(customers);

    }

    //先把Excel中的数据读取到一个List中
    private List<Customer> excelToList(File excel) throws IOException {
        List<Customer> list=new ArrayList<>();
        FileInputStream inputStream = new FileInputStream(excel);
        XSSFWorkbook workbook=new XSSFWorkbook(inputStream);
        XSSFSheet sheet = workbook.getSheetAt(0);
        int rows = sheet.getPhysicalNumberOfRows();
        for(int i=1;i<rows;i++){
            XSSFRow row = sheet.getRow(i);
            String name = row.getCell(0).getStringCellValue();
            String companyperson = row.getCell(1).getStringCellValue();
            String address = row.getCell(2).getStringCellValue();
            String phone = row.getCell(3).getStringCellValue();
            String camera = row.getCell(4).getStringCellValue();
            String present = row.getCell(5).getStringCellValue();
            String remark = row.getCell(6).getStringCellValue();
            list.add(new Customer(name,companyperson,address,phone,camera,present,remark));
        }
        return list;
    }
}
