package dev.mvc.freview_reply;

/*CREATE TABLE FREVIEW_REPLY(
    REPLYNO NUMERIC(10) NOT NULL PRIMARY KEY,
    reviewno NUMBER(10),
    id VARCHAR(30) NOT NULL,
    REPLY VARCHAR(150) NOT NULL,
    PASSWD VARCHAR(10) NOT NULL,
    RDATE DATE NOT NULL,
  FOREIGN KEY (id) REFERENCES MEMBER (id),
  FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno)
);*/
public class Freview_replyVO {
  private int replyno;
  private int reviewno;
  private String id = "";
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
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
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
    return "Freview_replyVO [replyno=" + replyno + ", reviewno=" + reviewno + ", id=" + id + ", reply="
        + reply + ", passwd=" + passwd + ", rdate=" + rdate + "]";
  }
}
