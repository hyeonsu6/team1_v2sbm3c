package dev.mvc.alogin;

public class AloginVO {
  /*
   * aloginno    NUMBER(10)    NOT NULL PRIMARY KEY, 
   * adminno     NUMBER(10)    NOT NULL,   -- FK 
   * ip          VARCHAR2(15)  NOT NULL, 
   * logindate   DATE          NOT NULL
   */

  private int aloginno;
  private int adminno;
  private String ip = "";
  private String logindate = "";

  public int getAloginno() {
    return aloginno;
  }

  public void setAloginno(int aloginno) {
    this.aloginno = aloginno;
  }

  public int getAdminno() {
    return adminno;
  }

  public void setAdminno(int adminno) {
    this.adminno = adminno;
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
    return "AloginVO [aloginno=" + aloginno + ", adminno=" + adminno + ", ip=" + ip + ", logindate=" + logindate + "]";
  }
}
