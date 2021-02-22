package org.planngo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@NoArgsConstructor
@AllArgsConstructor

public class LocationVO {
	
	private Integer LOCATIONCODE;
	private String LOCATIONPROVINCE;
	private String LOCATIONCITY;
	private String CITYIMAGE;
	private String LATLNG;
	private String COMMENT;
}
