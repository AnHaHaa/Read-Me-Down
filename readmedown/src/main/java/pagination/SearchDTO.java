package pagination;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SearchDTO {
	private int page; // 현재 페이지 번호
	private int recordSize; // 페이지당 출력할 데이터 개수
	private int pageSize; // 화면 하단에 출력할 페이지 사이즈
	
	private String keyword; // 검색 키워드
	private String searchType1; // 검색조건1 - category
	private String searchType2; // 검색조건2 - townid
	private String searchType3; // 검색조건3 - 검색유형(전체,작성자,제목,내용)

	private String sortType; // 정렬유형
	
	private Pagination pagination; // 페이지네이션 정보

	public SearchDTO() {
		this.page = 1;
		this.recordSize = 10;
		this.pageSize = 10;
	}
	

}
