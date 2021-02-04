package com.ujiuye.crmpro.common.utils;

import java.util.UUID;

/**
 * UUID 是 通用唯一识别码（Universally Unique Identifier）的缩写，是一种软件建构的标准
 */
public class UUIDUtils {
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

}
