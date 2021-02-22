package org.planngo.mapper;

import java.util.List;
import java.util.Map;

import org.planngo.domain.PlanBoardVO;
import org.planngo.domain.PlanScheduleVO;
import org.planngo.dto.PlannerDTO;
import org.planngo.dto.PlanDTO;
import org.planngo.domain.BucketListVO;
import org.planngo.domain.Criteria;
import org.planngo.domain.DaysVO;
import org.planngo.domain.PlanSearchCriteria;
import org.planngo.domain.PlannerVO;

public interface MyPlannerMapper {

	public List<PlannerDTO> listPlanCriteria(Criteria cri);
	
	public int listSearchCount(PlanSearchCriteria cri);
	
	public List<PlanBoardVO> listShareCriteria(Criteria cri);
	
	public int listShareSearchCount(PlanSearchCriteria cri);

	public PlannerDTO readPlan(int planno);

	//public String getAttach(Integer pno);

	public PlanBoardVO getCityImage(int planno);

	public List<DaysVO> getDays(int planno);

	public List<PlanScheduleVO> getScheduleLists(Map<String, Object> hashMap);

	public int isShared(Map<String, Object> hashMap);

	public void shareRegist(Map<String, Object> hashMap);

	public List<BucketListVO> getBucketLists(Map<String, Object> hashMap);

}
