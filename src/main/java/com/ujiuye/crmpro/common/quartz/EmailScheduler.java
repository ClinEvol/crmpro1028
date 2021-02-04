package com.ujiuye.crmpro.common.quartz;

import com.ujiuye.crmpro.message.pojo.EmailExt;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EmailScheduler {
    public static void scheduler(EmailExt emailExt) throws SchedulerException, InterruptedException, ParseException, ParseException {

        long time = new Date().getTime();
        //jobDetail
        JobDetail jobDetail = JobBuilder.newJob(EmailJob.class).withIdentity("emailJob"+time).build();

        //向任务器中动态传参
        jobDetail.getJobDataMap().put("emailExt",emailExt);

        //Scheduler实例
        StdSchedulerFactory stdSchedulerFactory = new StdSchedulerFactory();
        Scheduler scheduler = stdSchedulerFactory.getScheduler();
        scheduler.start();


        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleTrigger simpleTrigger = TriggerBuilder.newTrigger()
                .withIdentity("emailTrigger"+time, "emailGroup")
                .startAt(emailExt.getTime())//设定发送时间
                .withSchedule(
                        SimpleScheduleBuilder.simpleSchedule()
                                .withIntervalInSeconds(3)
                                .withRepeatCount(0))//重复执行的次数，因为加入任务的时候马上执行了，所以不需要重复，否则会多一次。
                .build();
        scheduler.scheduleJob(jobDetail, simpleTrigger);

    }
}
