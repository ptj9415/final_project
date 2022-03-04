package co.maeumi.prj.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int page, startPage, endPage, listCnt, pageCnt, start, end, range, startList;
	private int listSize = 10; // 초기값으로 목록개수를 10으로 셋팅 한 페이지당 보여질 리스트의 개수
	private int rangeSize = 5; // 초기값으로 페이지범위를 5로 셋팅 한 페이지 범위에 보여질 페이지의 개수
	private boolean prev;
	private boolean next;
	
	public Paging() {}
	
	public void pageinfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		// 전체 페이지수
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		this.endPage = range * rangeSize;

		// 게시판 시작번호
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		
		this.end = page * listSize;
		
		this.start = getEnd() - listSize + 1;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public void setNext(boolean next) {
		this.next = next;
	}

}