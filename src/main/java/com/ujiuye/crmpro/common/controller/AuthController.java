package com.ujiuye.crmpro.common.controller;

import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 认证
 */
@Controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/tologin")
    public String tologin(){
        return "login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(Employee employee, String code, HttpSession session){
        //校验验证码
        String sysCode=(String)session.getAttribute("CODE");
//        if(!code.equals(sysCode)){
//            return "error";
//        }

        //把原本直接调用service的代码换成使用shiro登录的代码

        //读取缓存
       Subject subject = SecurityUtils.getSubject();
//        if (subject.isAuthenticated()) {
//            return "true";
//        }

        // 组装token，用户名,密码
        UsernamePasswordToken token = new UsernamePasswordToken(employee.getUsername(), employee.getPassword().toCharArray(), null);
        token.setRememberMe(true);
        // shiro登陆验证
        try {
            subject.login(token);
            return "true";
        } catch (UnknownAccountException ex) {
            return "false";
        } catch (IncorrectCredentialsException ex) {
            return "false";
        } catch (AuthenticationException ex) {
            return "false"; // 自定义报错信息
        } catch (Exception ex) {
            ex.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //使用shiro的退出代码
        org.apache.shiro.subject.Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            try{
                subject.logout();
            }catch(Exception ex){
            }
        }
        response.sendRedirect("/auth/tologin");
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(){
        return "500";
    }
}
