package org.planngo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runners.BlockJUnit4ClassRunner;
import org.planngo.domain.DaysVO;
import org.planngo.domain.PageMaker;
import org.planngo.domain.PlanSearchCriteria;
import org.planngo.domain.PlannerVO;
import org.planngo.domain.PlanScheduleVO;
import org.planngo.domain.UsrVO;
import org.planngo.dto.PlannerDTO;
import org.planngo.service.MyPlannerService;
import org.planngo.service.PlannerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/planner/*")
public class MyPlannerBoardController {

	private static final Logger logger = LoggerFactory.getLogger(MyPlannerBoardController.class);
	
	@Inject
	private MyPlannerService plannerService;
	
	/*
	 * @Inject private SharemyPlannerService shareService;
	 */
	
	@RequestMapping(value = "/myPlannerBoard", method = RequestMethod.GET)
	public void myBoardGET(@ModelAttribute("cri") PlanSearchCriteria cri, Model model, HttpSession session) {
		//PlanUserVO userVO = (PlanUserVO) req.getAttribute("user");
		
		UsrVO usrVO = (UsrVO) session.getAttribute("login");
		if(usrVO == null) {
			model.addAttribute("msg", "notLogin");
		} else {
			cri.setUSRCODE(usrVO.getUSRCODE());
			
			model.addAttribute("plannerDTO", plannerService.listPlanCriteria(cri));
			
			logger.info("Controller USRCODE : " + cri.getUSRCODE());
			
			PageMaker pageMaker = PageMaker.builder().cri(cri).build();
			pageMaker.setTotalCount(plannerService.listSearchCount(cri));
			
			logger.info("PlannerController count : " + plannerService.listSearchCount(cri));
			logger.info("PlannerController Search Type: " + cri.getSearchType() + ", PlannController Search Keyword: " + cri.getKeyword());
			
			model.addAttribute("PageMaker", pageMaker);
		}
	}
	
	
	@RequestMapping(value = "/shareboard", method = RequestMethod.GET)
	public void shareBoardGET(@ModelAttribute("cri") PlanSearchCriteria cri, Model model, HttpSession session) {
		logger.info("ShareBoard Start .... ");
		
		model.addAttribute("shareVO", plannerService.listShareCriteria(cri));
		
		PageMaker pageMaker = PageMaker.builder().cri(cri).build();
		pageMaker.setTotalCount(plannerService.listShareSearchCount(cri));
		
		logger.info("PlannerController ShareCriteria : " + plannerService.listShareCriteria(cri));
		logger.info("PlannerController ShareCount : " + plannerService.listShareSearchCount(cri));
		
		model.addAttribute("PageMaker", pageMaker);
		
		logger.info("ShareBoard End .... ");
	}
	
	
	@RequestMapping(value = "/readPlanner", method = RequestMethod.GET)
	public void read(PlannerVO plannerVO, @RequestParam("planno") int planno, 
			@ModelAttribute("cri") PlanSearchCriteria cri, Model model, HttpSession session) {
		logger.info("ReadPlanner process start ...");

		PlannerDTO plannerDTO = plannerService.readPlan(planno);
		
		UsrVO usrVO = (UsrVO) session.getAttribute("login");
		
		if(usrVO != null) {
			usrVO.setUSRCODE(usrVO.getUSRCODE());
			
			boolean isShared = false;
			if(!(usrVO == null)) {
				int countShared = plannerService.isShared(usrVO.getUSRCODE(), planno);
				if(countShared == 1) {
					isShared = true;
				} else if (countShared == 0) {
					isShared = false;
				}
				model.addAttribute("isShared", isShared);				
				logger.info("Controller isShared : " + isShared);
			}
		}
		
		plannerVO.setDAYS(plannerService.getDays(planno));
		model.addAttribute("plannerDTO", plannerDTO);
		
		logger.info("ReadPlanner Controller : " + planno);
		logger.info("Controller DAYS : " + plannerVO.getDAYS());
		
		logger.info("CONTROLLER PLANCODE : " + session.getAttribute("PLANCODE"));
		
		for (DaysVO daysVO : plannerVO.getDAYS()) {
			daysVO.setPLANSCHEDULELIST(plannerService.getScheduleLists(planno, daysVO.getDAYSCODE()));
			logger.info("FOR DAYSCODE : " + daysVO.getDAYSCODE());
			for(PlanScheduleVO planScheduleVO : daysVO.getPLANSCHEDULELIST()) {
				logger.info("CONTROLLER LOCATIONCITY : " + planScheduleVO.getLOCATIONCODE());
				planScheduleVO.setBUCKETLISTS(plannerService.getBucketLists(planno, daysVO.getDAY(), planScheduleVO.getPLANSCHEDULEORDER()));
				logger.info("Controller DAYS : " + daysVO.getDAYSCODE());
			}
		}
		model.addAttribute("plannerVO", plannerVO);
	}
	
	@RequestMapping(value = "/shareRegister",  method = RequestMethod.POST)
	public String sharePost(HttpSession session, PlannerDTO plannerDTO, RedirectAttributes rttr) {
		logger.info("shareRegister start ..... ");
		
		UsrVO usrVO = (UsrVO) session.getAttribute("login");
		usrVO.setUSRCODE(usrVO.getUSRCODE());
		
		plannerService.shareRegist(usrVO.getUSRCODE(), plannerDTO.getPLANCODE());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/planner/myPlannerBoard";
	}
	
}
