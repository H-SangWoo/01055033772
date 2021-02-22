package org.planngo.service;

import java.util.List;

import org.planngo.domain.PackageSearchCriteria;
import org.planngo.domain.PackageVO;
import org.planngo.mapper.PackageBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PackageBoardServiceImpl implements PackageBoardService{
	@Autowired
	private PackageBoardMapper pboardmapper;
	
	@Override
	public List <PackageVO> listSearchCriteria(PackageSearchCriteria cri) {
		
		return pboardmapper.listSearchCriteria(cri);
	}

	@Override
	public int listSearchCount(PackageSearchCriteria cri) {
		
		return pboardmapper.listSearchCount(cri);
	}

	@Override
	public void regist(PackageVO packageVO) {
		
		
			
		pboardmapper.insert(packageVO);
	}

	@Override
	public PackageVO read(int pno) {
		// TODO Auto-generated method stub
		return pboardmapper.read(pno);
	}

	@Override
	public PackageVO deletePackage(int pno) {
		
		return pboardmapper.deletePackage(pno);
	}

}
