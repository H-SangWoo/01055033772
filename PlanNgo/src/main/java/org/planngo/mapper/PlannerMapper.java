package org.planngo.mapper;

import java.util.List;

import org.planngo.domain.PlanBoardVO;
import org.planngo.dto.ActivityDTO;
import org.planngo.dto.BucketListDTO;
import org.planngo.dto.DayDTO;
import org.planngo.dto.PlanDTO;
import org.planngo.dto.ScheduleDTO;
import org.planngo.domain.ActivityVO;
import org.planngo.domain.Criteria;
import org.planngo.domain.LocationVO;
import org.planngo.domain.PlanSearchCriteria;

public interface PlannerMapper {

	public List<PlanBoardVO> listPlanCriteria(Criteria cri);

	public int listSearchCount(PlanSearchCriteria cri);

	public void registerPlan(PlanDTO planDTO);
	public int getPlanCode(PlanDTO planDTO);

	public void registerDay(DayDTO dayDTO);

	public int getDaysCode(DayDTO dayDTO);

	public void registerPlanSchedule(ScheduleDTO scheduleDTO);

	public int getPlanScheduleCode(ScheduleDTO scheduleDTO);

	public List<LocationVO> getLocationInfo();
	
	public List<ActivityVO> getActivityInfo();
	
	public List<ActivityDTO> getActivityInfoByCity(ActivityDTO dTO);


	public void registerBucketList(BucketListDTO bucketListDTO);
	
	
}
