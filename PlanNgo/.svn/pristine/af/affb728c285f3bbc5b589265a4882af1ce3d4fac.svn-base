package org.planngo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.planngo.domain.PageMaker;
import org.planngo.domain.UsrVO;
import org.planngo.domain.faqSearchCriteria;
import org.planngo.domain.faqVO;
import org.planngo.service.faqService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/faq/*")
public class faqController {

  private static final Logger logger = LoggerFactory.getLogger(faqController.class);

  @Inject
  private faqService faqService;

	  @RequestMapping(value = "/faqBoard", method = RequestMethod.GET) 
	  public void listPage(@ModelAttribute("cri") faqSearchCriteria cri, Model model) {
	  
	  logger.info("cri.toString........"+cri.toString());
	  

	  model.addAttribute("list", faqService.faqlistSearchCriteria(cri));
	  
	  PageMaker pageMaker = PageMaker.builder().cri(cri).build();
	  pageMaker.setTotalCount(faqService.faqlistSearchCount(cri));
	  
	  model.addAttribute("PageMaker", pageMaker); }
	 
	 
	  @RequestMapping(value = "/writeFaq", method = RequestMethod.GET)
	  public void registGET(){

	    logger.info("regist get ...........");
	  }

	  @RequestMapping(value = "/writeFaq", method = RequestMethod.POST)
	  public String registPOST(faqVO faqVO, RedirectAttributes rttr, HttpSession session){

	    logger.info("regist post ...........");
	    logger.info(faqVO.toString());

	    UsrVO Usercode = (UsrVO) session.getAttribute("login");
	    int code = Usercode.getUSRCODE();
	    faqVO.setUSRCODE(code);
	    
	    faqService.writeFaq(faqVO);

	    return "redirect:/faq/faqBoard";
	  }
	  
	  @RequestMapping(value = "/readFaq", method = RequestMethod.GET)
	  public void read(@RequestParam("FAQCODE") int FAQCODE,  @ModelAttribute("cri") faqSearchCriteria cri, Model model)
	      throws Exception {

	    model.addAttribute(faqService.readFaq(FAQCODE));
	  }
	  
	  @RequestMapping(value = "/modifyFaq", method = RequestMethod.GET)
	  public void modifyPagingGET(int FAQCODE, @ModelAttribute("cri") faqSearchCriteria cri, Model model) {

	    model.addAttribute(faqService.readFaq(FAQCODE));
	  }
		  
	
	  @RequestMapping(value = "/modifyFaq", method = RequestMethod.POST)
	  public String modifyPagingPOST(faqVO faqVO, faqSearchCriteria cri, RedirectAttributes rttr) {

	    logger.info(cri.toString());
	    faqService.modifyFaq(faqVO);

		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		 

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    logger.info(rttr.toString());

	    return "redirect:/faq/faqBoard";
	  }
	  
	  @RequestMapping(value = "/deleteFaq", method = RequestMethod.GET)
	  public String remove(@RequestParam("FAQCODE") int FAQCODE, faqSearchCriteria cri, RedirectAttributes rttr) throws Exception {

	    faqService.deleteFaq(FAQCODE);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/faq/faqBoard";
	  }
}
