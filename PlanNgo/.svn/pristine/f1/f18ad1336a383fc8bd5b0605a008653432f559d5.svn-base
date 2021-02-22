package org.planngo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.planngo.domain.Criteria;
import org.planngo.domain.RepleVO;
import org.planngo.mapper.RepleMapper;
import org.planngo.mapper.nBoardMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RepleServiceImpl implements RepleService {
	
	@Inject
	private RepleMapper repleMapper;
	
	@Inject
	private nBoardMapper boardMapper;
	
	@Transactional
	@Override
	public void addReple(RepleVO vo) throws Exception{
		repleMapper.create(vo);
	}
	
	
	@Override
	public List<RepleVO> listPage(Integer NOTICECODE, Criteria cri) throws Exception{
		
		
		  Map<String, Object> paramMap = new HashMap<>();
		  
		  paramMap.put("NOTICECODE", NOTICECODE);
		  System.out.println("NOTICECODE" +  NOTICECODE);
		  paramMap.put("cri", cri);
		  System.out.println("CRI = " + cri);
		 
		
			/* return repleMapper.listPage(NOTICECODE, cri); */
		  return repleMapper.listPage(paramMap); 
	}
	
	@Override
	public int count(Integer NOTICECODE) throws Exception{
		
		return repleMapper.count(NOTICECODE);
	}


	@Override
	public void modifyReple(RepleVO vo) throws Exception{
	
		repleMapper.update(vo);
	}

	@Transactional
	@Override
	public void removeReple(Integer REPLECODE) throws Exception {
		
		repleMapper.delete(REPLECODE);
		
	}
}
