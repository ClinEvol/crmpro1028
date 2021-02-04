package com.ujiuye.app;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;


public class EmailSenderTest {

    @Test
    public void sendSimpleEmail(){
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.qq.com");//指定用来发送Email的邮件服务器主机名
        mailSender.setPort(25);//默认端口，标准的SMTP端口
        mailSender.setUsername("563420775@qq.com");//用户名
        mailSender.setPassword("npxhwnqanlslbbfg");//密码/授权码


        SimpleMailMessage message = new SimpleMailMessage();//消息构造器
        message.setFrom("563420775@qq.com");//发件人
        message.setTo("563420775@qq.com");//收件人
        message.setSubject("凌志网络帐号验证");//主题
        message.setText("凌志网络帐号验证:456879");//正文
        mailSender.send(message);
        System.out.println("邮件发送完毕");
    }




    @Test
    public void sendCode() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.qq.com");//指定用来发送Email的邮件服务器主机名
        mailSender.setPort(25);//默认端口，标准的SMTP端口
        mailSender.setUsername("563420775@qq.com");//用户名
        mailSender.setPassword("npxhwnqanlslbbfg");//密码/授权码


        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper helper;
        try {
            helper = new MimeMessageHelper(msg, true,"utf-8");
            helper.setFrom(mailSender.getUsername());
            helper.setTo("563420775@qq.com");
            helper.setSubject("超市订单管理系统号验证");
            //第二个参数true，表示text的内容为html，然后注意<img/>标签，src='cid:file'，'cid'是contentId的缩写，'file'是一个标记，需要在后面的代码中调用MimeMessageHelper的addInline方法替代成文件
            helper.setText(
                    "		<div style='width: 320px; margin: 0 auto; background-color: darkblue; color: white; padding: 20px 40px 40px;'>\r\n" +
                            "			<p style='font-size: 24px;'>以下是您的验证码：</p>\r\n" +
                            "			<p style='font-size: 24px; color: chartreuse;'>445566</p>\r\n" +
                            "			<p>jack，您好！</p>\r\n" +
                            "			<p>我们收到了来自您的超市订单管系统通行证的安全请求。请使用上面的验证码验证您的账号归属</p>\r\n" +
                            "			<p>请注意：该验证码将在10分钟后过期，请尽快验证！</p>\r\n" +
                            "		</div>\r\n",
                    true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }


        mailSender.send(msg);
        System.out.println("邮件发送完毕");
    }


}
