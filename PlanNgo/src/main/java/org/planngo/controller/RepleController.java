package org.planngo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.planngo.domain.Criteria;
import org.planngo.domain.PageMaker;
import org.planngo.domain.RepleVO;
import org.planngo.service.RepleService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reple")
public class RepleController {

	@Inject
	private RepleService repleService;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody RepleVO vo) {
		
		ResponseEntity<String> entity = null;
	    try {
	    	System.out.println("service test..." + vo);
			repleService.addReple(vo);
	    	
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	

	@RequestMapping(value = "/{NOTICECODE}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("NOTICECODE") Integer NOTICECODE,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			System.out.println("테스트" + cri);
			cri.setPage(page);

			PageMaker pageMaker = PageMaker.builder().cri(cri).build();
			pageMaker.setCri(cri);
			System.out.println(cri.getPageStart());
			Map<String, Object> map = new HashMap<String, Object>();
			List<RepleVO> list = repleService.listPage(NOTICECODE, cri);
			map.put("list", list);
			System.out.println("댓글리스트 테스트= " + list);

			int repleCount = repleService.count(NOTICECODE);
			System.out.println("repleCount = " + repleCount);
			pageMaker.setTotalCount(repleCount);

			map.put("pageMaker", pageMaker);
			System.out.println("pageMaker = " + pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	  @RequestMapping(value = "/{REPLECODE}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	  public ResponseEntity<String> update(@PathVariable("REPLECODE") Integer REPLECODE, @RequestBody RepleVO vo) {

	    ResponseEntity<String> entity = null;
	    try {
	      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+vo);
	      vo.setREPLECODE(REPLECODE);
	      repleService.modifyReple(vo);

	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	  
	  @RequestMapping(value = "/{REPLECODE}", method = RequestMethod.DELETE)
	  public ResponseEntity<String> remove(@PathVariable("REPLECODE") Integer REPLECODE) {

	    ResponseEntity<String> entity = null;
	    
	    System.out.println("@@@@@@@@" + REPLECODE);
	    
	    try {
	      repleService.removeReple(REPLECODE);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
}
