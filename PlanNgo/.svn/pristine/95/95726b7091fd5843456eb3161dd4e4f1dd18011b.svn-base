package org.planngo.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.inject.Inject;

import org.slf4j.Logger;

@Controller
@RequestMapping(value = "/search/*")

public class SearchController {
	
	private static final Logger Logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
//	private SearchService searchService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public void searchList() throws Exception{
		Logger.info("SearchController : searchList /search/list");
				
	}
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET, produces = "application/json")
	public void test() throws Exception{
		Logger.info("SearchController : searchList /search/test");
				
	}
}
