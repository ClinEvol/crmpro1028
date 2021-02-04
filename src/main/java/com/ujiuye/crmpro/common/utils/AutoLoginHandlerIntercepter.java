package com.ujiuye.crmpro.common.utils;

import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AutoLoginHandlerIntercepter implements HandlerInterceptor {
    @Autowired
    private EmployeeService employeeService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated() && subject.isRemembered()) {
            Object principal = subject.getPrincipal();
            if (null != principal) {
                Employee employee =  employeeService.getByUserName(String.valueOf(principal));
                String password = employee.getPassword();
                UsernamePasswordToken token = new UsernamePasswordToken(employee.getUsername(), password);
                token.setRememberMe(true);
                subject.login(token);//登录
                return true;
            }
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
