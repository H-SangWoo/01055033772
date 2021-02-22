package org.planngo.service;

import java.util.List;

import org.planngo.domain.Criteria;
import org.planngo.domain.RepleVO;

public interface RepleService {

	public List<RepleVO> listPage(Integer NOTICECODE, Criteria cri) throws Exception;
	
	public int count(Integer NOTICECODE) throws Exception;

	public void addReple(RepleVO vo) throws Exception;

	public void modifyReple(RepleVO vo) throws Exception;

	public void removeReple(Integer REPLECODE) throws Exception;
	
}
