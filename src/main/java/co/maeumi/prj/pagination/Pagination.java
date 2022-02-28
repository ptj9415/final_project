package co.maeumi.prj.pagination;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pagination {


	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end, next, prev;
	private int cntPage = 5;
	private String gc_date;
	private String gc_startdate;
	private String gc_finaldate;
	private String gc_title;
	private String gc_status;
	private String gc_type;
	
	public Pagination(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		calcNext(nowPage, getLastPage());
		calcPrev(nowPage, getStartPage());
	}
	public void calcNext(int nowPage, int lastPage) {
		if (lastPage<=nowPage) {
			setNext(lastPage);
		}else {
			setNext(nowPage+1);
		}
	}
	public void calcPrev(int nowPage, int startPage) {
		if (startPage >= nowPage) {
			setPrev(startPage);
		}else {
			setPrev(nowPage-1);
		}
	}
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}	
	public int setCntPage() {
		return cntPage;
	}
	public void getCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public String getGc_date() {
		return gc_date;
	}
	public void setGc_date(String gc_date) {
		this.gc_date = gc_date;
	}
	public String getGc_startdate() {
		return gc_startdate;
	}
	public void setGc_startdate(String gc_startdate) {
		this.gc_startdate = gc_startdate;
	}
	public String getGc_finaldate() {
		return gc_finaldate;
	}
	public void setGc_finaldate(String gc_finaldate) {
		this.gc_finaldate = gc_finaldate;
	}
	public String getGc_title() {
		return gc_title;
	}
	public void setGc_title(String gc_title) {
		this.gc_title = gc_title;
	}
	public String getGc_status() {
		return gc_status;
	}
	public void setGc_status(String gc_status) {
		this.gc_status = gc_status;
	}
	public Pagination() {	
	}
	public String getGc_type() {
		return gc_type;
	}
	public void setGc_type(String gc_type) {
		this.gc_type = gc_type;
	}
	@Override
	public String toString() {
		return "Pagination [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + "]";
	}
}