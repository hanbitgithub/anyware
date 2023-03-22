package com.aw.anyware.member;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.aw.anyware.member.controller.MemberController;
import com.aw.anyware.member.model.vo.Member;
/**
 * @author Crunchify.com
 * 
 */
public class CrunchifyJavaMailExample {
    static Properties mailServerProperties;
    static Session getMailSession;
    static MimeMessage generateMailMessage;
    
    
    //public static void main(String args[]) throws AddressException, MessagingException {
        //generateAndSendEmail();
        //System.out.println("\n\n ===> Your Java Program has just sent an Email successfully. Check your email..");
    //}
    public static String generateAndSendEmail(Member m, String code) throws AddressException, MessagingException {
        // Step1
        System.out.println("\n 1st ===> setup Mail Server Properties..");
        System.out.println("crunch : " + m);
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");
        System.out.println("Mail Server Properties have been setup successfully..");
        // Step2
        System.out.println("\n\n 2nd ===> get Mail Session..");
        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        generateMailMessage = new MimeMessage(getMailSession);
        generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(m.getEmail()));
        generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("test2@crunchify.com"));
        generateMailMessage.setSubject("테스트 메일입니다");
        String emailBody = "아이디 찾기입니다. \n다음 코드를 입력해주세요. \n 코드 : " + code + " qq회사 인사부";
        generateMailMessage.setContent(emailBody, "text/html");
        System.out.println("Mail Session has been created successfully..");
        // Step3
        System.out.println("\n\n 3rd ===> Get Session and Send mail");
        Transport transport = getMailSession.getTransport("smtp");
        // Enter your correct gmail UserID and Password
        // if you have 2FA enabled then provide App Specific Password
        transport.connect("smtp.gmail.com", "quaz6904@gmail.com", "ucvh nqmh wpub dhnt");
        transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
        transport.close();
       
		return code;
    }
}