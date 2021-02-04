package com.ujiuye.crmpro.hr.controller;

import com.alibaba.fastjson.JSON;
import com.ujiuye.crmpro.hr.pojo.Position;
import com.ujiuye.crmpro.hr.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/hr/position")
public class PositionController {
    @Autowired
    private PositionService positionService;
    @RequestMapping("listJSONByDeptFk")
    @ResponseBody
    public String listJSONByDeptFk(int dept_fk){
        List<Position> positions = positionService.listByDeptFk(dept_fk);
        return JSON.toJSONString(positions);
    }
}
