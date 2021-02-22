package org.planngo.service;

import org.planngo.domain.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
JavaMailSenderImpl mailSender;  //javaMailSenderImpl root사용
	

@Override
	public void sendEmail(QnaVO qnaVO) {
	
  }
}
