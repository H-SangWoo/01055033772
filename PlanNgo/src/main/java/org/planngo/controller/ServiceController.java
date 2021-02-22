package org.planngo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import javax.mail.internet.MimeMessage;

import org.planngo.domain.faqSearchCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/service")
public class ServiceController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);


	  @RequestMapping(value = "/termsOfService", method = RequestMethod.GET) 
	  public void termsOfServicePage() {
		  
	  }
	  
	  @RequestMapping(value = "/privacyStatement", method = RequestMethod.GET) 
	  public void privacyStatementPage() {
		  
	  }

}
