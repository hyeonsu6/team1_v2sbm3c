package dev.mvc.freview_reply;

/*CREATE TABLE FREVIEW_REPLY(
    REPLYNO NUMERIC(10) NOT NULL PRIMARY KEY,
    reviewno NUMBER(10),
    MEMBERNO NUMERIC(10) NOT NULL,
    REPLY VARCHAR(150) NOT NULL,
    PASSWD VARCHAR(10) NOT NULL,
    RDATE DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno)
);*/
public class Freview_replyVO {
  private int replyno;
  private int reviewno;
  private int memberno;
  private String reply = "";
  private String passwd = "";
  private String rdate = "";
  
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
  }
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getReply() {
    return reply;
  }
  public void setReply(String reply) {
    this.reply = reply;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  @Override
  public String toString() {
    return "Freview_replyVO [replyno=" + replyno + ", reviewno=" + reviewno + ", memberno=" + memberno + ", reply="
        + reply + ", passwd=" + passwd + ", rdate=" + rdate + "]";
  }
}
