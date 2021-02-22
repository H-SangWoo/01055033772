package org.planngo.controller;

import java.util.List;

import javax.inject.Inject;

import org.planngo.domain.ActivityVO;
import org.planngo.domain.LocationVO;
import org.planngo.domain.SearchCriteria;
import org.planngo.service.SearchAjaxService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/searchAjax")
public class SearchAjaxController {

	  @Inject
	  private SearchAjaxService searchAjaxService;

  @RequestMapping(value = "/locationProvince/{locationProvince}", method = RequestMethod.GET)
  public  ResponseEntity<List<LocationVO>> listLoaction(@ModelAttribute("cri") SearchCriteria cri) {

    ResponseEntity<List<LocationVO>> entity = null;
    try {
      entity = new ResponseEntity<>(searchAjaxService.listLocationSearch(cri), HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/locationCity/{locationCity}/activityType/{activityType}", method = RequestMethod.GET)
  public ResponseEntity<List<ActivityVO>> listActivity(@ModelAttribute("cri") SearchCriteria cri) {

    ResponseEntity<List<ActivityVO>> entity = null;
    try {
      entity = new ResponseEntity<>(searchAjaxService.listActivitySearchCriteria(cri), HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }
  

}
