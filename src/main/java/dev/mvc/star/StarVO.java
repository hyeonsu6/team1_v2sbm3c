package dev.mvc.star;

public class StarVO {
	/*
	 * starno 		NUMBER(10) 	NOT NULL PRIMARY KEY, 
	 * star 		NUMBER(1) 	NOT NULL, 
	 * contentsno 	NUMBER(10) 	NULL , 
	 * memberno 	NUMBER(10) 	NULL, 
	 * rdate 		DATE 		NOT NULL,
	 */

	private int starno;
	private int star;
	private int contentsno;
	private int memberno;
	private String rdate = "";
	
	public int getStarno() {
		return starno;
	}
	public void setStarno(int starno) {
		this.starno = starno;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getContentsno() {
		return contentsno;
	}
	public void setContentsno(int contentsno) {
		this.contentsno = contentsno;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "StarVO [starno=" + starno + ", star=" + star + ", contentsno=" + contentsno + ", memberno=" + memberno
				+ ", rdate=" + rdate + "]";
	}
	
}
