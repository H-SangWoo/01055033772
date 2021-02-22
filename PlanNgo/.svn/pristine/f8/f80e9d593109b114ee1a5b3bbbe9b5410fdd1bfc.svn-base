package org.planngo.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.planngo.domain.QnaVO;
import org.planngo.service.SMTPAuthenticator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/qna")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

@Autowired
JavaMailSenderImpl mailSender; 

@RequestMapping(value = "/qna", method = RequestMethod.GET) 
public void qnaGET() {
 
}

@RequestMapping(value = "/qnaMailForm", method = RequestMethod.GET)
public void write() {
	
}

@RequestMapping(value = "/qnaMailForm",  method = RequestMethod.POST)
public String send(@ModelAttribute QnaVO qnaVO, HttpServletRequest request, Model model ) throws AddressException, MessagingException, UnsupportedEncodingException{
	
	request.setCharacterEncoding("utf-8");
	 
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String company = request.getParameter("company");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email"); 
	String number = request.getParameter("number");
	// 입력값 받음
	 
	Properties p = new Properties(); // 정보를 담을 객체
	 
	p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
	 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들
	 
	try{
	    Authenticator auth = new SMTPAuthenticator();
	    Session ses = Session.getInstance(p, auth);
	     
	    ses.setDebug(true);
	     
	    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
	    msg.setSubject(subject); // 제목
	    
	    StringBuffer buffer = new StringBuffer();
	    buffer.append("제목 : ");
	    buffer.append(subject+"  ");
	    buffer.append("/성함 : ");
	    buffer.append(name+"   ");    
		buffer.append("/연락처 : ");
	    buffer.append(number+"   ");
	    buffer.append("/이메일 : ");
	    buffer.append(email+"   "); 
	    buffer.append("/내용 : ");
	    buffer.append(content+"   ");
	    
	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr); // 보내는 사람
	     
	    Address toAddr = new InternetAddress(to);
	    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
	     
	    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용과 인코딩
	     
	    Transport.send(msg); // 전송
	    //model.addAttribute("message", "emailSuccess"); 
	   
	} catch(Exception e){
	    e.printStackTrace();
	    
	}
	return "redirect:/qna/qna";
}

}
