package dev.mvc.recommend;

public class RecommendVO {
	private int recommendno;
	private int memberno;
	private int fcateno;
	private int seq;
	private String rdate;
	private String mname;

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

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Override
	public String toString() {
		return "RecommendVO [recommendno=" + recommendno + ", memberno=" + memberno + ", fcateno=" + fcateno + ", seq="
				+ seq + ", rdate=" + rdate + ", mname=" + mname + "]";
	}

}
