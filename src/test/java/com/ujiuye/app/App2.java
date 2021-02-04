package com.ujiuye.app;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class App2 {
    public static void main(String[] args) throws IOException {
        List<Student> list=new ArrayList<>();

        File file=new File("/Users/ClinEvol/Desktop/work/student.xlsx");
        FileInputStream inputStream=new FileInputStream(file);

        //通过这个输入流对象创建工作簿
        XSSFWorkbook workbook=new XSSFWorkbook(inputStream);
        //通过下标获取工作簿中的表  下标从0天始
        XSSFSheet sheet = workbook.getSheetAt(0);
        //获取表中有多少行数据
        int rows = sheet.getPhysicalNumberOfRows();
        //循环读取表  第一行是表头，不用读取，所i从1开始
        for(int i=1;i<rows;i++){
            XSSFRow row = sheet.getRow(i);//获取第i行
            //获取这一行的第一个单元格
            //读取字符串getString
            String no = row.getCell(0).getStringCellValue();
            String  name= row.getCell(1).getStringCellValue();
            //读取数字类型getNumeric
            double age = row.getCell(2).getNumericCellValue();
            list.add(new Student(no,name,(int)age));

        }
        System.out.println(list);
    }
}
