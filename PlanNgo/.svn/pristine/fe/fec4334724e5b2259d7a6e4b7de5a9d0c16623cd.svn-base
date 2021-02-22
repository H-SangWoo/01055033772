package org.planngo.service;

import java.util.List;

import org.planngo.domain.BucketListVO;
import org.planngo.domain.DaysVO;
import org.planngo.domain.PlanBoardVO;
import org.planngo.domain.PlanScheduleVO;
import org.planngo.domain.PlanSearchCriteria;
import org.planngo.domain.PlannerVO;
import org.planngo.dto.PlannerDTO;

public interface MyPlannerService {

	public List<PlannerDTO> listPlanCriteria(PlanSearchCriteria cri);

	public int listSearchCount(PlanSearchCriteria cri);
	
	public List<PlanBoardVO> listShareCriteria(PlanSearchCriteria cri);
	
	public int listShareSearchCount(PlanSearchCriteria cri);

	public PlannerDTO readPlan(int planno);
	
	public PlanBoardVO getCityImage(int planno);
	
	public List<DaysVO> getDays(int planno);
	
	public List<PlanScheduleVO> getScheduleLists(int planno, int day);

	public int isShared(Integer usrcode, int planno);

	public void shareRegist(Integer usrcode, int planno);
	
	public List<BucketListVO> getBucketLists(int planno, int day, int planScheduleNo);

}
