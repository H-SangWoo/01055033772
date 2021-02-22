package org.planngo.mapper;

import java.util.List;

import org.planngo.domain.Criteria;

import org.planngo.domain.PackageVO;
import org.planngo.domain.PackageSearchCriteria;

public interface PackageBoardMapper {

	public List<PackageVO> listSearchCriteria(Criteria cri);

	public int listSearchCount(PackageSearchCriteria cri);

	public void insert(PackageVO packageVO);

	public PackageVO read(int pno);

	public PackageVO deletePackage(int pno);
	
	

}
