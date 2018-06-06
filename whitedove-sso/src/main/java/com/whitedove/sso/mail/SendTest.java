package com.whitedove.sso.mail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;

import java.security.GeneralSecurityException;


/**
 * @description
 * @autoor Songcq
 * @date 2018/5/29 16:08
 */
public class SendTest {

    public static void main(String[] args) throws GeneralSecurityException {
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring/applicationContext-mail.xml");
        MailSender sender = (MailSender)ac.getBean("MailSender");
        SimpleMailMessage mail = new SimpleMailMessage();
        mail.setTo("dlpuscq@163.com");//收件人邮箱地址
        mail.setFrom("754843074@qq.com");//发送人人
        mail.setSubject("spring自带javamail发送的邮件");//主题
        mail.setText("hello this mail is from spring javaMail ");//正文
        sender.send(mail);
    }
}