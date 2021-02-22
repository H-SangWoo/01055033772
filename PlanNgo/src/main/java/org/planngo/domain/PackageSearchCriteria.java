package org.planngo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString(callSuper = true)
public class PackageSearchCriteria extends Criteria {
	
	private String agencyType;
	private String startPrice;
	private String startDate;
	private String endDate;
	 
/*	@Builder
	private pSearchCriteria( int page,  int perPageNum, String agencyType, String startPrice,String startDate,String endDate) {
		super(page,perPageNum);
		this.agencyType = agencyType;
		this.startDate
		this.startPrice
		this.*/
		
		
		
	
}
