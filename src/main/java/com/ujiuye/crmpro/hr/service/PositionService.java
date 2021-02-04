package com.ujiuye.crmpro.hr.service;

import com.ujiuye.crmpro.hr.pojo.Position;

import java.util.List;

public interface PositionService {
    List<Position> listByDeptFk(int dept_fk);
}
