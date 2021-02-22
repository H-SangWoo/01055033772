package org.planngo.controller;

import java.util.List;

import javax.inject.Inject;

import org.planngo.domain.ActivityVO;
import org.planngo.dto.ActivityDTO;
import org.planngo.service.PlannerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/buketlist")
public class BucketlistController {
	  private static final Logger logger = LoggerFactory.getLogger(BucketlistController.class);

	@Inject
	private PlannerService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<List<ActivityDTO>> register(@RequestBody ActivityDTO DTO) {

		ResponseEntity<List<ActivityDTO>> entity = null;
		try {
			
			// service.getActivityInfo(DTO);
			logger.info("테스트:"+service.getActivityInfoByCity(DTO).toString());
			entity = new ResponseEntity<>(service.getActivityInfoByCity(DTO), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
