package com.ujiuye.crmpro.customer.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.customer.service.CustomerService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

/**
 * 客户信息管理只有程序员或项目经理才能访问，所有要加/programmer/
 */
@Controller
@RequestMapping("/programmer/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "type",required = false,defaultValue = "0")int type,
                       @RequestParam(value = "keyword",required = false,defaultValue = "")String keyword)
    {
        //设置分页
        PageHelper.startPage(pageNum,5);
        //查询
        List<Customer> list = customerService.list(type,keyword);
        //创建分页对象
        PageInfo<Customer> page=new PageInfo<>(list);
        //把分页对象存到域中
        model.addAttribute("page",page);
        return "list-customer";
    }

    @RequestMapping("/tosave")
    public String tosave(){
        return "save-customer";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(Customer customer){
        try {
            int result = customerService.save(customer);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/toupdate")
    public String toupdate(Model model,int id){
        Customer customer = customerService.getById(id);
        model.addAttribute("customer",customer);
        return "update-customer";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Customer customer){
        try {
            int result = customerService.update(customer);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer[] ids){
        //把数组转为集
        List<Integer> remove = Arrays.asList(ids);
        //调用service得到不能被删除的id集合
        List<Integer> notRemove = customerService.remove(remove);
        if(notRemove.size()==0){//没有不能被删除的，说明【全部都删除】了
            return "true";
        }
        //要删除的个数与不能被删除的个数是一样的，说明【全部删除失败】
        if(remove.size()==notRemove.size()){
            return "false";
        }
        //以上条件都不成立，说明是部分删除成功，把不能删除的id返回给前台
        return notRemove.toString();

    }



    @RequestMapping("/show")
    public String show(Model model,int id){
        Customer customer = customerService.getById(id);
        model.addAttribute("customer",customer);
        return "show-customer";
    }


    @RequestMapping("/listJSON")
    @ResponseBody
    public String listJSON(){
        //查询全部数据
        List<Customer> list = customerService.list(0, null);
        return JSON.toJSONString(list);
    }


    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum){
       //1.查数据
        PageHelper.startPage(pageNum,5);
        List<Customer> list = customerService.list(0,"");
        PageInfo<Customer> page=new PageInfo<>(list);
        //2.把数据写到Excel文件
        File file = ListToExcel(page.getList(), pageNum);
        // 3.把Execl下载到本地
        if(file==null){
            return null;
        }
        return MyFileUtils.download(file.getName(),null);
    }

    //把数据写到Excel文件
    private File ListToExcel(List<Customer> list,int pageNum){
        //创建文 件对象
        String path=MyFileUtils.getUploadPath();
        File file=new File(path+"客户信息第"+pageNum+"页.xlsx");
        //创建工作簿
        XSSFWorkbook workbook=new XSSFWorkbook();
        //创建工作表
        XSSFSheet sheet = workbook.createSheet("客户信息");
        //创建第一行
        XSSFRow rowHeader = sheet.createRow(0);
        rowHeader.createCell(0).setCellValue("ID");
        rowHeader.createCell(1).setCellValue("公司名称");
        rowHeader.createCell(2).setCellValue("联系人");
        rowHeader.createCell(3).setCellValue("地址");
        rowHeader.createCell(4).setCellValue("电话");
        rowHeader.createCell(5).setCellValue("座机");
        rowHeader.createCell(6).setCellValue("简介");
        rowHeader.createCell(7).setCellValue("备注");
        rowHeader.createCell(8).setCellValue("添加时间");
        //处理时间
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        //遍历数据
        for (int i = 0; i < list.size(); i++) {
            Customer customer = list.get(i);
            XSSFRow row = sheet.createRow(i+1);
            row.createCell(0).setCellValue(customer.getId());
            row.createCell(1).setCellValue(customer.getName());
            row.createCell(2).setCellValue(customer.getCompanyperson());
            row.createCell(3).setCellValue(customer.getAddress());
            row.createCell(4).setCellValue(customer.getPhone());
            row.createCell(5).setCellValue(customer.getCamera());
            row.createCell(6).setCellValue(customer.getPresent());
            row.createCell(7).setCellValue(customer.getRemark());
            row.createCell(8).setCellValue(format.format(customer.getAddtime()));
        }
        //把数据写入到文件对象中
        try {
            workbook.write(new FileOutputStream(file));
            return file;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }


    @RequestMapping("/upload")
    @ResponseBody
    public String upload(@RequestParam("myfile") MultipartFile myfile){
        File file = MyFileUtils.uploadFile(myfile, null);
        if(file==null){
            return "error";
        }
        try {
            customerService.saveList(file);
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/toupload")
    public String toupload(){
        return "save-customerforfile";
    }


}
