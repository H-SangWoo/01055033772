package org.planngo.service;

import java.util.List;

import org.planngo.domain.NoticeVO;
import org.planngo.domain.nSearchCriteria;

public interface NoticeBoardService {
	/* List<NoticeVO> selectNoticeList() throws Exception; */
	
	public List<NoticeVO> listSearchCriteria(nSearchCriteria cri)
	throws Exception;
	
	public int listSearchCount(nSearchCriteria cri) throws Exception;
	
	public void regist(NoticeVO notice) throws Exception;
	
	public NoticeVO read(Integer NOTICECODE) throws Exception;

	public void modify(NoticeVO notice) throws Exception;
	
	public void remove(Integer NOTICECODE) throws Exception; 
}
