package com.ujiuye.crmpro.common.utils;

import com.ujiuye.crmpro.common.shiro.ShiroDbRealm;
import com.ujiuye.crmpro.hr.pojo.Employee;
import org.apache.shiro.SecurityUtils;

public class CurrentUserUtils {
    public static Employee getCurrentUser(){
        return (Employee) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);
    }
}
