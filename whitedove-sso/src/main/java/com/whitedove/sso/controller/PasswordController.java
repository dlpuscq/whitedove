package com.whitedove.sso.controller;

import com.whitedove.common.utils.ExceptionUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbUserMapper;
import com.whitedove.pojo.TbUser;
import com.whitedove.pojo.TbUserExample;
import com.whitedove.sso.mail.MailSender;
import com.whitedove.sso.service.PasswordService;
import com.whitedove.sso.utils.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/29 14:46
 */
@Controller
public class PasswordController {


    @Autowired
    private PasswordService passwordService;
    @Autowired
    private TbUserMapper tbUserMapper;

    @RequestMapping(value="/forgetpwd", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult forgetPwd( String email, String registerCode,
                                     HttpServletRequest request, HttpServletResponse response) {
        String code = request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY).toString().toUpperCase();
        if(!registerCode.toUpperCase().equals(code)){
            return WhiteDoveResult.build(400,"验证码错误");
        }
        try {
            WhiteDoveResult result = passwordService.checkPwd(email);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return WhiteDoveResult.build(400, ExceptionUtil.getStackTrace(e));
        }
    }

    @RequestMapping(value="/sendEmailRegister", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult sendEmailRegister(String email) {
        TbUserExample example = new TbUserExample();
        TbUserExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);
        List<TbUser> user = tbUserMapper.selectByExample(example);
        String username = user.get(0).getUsername();
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring/applicationContext-mail.xml");
        MailSender sender = (MailSender)ac.getBean("MailSender");
        SimpleMailMessage mail = new SimpleMailMessage();
        mail.setTo(email);//收件人邮箱地址

        double v = Math.random() * 9000 + 1000;
        DecimalFormat df = new DecimalFormat("#");
        String code = df.format(v);
        mail.setFrom("754843074@qq.com");//发件人
        mail.setSubject("【小白鸽】找回密码验证");//主题
        String s = "Hey," + username + "  " + "您找回密码的验证码是： " + code;
        mail.setText(s);//正文
        sender.send(mail);
        return WhiteDoveResult.ok(code);
    }

    @RequestMapping(value="/verifyEmail", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult verifyEmail(String captcha,String email,String emailSign) {
        if (captcha.equals(emailSign)){
            return WhiteDoveResult.ok();
        }else {
            return WhiteDoveResult.build(400,"验证码错误");
        }
    }
    @RequestMapping(value="/resetPassword", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult resetPassword(String loginPassword,String email,String reloginPassword) {
        TbUserExample example = new TbUserExample();
        TbUserExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);
        List<TbUser> user = tbUserMapper.selectByExample(example);
        TbUser user0 = user.get(0);
        user0.setUpdated(new Date());
        user0.setPassword(DigestUtils.md5DigestAsHex(loginPassword.getBytes()));
        tbUserMapper.updateByExample(user0,example);
        return WhiteDoveResult.ok(email);
    }
}
