package org.planngo.service;

import java.util.List;

import org.planngo.domain.PlanBoardVO;
import org.planngo.domain.PlanSearchCriteria;
import org.planngo.mapper.PlanBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class PlanBoardServiceImpl implements PlanBoardService {
	
	@Autowired
	private	PlanBoardMapper pbBoardMapper;
	
	@Override
	public List<PlanBoardVO> listSearchCriteria(PlanSearchCriteria cri) {
		
		return pbBoardMapper.listSearchCriteria(cri);
	}

	@Override
	public int listSearchCount(PlanSearchCriteria cri) {
		
		return pbBoardMapper.listSearchCount(cri);
	}

}
