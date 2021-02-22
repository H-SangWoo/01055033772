package org.planngo.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
@NoArgsConstructor
public class PlanSearchCriteria extends Criteria{
	
	private int USRCODE;
	private String searchType;
	private String keyword;
	
}
