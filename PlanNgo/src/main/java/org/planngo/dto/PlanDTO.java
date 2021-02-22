package org.planngo.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlanDTO {
	private int USRCODE;
	private String PLANCODE;
	private String PLANTITLE;
	private String PLANSTARTDATE;
	private String PLANENDDATE;
	private List<DayDTO> DAYS;
	
}
