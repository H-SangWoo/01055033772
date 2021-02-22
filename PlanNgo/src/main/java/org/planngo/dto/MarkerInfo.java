package org.planngo.dto;

import java.util.List;

import org.planngo.domain.ActivityVO;
import org.planngo.domain.LocationVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MarkerInfo {
	private List<LocationVO> city;
	private List<ActivityVO> activity;

}
