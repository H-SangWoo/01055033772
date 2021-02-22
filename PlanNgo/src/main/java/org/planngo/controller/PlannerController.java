package org.planngo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.planngo.domain.UsrVO;
import org.planngo.dto.BucketListDTO;
import org.planngo.dto.DayDTO;
import org.planngo.dto.MarkerInfo;
import org.planngo.dto.PlanDTO;
import org.planngo.dto.ScheduleDTO;
import org.planngo.service.PlannerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/planner/*")
public class PlannerController {
	private static final Logger logger = LoggerFactory.getLogger(PlannerController.class);
	@Inject
	private PlannerService plannerService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(Model model,MarkerInfo markerInfo) {
		markerInfo.setCity(plannerService.getLocationInfo()); 
		markerInfo.setActivity(plannerService.getActivityInfo());
		System.out.println(markerInfo.getCity());
		model.addAttribute("markerInfo", markerInfo);
		logger.info("register get ...........");
	}

	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(@RequestBody PlanDTO planDTO , HttpSession session) throws Exception {

		logger.info("register post ...........");
		logger.info(planDTO.toString());

		UsrVO usrVO = (UsrVO) session.getAttribute("login");
		planDTO.setUSRCODE(usrVO.getUSRCODE());
		plannerService.registerPlan(planDTO);
		int planCode = plannerService.getPlanCode(planDTO);

		System.out.println(planDTO.getDAYS());
		for (DayDTO dayDTO : planDTO.getDAYS()) {
			dayDTO.setPLANCODE(planCode);
			plannerService.registerDay(dayDTO);
			int daysCode = plannerService.getDaysCode(dayDTO);
			for (ScheduleDTO scheduleDTO : dayDTO.getPLANSCHEDULELIST()) {
				scheduleDTO.setDAYSCODE(daysCode);
				plannerService.registerPlanSchedule(scheduleDTO);
				int planScheduleCode = plannerService.getPlanScheduleCode(scheduleDTO);
				for(BucketListDTO bucketListDTO : scheduleDTO.getBUCKETLIST()) {
					bucketListDTO.setPLANSCHEDULECODE(planScheduleCode);
					logger.info(bucketListDTO.toString());
					plannerService.registerBucketList(bucketListDTO);
				}
				
			}
		}

		return "/planner/myPlannerBoard"; 

	}
}
