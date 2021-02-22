package org.planngo.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	// toString, getter, setter

@NoArgsConstructor
@AllArgsConstructor
public class ScheduleDTO {

	private int PLANSCHEDULECODE;
	private int DAYSCODE;
	private int LOCATIONCODE;
	private int PLANSCHEDULEORDER;
	private List<BucketListDTO> BUCKETLIST;
}
