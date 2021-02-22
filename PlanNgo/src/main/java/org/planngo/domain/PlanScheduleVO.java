package org.planngo.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	// toString, getter, setter
@NoArgsConstructor
@AllArgsConstructor
public class PlanScheduleVO {
	
	private int PLANSCHEDULECODE;
	private int DAYSCODE;
	private int LOCATIONCODE;
	private String LOCATIONCITY;
	private int PLANSCHEDULEORDER;
	private List<BucketListVO> BUCKETLISTS;
}
