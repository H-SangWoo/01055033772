package org.planngo.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.planngo.domain.UsrVO;

import org.planngo.dto.LoginDTO;

public interface UserService {
	
	public UsrVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String USRID, String sessionId, Date next)throws Exception;
	
	public UsrVO checkLoginBefore(String value) throws Exception;
	
	public void usrRegister(UsrVO userVO) throws Exception;

	public int idChk(String USRID) throws Exception;

	//public int idChk(UsrVO userVO) throws Exception;

	public void memberDelete(UsrVO userVO) throws Exception;
	
	public void memberUpdate(UsrVO userVO) throws Exception;
	//비번찾기 
	public void sendEmail(UsrVO userVO, String div) throws Exception;
	// qna
	public void sendEmail(HttpServletRequest request);
	
	public void findPw(HttpServletResponse resp, UsrVO usrVO) throws Exception;
	
	public UsrVO readUser(String USRID) throws Exception;



}
