package dev.mvc.mlogin;

public class MloginVO {
	/*
	 * mloginno NUMBER(10) NOT NULL PRIMARY KEY, 
	 * memberno NUMBER(10) NOT NULL, 
	 * ip		VARCHAR2(15) NOT NULL, 
	 * logindate DATE NOT NULL
	 */
	
	private int mloginno;
	private int memberno;
	private String ip;
	private String logindate;
	
	public int getMloginno() {
		return mloginno;
	}
	public void setMloginno(int mloginno) {
		this.mloginno = mloginno;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getLogindate() {
		return logindate;
	}
	public void setLogindate(String logindate) {
		this.logindate = logindate;
	}
	
	@Override
	public String toString() {
		return "MloginDAOInter [mloginno=" + mloginno + ", memberno=" + memberno + ", ip=" + ip + ", logindate="
				+ logindate + "]";
	}

}

