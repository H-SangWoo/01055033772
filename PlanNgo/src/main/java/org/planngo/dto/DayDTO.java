package org.planngo.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	// toString, getter, setter

@NoArgsConstructor
@AllArgsConstructor
public class DayDTO {
	
	private int DAYSCODE;
	private int PLANCODE;
	private int DAY;
	private List<ScheduleDTO> PLANSCHEDULELIST;
}
