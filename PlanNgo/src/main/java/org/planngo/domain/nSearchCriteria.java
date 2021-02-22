package org.planngo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString(callSuper = true)
public class nSearchCriteria extends Criteria {
	
	private String SearchType;
	private String keyword;

}
