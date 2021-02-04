package com.ujiuye.crmpro.customer.service;

import com.ujiuye.crmpro.customer.pojo.Customer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface CustomerService {
    List<Customer> list(int type,String keyword);
    int save(Customer customer);

    Customer getById(int id);
    int update(Customer customer);

    /**
     *
     * @param ids 要被删除的id集合
     * @return 不能被删的id集合
     */
    List<Integer> remove(List<Integer> ids);


    void saveList(File excel) throws IOException;
}
