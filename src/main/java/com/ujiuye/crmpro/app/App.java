package com.ujiuye.crmpro.app;

import java.io.File;

public class App {
    public static void main(String[] args) {
        //设定为当前文件夹
        File directory = new File("");
        //获取绝对路径
        String absolutePath = directory.getAbsolutePath();
        String uploadPath=absolutePath+"/src/main/webapp/upload/";
        System.out.println(uploadPath);

    }
}
