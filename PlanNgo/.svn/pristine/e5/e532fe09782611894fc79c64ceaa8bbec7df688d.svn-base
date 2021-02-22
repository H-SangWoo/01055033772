package org.planngo.service;

import java.util.List;

import org.planngo.domain.ActivityVO;
import org.planngo.domain.LocationVO;
import org.planngo.dto.ActivityDTO;
import org.planngo.dto.BucketListDTO;
import org.planngo.dto.DayDTO;
import org.planngo.dto.PlanDTO;
import org.planngo.dto.ScheduleDTO;
import org.planngo.mapper.PlannerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlannerServiceImpl implements PlannerService{

	@Autowired
	private PlannerMapper plannerMapper;
	
	@Override
	public void registerPlan(PlanDTO planDTO) {
		plannerMapper.registerPlan(planDTO);
		
	}

	@Override
	public int getPlanCode(PlanDTO planDTO) {
		return plannerMapper.getPlanCode(planDTO);
	}

	@Override
	public void registerDay(DayDTO dayDTO) {
		plannerMapper.registerDay(dayDTO);
		
	}

	@Override
	public int getDaysCode(DayDTO dayDTO) {
		return plannerMapper.getDaysCode(dayDTO);
	}

	@Override
	public void registerPlanSchedule(ScheduleDTO scheduleDTO) {
		plannerMapper.registerPlanSchedule(scheduleDTO);
		
	}

	@Override
	public List<LocationVO> getLocationInfo() {
		return plannerMapper.getLocationInfo();
	}

	@Override
	public List<ActivityDTO> getActivityInfoByCity(ActivityDTO dTO) {
		return plannerMapper.getActivityInfoByCity(dTO);
	}
	@Override
	public List<ActivityVO> getActivityInfo() {
		return plannerMapper.getActivityInfo();
	}

	@Override
	public int getPlanScheduleCode(ScheduleDTO scheduleDTO) {
		return plannerMapper.getPlanScheduleCode(scheduleDTO);
	}

	@Override
	public void registerBucketList(BucketListDTO bucketListDTO) {
		plannerMapper.registerBucketList(bucketListDTO);
		
	}

}
