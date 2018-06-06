package com.whitedove.sso.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/29 16:08
 */

public class MailSender {
    @Autowired
    private JavaMailSender mailSender;
    public void send(SimpleMailMessage mail){
        mailSender.send(mail);
    }
}