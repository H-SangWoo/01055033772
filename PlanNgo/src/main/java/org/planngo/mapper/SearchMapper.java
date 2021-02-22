package org.planngo.mapper;

import java.util.List;

import org.planngo.domain.ActivityVO;
import org.planngo.domain.LocationVO;
import org.planngo.domain.SearchCriteria;

public interface SearchMapper {
	public List<LocationVO> listLocationSearch(SearchCriteria cri);
	public List<ActivityVO> listActivitySearchCriteria(SearchCriteria cri);
	
}
