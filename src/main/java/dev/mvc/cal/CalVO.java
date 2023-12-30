package dev.mvc.cal;

public class CalVO {
	/*
	 calno 		NUMBER 			NOT NULL 	PRIMARY KEY,     -- 일정 번호
     title 		VARCHAR2(200) 	NOT NULL,          			 -- 일정 제목
     memo 		CLOB 			NULL,                        -- 상세 내용
     calstart 	VARCHAR2(10) 	NOT NULL,        			 -- 시작일
     calend 	VARCHAR2(10) 	NULL               			 -- 종료일
	 */
	private int calno;
	private String title = "";
	private String memo = "";
	private String calstart = "";
	private String calend = "";

	public int getCalno() {
		return calno;
	}

	public void setCalno(int calno) {
		this.calno = calno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCalstart() {
		return calstart;
	}

	public void setCalstart(String calstart) {
		this.calstart = calstart;
	}

	public String getCalend() {
		return calend;
	}

	public void setCalend(String calend) {
		this.calend = calend;
	}

	@Override
	public String toString() {
		return "CalVO [calno=" + calno + ", title=" + title + ", memo=" + memo + ", calstart=" + calstart + ", calend="
				+ calend + "]";
	}
}
