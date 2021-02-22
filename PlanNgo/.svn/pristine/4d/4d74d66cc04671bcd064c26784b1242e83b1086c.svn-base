package org.planngo.mapper;

import java.util.List;

import org.planngo.domain.Criteria;
import org.planngo.domain.NoticeVO;
import org.planngo.domain.nSearchCriteria;

public interface nBoardMapper {
	/* List<NoticeVO> selectNoticeList() throws Exception; */
	public List<NoticeVO> listSearchCriteria(Criteria cri);
	
	public int listSearchCount(nSearchCriteria cri);
	
	public void regist(NoticeVO notice);
	
	public NoticeVO read(Integer NOTICECODE) throws Exception;

	public void update(NoticeVO notice);
	
	public void delete(Integer NOTICECODE) throws Exception;
}
