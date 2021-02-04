package com.ujiuye.crmpro.common.quartz;

import com.ujiuye.crmpro.common.utils.EmailUtils;
import com.ujiuye.crmpro.message.pojo.EmailExt;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class EmailJob implements Job {

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        //获取传入的参数
        JobDataMap data = context.getJobDetail().getJobDataMap();
        EmailExt emailExt=(EmailExt)data.get("emailExt");
        //调用工具类
        EmailUtils.send(emailExt);
    }
}
