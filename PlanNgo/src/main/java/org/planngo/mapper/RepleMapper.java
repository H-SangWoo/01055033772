package org.planngo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.planngo.domain.Criteria;
import org.planngo.domain.RepleVO;

public interface RepleMapper {

	/*
	 * public List<RepleVO> listPage(@Param("NOTICECODE")Integer
	 * NOTICECODE, @Param("cri")Criteria cri) throws Exception;
	 */
	
	public int count(Integer NOTICECODE) throws Exception;

	public void create(RepleVO vo) throws Exception;

	public List<RepleVO> listPage(Map<String, Object> paramMap);

	public void update(RepleVO vo) throws Exception;

	public void delete(Integer REPLECODE) throws Exception; 
	
}
