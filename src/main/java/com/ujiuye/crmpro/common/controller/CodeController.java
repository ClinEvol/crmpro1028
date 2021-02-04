package com.ujiuye.crmpro.common.controller;

import com.ujiuye.crmpro.common.utils.VerificationCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class CodeController {

    @RequestMapping("/logincode")
    public void createCode(HttpServletRequest request, HttpServletResponse response) {
        VerificationCode.getVerificationCode(request, response);
    }

}
