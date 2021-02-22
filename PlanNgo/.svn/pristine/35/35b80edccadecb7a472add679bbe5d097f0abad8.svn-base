package org.planngo.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageMaker {
	
	private PlanSearchCriteria planSearchCriteria;
	private Criteria cri;
	private int totalCount;
	private int startPage;
	private int endPage;

	private boolean next;
	private boolean prev;

	
	// Number of Pages
	
	@Builder.Default private int displayPageNum =4;
	
	
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		 calcData(); 

	}

	// 시작 페이지와, 끝나는 페이지 설정, NEXT 와 PREV 가 있는지 없는지 확인
	private void calcData() {
		// 끝나는 페이지는 = (사용자의 현재 페이지 / 페이징 페이지 수) * 페이징 페이지수
		endPage = (int) ((Math.ceil(cri.getPage() / (double) displayPageNum)) * displayPageNum);
		System.out.println(cri.getPage());
		System.out.println(displayPageNum);
		System.out.println("야야야야야 =" + ((cri.getPage() / (double) displayPageNum)));
		startPage = (endPage - displayPageNum) + 1;
		
			
		// Considering with the number of data
		// tempEndPage = 테이블에 있는 데이터의수/페이지당 보여지는 게시글수
		int tempEndPage = (int) (Math.ceil(totalCount /  (double)cri.getPerPageNum()));
		
		

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
			
		}
		System.out.println("야야야 = " + endPage);
		// 이전 버튼은 시작 페이지 번호가 1이 아니면 true.
		prev = startPage == 1 ? false : true;

		// 다음버튼 생성 여부 = 끝페이지번호 *페이지당 게시글 >= 총게시글의수
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	}


	public void getStartpage(int startPage) {
		this.startPage = startPage;
	}
// 검색할떄 page = 1, perPageNum = 5 설정
	public String makeQuery(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();

		return uriComponents.toUriString();
	}

//" ?page=3&perPageNum=20&agencyType=TC&keyword=%EC%83%88%EB%A1%9C " UriComponents 는 이런식으로 url 을 만들어줌. 
//페이지번호 누르면 
	public String pMakeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("agencyType", ((PackageSearchCriteria)cri).getAgencyType())
				.queryParam("startPrice", ((PackageSearchCriteria)cri).getStartPrice())
				.queryParam("startDate", ((PackageSearchCriteria)cri).getStartDate())
				.queryParam("endDate", ((PackageSearchCriteria)cri).getEndDate())

				.build();

		return uriComponents.toUriString();
	}

	public String faqSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((faqSearchCriteria)cri).getSearchType())
				.queryParam("keyword", ((faqSearchCriteria)cri).getKeyword())
	

				.build();

		return uriComponents.toUriString();
	}

	public String nMakeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((nSearchCriteria)cri).getSearchType())
				.queryParam("keyword",((nSearchCriteria)cri).getKeyword())
				
				.build();
		
		return uriComponents.toUriString();
				
	}
	
	public String plannerMakeSearch(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((PlanSearchCriteria)cri).getSearchType())
				.queryParam("keyword", ((PlanSearchCriteria)cri).getKeyword())
				.build();
		
		return uriComponents.toUriString();
	}
	

}
