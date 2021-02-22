package org.planngo.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@NoArgsConstructor
@AllArgsConstructor

public class ActivityDTO {

	private Integer ACTIVITYCODE;
	private Integer LOCATIONCODE;
	private String ACTIVITYTYPE;
	private String ACTIVITYNAME;
	private String ACTIVITYINFOMATION;
	private String ACTIVITYIMAGE;
	private String LOCATIONCITY;
}
