package dev.mvc.frecommend;

public class RecommendVO {
	private int recommendno;
	private int memberno;
	private int fcateno;
	private int seq;
	private int rdate;
	
	public int getRecommendno() {
		return recommendno;
	}
	public void setRecommendno(int recommendno) {
		this.recommendno = recommendno;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public int getFcateno() {
		return fcateno;
	}
	public void setFcateno(int fcateno) {
		this.fcateno = fcateno;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getRdate() {
		return rdate;
	}
	public void setRdate(int rdate) {
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "RecommendVO [recommendno=" + recommendno + ", memberno=" + memberno + ", fcateno=" + fcateno + ", seq="
				+ seq + ", rdate=" + rdate + "]";
	}

}
