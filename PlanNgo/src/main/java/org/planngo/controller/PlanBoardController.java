package org.planngo.controller;

import javax.inject.Inject;

import org.planngo.domain.PageMaker;
import org.planngo.domain.PlanSearchCriteria;
import org.planngo.service.PlanBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/planBoard/*")
public class PlanBoardController {
	
	private static final Logger Logger = LoggerFactory.getLogger(PlanBoardController.class);
	/*
	 * @Inject private PlanBoardService planBoardService;
	 * 
	 * @RequestMapping(value = "/listPlanBoard", method = RequestMethod.GET) public
	 * void listPlanBoard(@ModelAttribute("cri") PlanSearchCriteria cri, Model
	 * model) { Logger.info("listPlanBoardCriString : " + cri.toString());
	 * 
	 * model.addAttribute("boardlist", planBoardService.listSearchCount(cri));
	 * 
	 * PageMaker pageMaker = PageMaker.builder().cri(cri).build();
	 * pageMaker.setTotalCount(planBoardService.listSearchCount(cri));
	 * 
	 * model.addAttribute("pageMaker", pageMaker); }
	 * 
	 * public void listMyPlan(@ModelAttribute("cri") PlanSearchCriteria cri, Model
	 * model) { Logger.info("listMyPlannerCriString : " + cri.toString());
	 * 
	 * model.addAttribute("planlist", planBoardService.listSearchCount(cri));
	 * 
	 * PageMaker pageMaker = PageMaker.builder().cri(cri).build(); }
	 */
}
