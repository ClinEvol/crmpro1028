package com.ujiuye.crmpro.hr.service;

import com.github.pagehelper.PageHelper;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.common.utils.UUIDUtils;
import com.ujiuye.crmpro.hr.mapper.ArchivesMapper;
import com.ujiuye.crmpro.hr.pojo.Archives;
import com.ujiuye.crmpro.hr.pojo.ArchivesExample;
import com.ujiuye.crmpro.hr.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class ArchivesServiceImpl implements ArchivesService {
    @Autowired
    private ArchivesMapper archivesMapper;
    @Autowired
    private EmployeeService employeeService;

    @Override
    public Archives getByEmployeeFk(int employee_fk) {
        ArchivesExample example=new ArchivesExample();
        ArchivesExample.Criteria criteria = example.createCriteria();
        criteria.andEmployeeFkEqualTo(employee_fk);
        List<Archives> archives = archivesMapper.selectByExample(example);
        if(archives!=null && archives.size()>0){
            return archives.get(0);
        }
        return null;
    }

    @Override
    public int update(Archives archives) {
        //在修改之前，查出原本的图片名称，保存起来
        Archives archivesOld = archivesMapper.selectByPrimaryKey(archives.getNo());
        int result=archivesMapper.updateByPrimaryKeySelective(archives);
        //修改成功，并且头有修改
//        if(result>0 && !archivesOld.getPath().equals(archives.getPath())){
//            //执行删除图片文件
//            String dir="/Users/ClinEvol/Workspaces/IdeaProjects/crmpro1028/src/main/webapp/";
//            MyFileUtils.deleteFile(dir,archivesOld.getPath());
//        }
        return result;
    }

    @Override
    public int save(Archives archives) {
        archives.setNo(UUIDUtils.getUUID());
        return archivesMapper.insert(archives);
    }

    @Override
    public int remove(List<String> ids) {
        ArchivesExample example=new ArchivesExample();
        ArchivesExample.Criteria criteria = example.createCriteria();
        criteria.andNoIn(ids);
        return archivesMapper.deleteByExample(example);
    }

    @Override
    public List<Archives> list(int type, String keyword, int pageNum) {
        ArchivesExample example=new ArchivesExample();
        ArchivesExample.Criteria criteria = example.createCriteria();

        if(type==1){//员工姓名
            List<Integer> ids=new ArrayList<>();
            ids.add(0);
            List<Employee> employees = employeeService.listByName(keyword);
            for (Employee employee : employees) {
                ids.add(employee.getId());
            }
            criteria.andEmployeeFkIn(ids);
        }

        keyword="%"+keyword+"%";
        if(type==2){//邮箱
            criteria.andEmailLike(keyword);
        }
        if(type==3){//毕业院校
            criteria.andSchoolLike(keyword);
        }
        if(type==4){//专业
            criteria.andMajorLike(keyword);
        }
        PageHelper.startPage(pageNum,5);
        return archivesMapper.selectByExample(example);
    }
}
