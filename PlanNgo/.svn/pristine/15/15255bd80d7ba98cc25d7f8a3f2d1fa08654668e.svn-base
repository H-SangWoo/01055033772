package org.planngo.service;

import java.util.List;

import javax.inject.Inject;

import org.planngo.domain.ActivityVO;
import org.planngo.domain.LocationVO;
import org.planngo.mapper.IndexMapper;
import org.springframework.stereotype.Service;

@Service
public class IndexPageServiceImpl implements IndexPageService{
	
	@Inject
	private IndexMapper indexMapper;

	@Override
	public LocationVO readCity(String locationCity) throws Exception {
		
		return indexMapper.readCity(locationCity);
	}

	@Override
	public ActivityVO readActivity(int activityCode) throws Exception {
		// TODO Auto-generated method stub
		return indexMapper.readActivity(activityCode);
	}

	@Override
	public List<ActivityVO> getActivityList(String locationCity) throws Exception {
		// TODO Auto-generated method stub
		return indexMapper.getActivityList(locationCity);
	}


}
