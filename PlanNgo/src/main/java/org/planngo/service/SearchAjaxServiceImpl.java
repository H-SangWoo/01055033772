package org.planngo.service;

import java.util.List;

import org.planngo.domain.ActivityVO;
import org.planngo.domain.LocationVO;
import org.planngo.domain.SearchCriteria;
import org.planngo.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchAjaxServiceImpl implements SearchAjaxService {

	@Autowired
	private SearchMapper searchMapper;

	@Override
	public List<LocationVO> listLocationSearch(SearchCriteria cri) throws Exception {
		return searchMapper.listLocationSearch(cri);
	}

	@Override
	public List<ActivityVO> listActivitySearchCriteria(SearchCriteria cri) throws Exception {
		return searchMapper.listActivitySearchCriteria(cri);
	}

}
