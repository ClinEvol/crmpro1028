package com.ujiuye.crmpro.indexvalue.service;


import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;

import java.util.List;

public interface DatacollectService {
   List<Datacollect> list(String keyword);
}
