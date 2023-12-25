package dev.mvc.festival_likes;

public class Festival_likeVO {
	/*
	 * likesno NUMBER(10) NOT NULL PRIMARY KEY, contentsno NUMBER(10) NULL ,
	 * memberno NUMBER(10) NULL , likescheck NUMBER DEFAULT 0 NOT NULL, replyno
	 * NUMBER(10) NOT NULL, rdate DATE NOT NULL,
	 */

	private int likesno;
	private int memberno;
	private int contentsno;
	private int likescheck; // 좋아요 상태를 나타내는 필드 추가
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

	public int getLikescheck() {
		return likescheck;
	}

	public void setLikescheck(int likescheck) {
		this.likescheck = likescheck;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "Festival_likeVO [likesno=" + likesno + ", contentsno=" + contentsno + ", memberno=" + memberno
				+ ", likescheck=" + likescheck + ", rdate=" + rdate + "]";
	}
}
