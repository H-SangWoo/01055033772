package org.planngo.service;

import java.util.List;

import org.planngo.domain.faqSearchCriteria;
import org.planngo.domain.faqVO;
import org.planngo.mapper.faqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class faqServiceImpl implements faqService{
	
	@Autowired
	private faqMapper faqMapper;	
	
	  @Override 
	  public List<faqVO> faqlistSearchCriteria(faqSearchCriteria cri) {
	  
	  return faqMapper.faqlistSearchCriteria(cri);
	  }

	  @Override
	  public int faqlistSearchCount(faqSearchCriteria cri) {

	    return faqMapper.faqlistSearchCount(cri);
	  }
	  
	  @Override
	  public void writeFaq(faqVO faqVO) {
		  faqMapper.writeFaq(faqVO);
	  }
	  
	  @Override
	  public faqVO readFaq(int FAQCODE) {
	    return faqMapper.readFaq(FAQCODE);
	  }
	  
	  @Override
	  public void modifyFaq(faqVO faqVO) {
		  faqMapper.modifyFaq(faqVO);
	  }
	  
	  @Override
	  public void deleteFaq(int FAQCODE) {
		  faqMapper.deleteFaq(FAQCODE);
	  }
}
