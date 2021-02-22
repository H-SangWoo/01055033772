package org.planngo.service;

import java.util.List;

import org.planngo.domain.ActivityVO;
import org.planngo.domain.LocationVO;

public interface IndexPageService {

	public LocationVO readCity(String locationCity) throws Exception;

	public ActivityVO readActivity(int activityCode) throws Exception;

	public List<ActivityVO> getActivityList(String locationCity) throws Exception;


}
