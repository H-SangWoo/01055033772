package org.planngo.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.planngo.domain.Criteria;
import org.planngo.domain.NoticeVO;
import org.planngo.domain.PageMaker;
import org.planngo.domain.UsrVO;
import org.planngo.domain.nSearchCriteria;
import org.planngo.service.NoticeBoardService;
import org.slf4j.Logger;

@Controller
@RequestMapping(value = "/notice/*")

public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeBoardService noticeService;

	@RequestMapping(value = "/noticeboard", method = RequestMethod.GET)
	public void NoticeList(@ModelAttribute("cri") nSearchCriteria cri, Model model) throws Exception {
		logger.info("// /notice/noticeboard");

		/* List<NoticeVO> list = noticeService.selectNoticeList(); */

		model.addAttribute("list", noticeService.listSearchCriteria(cri));

		PageMaker pageMaker = PageMaker.builder().cri(cri).build();
		pageMaker.setTotalCount(noticeService.listSearchCount(cri));
				
		model.addAttribute("PageMaker", pageMaker);
		logger.info("페이지메이커 = " + pageMaker);

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(NoticeVO notice, Model model) throws Exception {

		logger.info("regist get ..........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(NoticeVO notice, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("regist post ..........");
		logger.info(notice.toString());
		
		UsrVO Usrcode = (UsrVO) session.getAttribute("login");
		int code = Usrcode.getUSRCODE();
		notice.setUSRCODE(code);
		
		logger.info("유저코드 : "+ code);
		

		noticeService.regist(notice);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/noticeboard";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("NOTICECODE") int NOTICECODE, @ModelAttribute("cri") nSearchCriteria cri,
			Model model) throws Exception {

		model.addAttribute(noticeService.read(NOTICECODE));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageingGET(int NOTICECODE, @ModelAttribute("cri") nSearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute("read", noticeService.read(NOTICECODE));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPageingPOST(NoticeVO notice, nSearchCriteria cri, RedirectAttributes rttr) throws Exception {

		logger.info(cri.toString());
		noticeService.modify(notice);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());

		return "redirect:/notice/noticeboard";
	}
	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("NOTICECODE") int NOTICECODE, nSearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		noticeService.remove(NOTICECODE);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
	
		return "redirect:/notice/noticeboard";
	
	}

}
