package dev.mvc.likes;

public class LikesVO {

	/*
	 * likesno NUMBER(10) NOT NULL PRIMARY KEY, contentsno NUMBER(10) NULL ,
	 * memberno NUMBER(10) NULL , rdate DATE NOT NULL
	 */

	private int likesno;
	private int contentsno;
	private int memberno;
	private String rdate;

	public int getLikesno() {
		return likesno;
	}

	public void setLikesno(int likesno) {
		this.likesno = likesno;
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
		return "LikesDAOInter [likesno=" + likesno + ", contentsno=" + contentsno + ", memberno=" + memberno
				+ ", rdate=" + rdate + "]";
	}
}
