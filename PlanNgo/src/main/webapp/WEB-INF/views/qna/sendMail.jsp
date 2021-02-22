<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.planngo.service.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
    buffer.append("성함 : ");
    buffer.append(name+"");    
	buffer.append("연락처 : ");
    buffer.append(number+"");
    buffer.append("이메일 : ");
    buffer.append(email+""); 
    buffer.append("제목 : ");
    buffer.append(subject+"");
    buffer.append("내용 : ");
    buffer.append(content+"");
    
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('Send Mail Failed..');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}
 
out.println("<script>alert('메일 전송 완료! 2~3일내로 답변메일이 도착합니다! ^^');location.href='qna.do';</script>");
// 성공 시
%>