package com.ujiuye.crmpro.common.shiro;


import com.ujiuye.crmpro.hr.pojo.Employee;
import com.ujiuye.crmpro.hr.service.EmployeeService;
import com.ujiuye.crmpro.system.pojo.EmployeeRole;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


public class ShiroDbRealm extends AuthorizingRealm {
    @Autowired
    private EmployeeService employeeService;//登录

    public static final String SESSION_USER_KEY = "gray";

    /**
     * 授权查询回调函数, 进行[鉴权]但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {

        Employee employee = (Employee) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        //这里要改读取当前用户的角列表
        List<EmployeeRole> employeeRoleList = employee.getEmployeeRoleList();
        List<String> roles=new ArrayList<>();//admin,user
        for (EmployeeRole employeeRole : employeeRoleList) {
            roles.add(employeeRole.getRole().getName());
        }
        info.addRoles(roles);//加入当前用户权限

        return info;
    }

    /**
     * 认证回调函数，登录信息和用户验证信息验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        // 把token转换成User对象
        Employee userLogin = tokenToUser((UsernamePasswordToken) authcToken);
        // 验证用户是否可以登录
        Employee ui = employeeService.login(userLogin);
        if(ui == null) {
            return null; // 异常处理，找不到数据
        }
        // 设置session
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute(ShiroDbRealm.SESSION_USER_KEY, ui);
        //当前 Realm 的 name
        String realmName = this.getName();
        //登陆的主要信息: 可以是一个实体类的对象, 但该实体类的对象一定是根据 token 的 username 查询得到的.
        Object principal = authcToken.getPrincipal();
        return new SimpleAuthenticationInfo(principal, userLogin.getPassword(), realmName);
    }

    private Employee tokenToUser(UsernamePasswordToken authcToken) {
        Employee employee = new Employee();
        employee.setUsername(authcToken.getUsername());
        employee.setPassword(String.valueOf(authcToken.getPassword()));
        return employee;
    }

}
