package com.ujiuye.crmpro.common.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator
 */
public class DateConveter implements Converter<String,Date> {

    @Override
    public Date convert(String createtime) {
        if(createtime.equals("")){
            return null;
        }
        SimpleDateFormat simpleDateFormat =null;
        String partten="";
        if(createtime.contains("/")) {
            partten="yyyy/MM/dd";
        }else {
            partten="yyyy-MM-dd";
        }
        if(createtime.contains(":")){
            partten+=" HH:mm:ss";
        }
        simpleDateFormat = new SimpleDateFormat(partten);
        try {
            // 转成直接返回
            return simpleDateFormat.parse(createtime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        // 如果参数绑定失败返回null
        return null;
    }
}

