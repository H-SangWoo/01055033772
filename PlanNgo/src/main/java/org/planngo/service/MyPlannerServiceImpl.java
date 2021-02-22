package org.planngo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.planngo.domain.BucketListVO;
import org.planngo.domain.DaysVO;
import org.planngo.domain.PlanBoardVO;
import org.planngo.domain.PlanScheduleVO;
import org.planngo.controller.MyPlannerBoardController;
import org.planngo.domain.PlanSearchCriteria;
import org.planngo.domain.PlannerVO;
import org.planngo.dto.PlannerDTO;
import org.planngo.mapper.MyPlannerMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPlannerServiceImpl implements MyPlannerService {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPlannerBoardController.class);

	@Autowired
	private MyPlannerMapper plannerMapper;
	
	@Override
	public List<PlannerDTO> listPlanCriteria(PlanSearchCriteria cri) {
		return plannerMapper.listPlanCriteria(cri);
	}
	
	@Override
	public int listSearchCount(PlanSearchCriteria cri) {
		return plannerMapper.listSearchCount(cri);
	}

	@Override
	public List<PlanBoardVO> listShareCriteria(PlanSearchCriteria cri) {
		return plannerMapper.listShareCriteria(cri);
	}
	
	@Override
	public int listShareSearchCount(PlanSearchCriteria cri) {
		return plannerMapper.listShareSearchCount(cri);
	}

	@Override
	public PlannerDTO readPlan(int planno) {
		return plannerMapper.readPlan(planno);
	}

	@Override
	public List<DaysVO> getDays(int planno) {
		return plannerMapper.getDays(planno);
	}

	@Override
	public List<PlanScheduleVO> getScheduleLists(int planno, int day) {
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("PLANCODE", planno);
		hashMap.put("DAYSCODE", day);
		
		return plannerMapper.getScheduleLists(hashMap);
	}

	@Override
	public PlanBoardVO getCityImage(int planno) {
		return plannerMapper.getCityImage(planno);
	}

	@Override
	public int isShared(Integer usrcode, int planno) {
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("USRCODE", usrcode);
		hashMap.put("PLANCODE", planno);
		
		logger.info("Service isShared : " + plannerMapper.isShared(hashMap));
		
		return plannerMapper.isShared(hashMap);
	}

	@Override
	public void shareRegist(Integer usrcode, int planno) {
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("USRCODE", usrcode);
		hashMap.put("PLANCODE", planno);
		plannerMapper.shareRegist(hashMap);
	}

	@Override
	public List<BucketListVO> getBucketLists(int planno, int day, int planScheduleNo) {
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("PLANCODE", planno);
		hashMap.put("DAY", day);
		hashMap.put("PLANSCHEDULEORDER", planScheduleNo);
		return plannerMapper.getBucketLists(hashMap);
	}

}
