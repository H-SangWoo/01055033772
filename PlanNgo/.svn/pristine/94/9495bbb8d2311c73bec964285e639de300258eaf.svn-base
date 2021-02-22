package org.planngo.service;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.mail.HtmlEmail;

import org.planngo.domain.UsrVO;

import org.planngo.dto.LoginDTO;
import org.planngo.mapper.UserMapper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserMapper userMapper;
	
	@Override
	public UsrVO login(LoginDTO dto) throws Exception {
		
		return userMapper.login(dto);
	}

	@Override
	public void keepLogin(String USRID, String sessionId, Date next) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("USRID", USRID);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		userMapper.keepLogin(USRID, sessionId, next);
		
	}

	@Override
	public UsrVO checkLoginBefore(String value) throws Exception {
		
		return userMapper.checkUserWithSessionKey(value);
	}
	
	@Override
	public void usrRegister(UsrVO usrVO) throws Exception {		
		userMapper.register(usrVO);
	}

	  @Override 
	  public int idChk(String USRID) throws Exception { 
		  
		  int result =  userMapper.idChk(USRID);
		  
		return result; 
		  }
	 
		
		 /* @Override public int idChk(UsrVO usrVO) throws Exception { 
			  int result = userMapper.idChk(usrVO);
		  
		  return result; 
		  }
		 */
	
	@Override
	public void memberDelete(UsrVO usrVO) throws Exception {
		userMapper.delete(usrVO);
	}
	
	@Override
	public void memberUpdate(UsrVO usrVO) throws Exception {
		userMapper.update(usrVO);
	}
	
	@Override
	public UsrVO readUser(String USRID) throws Exception{
		return userMapper.readUser(USRID);
		
	}
	
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(UsrVO usrVO, String div) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "wndud7965@naver.com";
		String hostSMTPpwd = "qlalfqjsgh6736";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "wndud7965@naver.com";
		String fromName = "박주영";
		String subject = "";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "안녕하세요? Plan N Go 인증메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += usrVO.getUSRID() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += usrVO.getUSRPASSWORD() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = usrVO.getUSREMAIL();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); 

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
		//qna
	@Override
	public void sendEmail(HttpServletRequest request) {
		
	}
	
	//비밀번호찾기
	public void findPw(HttpServletResponse response, UsrVO usrVO) throws Exception {
	
	}
	
	
}
