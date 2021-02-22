package org.planngo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data 
@AllArgsConstructor
public class Criteria {
	private int page;
	// 한페이지당 들어갈 게시글
	private int perPageNum;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	//method for MyBatis SQL Mapper - 
	public int getPageStart() {

		return (this.page - 1) * perPageNum;
	}

}
