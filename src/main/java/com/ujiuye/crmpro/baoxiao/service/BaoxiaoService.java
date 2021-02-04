package com.ujiuye.crmpro.baoxiao.service;

import com.ujiuye.crmpro.baoxiao.pojo.Baoxiao;

import java.util.List;

public interface BaoxiaoService {
    /**
     * 财务-报销列表
     * @param type 搜索类型   1，订单号  2，申请人
     * @param keyword  搜索内容
     * @param status  报销的状态
     * @return
     */
    List<Baoxiao> list(int type, String keyword, int status);

    /**
     * 我的报销
     * @param keyword  订单号
     * @param emp_fk  申请人，当前登者
     * @return
     */
    List<Baoxiao> mylist(String keyword, int emp_fk);
    //修改-审批（同意-驳回）-付款
    int update(Baoxiao baoxiao);
    //申请
    int save(Baoxiao baoxiao);
    //撒消
    int remove(String bxid);
    //查看
    Baoxiao getById(String bxid);
}
