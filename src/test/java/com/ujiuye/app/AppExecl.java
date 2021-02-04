package com.ujiuye.app;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AppExecl {

    public static void main(String[] args) throws IOException {
        List<Student> list=new ArrayList();
        list.add(new Student("java1112","jack",12));
        list.add(new Student("java1113","tomer",12));
        list.add(new Student("java1114","lili",12));
        list.add(new Student("java1115","koi",12));
        list.add(new Student("java1116","luxi",12));

        //创建工作簿
        XSSFWorkbook workbook=new XSSFWorkbook();
        //创建工作表
        XSSFSheet sheet = workbook.createSheet("学生数据");
        //创建第一行
        XSSFRow row1 = sheet.createRow(0);
        //设置第一行的每个格子
        row1.createCell(0).setCellValue("学号");
        row1.createCell(1).setCellValue("姓名");
        row1.createCell(2).setCellValue("年龄");
        //遍历数据
        for (int i = 0; i < list.size(); i++) {
            Student student = list.get(i);
            XSSFRow row = sheet.createRow(i+1);
            row.createCell(0).setCellValue(student.getNo());
            row.createCell(1).setCellValue(student.getName());
            row.createCell(2).setCellValue(student.getAge());
        }
        //创建文 件对象
        File file=new File("/Users/ClinEvol/Desktop/work/student.xlsx");
        //通过工作簿对象把数据写到File对象中
        workbook.write(new FileOutputStream(file));
        System.out.println("成功");

    }
}
