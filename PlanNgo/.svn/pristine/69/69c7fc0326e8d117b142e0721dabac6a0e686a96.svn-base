package org.planngo.controller;

import javax.inject.Inject;

import org.planngo.service.IndexPageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/indexPage/*")
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(PackageController.class);

	@Inject
	private IndexPageService indexPageService;
	
	@RequestMapping(value = "/city", method = RequestMethod.GET)
	public void readCity(@RequestParam("locationCity") String locationCity, Model model) throws Exception {

		model.addAttribute("readCity",indexPageService.readCity(locationCity));
		model.addAttribute("activityList",indexPageService.getActivityList(locationCity));
	}
	
	@RequestMapping(value = "/activity", method = RequestMethod.GET)
	public void readActivity(@RequestParam("locationCity") String locationCity,@RequestParam("activityCode") int activityCode, Model model) throws Exception {

		model.addAttribute("locationCity", locationCity);
		model.addAttribute("readActivity",indexPageService.readActivity(activityCode));
		model.addAttribute("activityList",indexPageService.getActivityList(locationCity));
	}
	

}
