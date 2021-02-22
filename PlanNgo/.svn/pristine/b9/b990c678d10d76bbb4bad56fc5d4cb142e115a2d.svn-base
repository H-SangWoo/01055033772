package org.planngo.service;

import java.util.List;

import org.planngo.domain.NoticeVO;
import org.planngo.domain.nSearchCriteria;
import org.planngo.mapper.nBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Autowired
	private nBoardMapper nboardMapper;
	
	/*
	 * @Override public List<NoticeVO> selectNoticeList() throws Exception{ return
	 * nboardMapper.selectNoticeList(); }
	 */
	@Override
	public List<NoticeVO> listSearchCriteria(nSearchCriteria cri) throws Exception  {
		return nboardMapper.listSearchCriteria(cri);
	}
	@Override
	public int listSearchCount(nSearchCriteria cri) throws Exception  {
		return nboardMapper.listSearchCount(cri);
	}
	@Override
	public void regist(NoticeVO notice) throws Exception  {
		nboardMapper.regist(notice);
	}
	@Override
	public NoticeVO read(Integer NOTICECODE) throws Exception {
		return nboardMapper.read(NOTICECODE);
	}
	@Override
	public void modify(NoticeVO notice) throws Exception {
		nboardMapper.update(notice);
	}
	@Override
	public void remove(Integer NOTICECODE) throws Exception {
		nboardMapper.delete(NOTICECODE);
	}
}


