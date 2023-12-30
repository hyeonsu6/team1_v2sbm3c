package dev.mvc.answer;

public class AnswerVO {
	/*
 	ansno       NUMBER(10)      NOT NULL,
    questno     NUMBER(10)      NOT NULL,  -- FK
    ans         VARCHAR(300)    NOT NULL,
    adminno     NUMBER(5)       NOT NULL,  -- FK
    rdate       DATE            NOT NULL,
    FOREIGN KEY (questno) REFERENCES QUESTION (questno),
    FOREIGN KEY (adminno) REFERENCES ADMIN (adminno),
    PRIMARY KEY (ansno)
	 */
  private int ansno;
  private int questno;
  private String ans = "";
  private int adminno;
  private String rdate = "";
  
  public int getAnsno() {
    return ansno;
  }
  public void setAnsno(int ansno) {
    this.ansno = ansno;
  }
  public int getQuestno() {
    return questno;
  }
  public void setQuestno(int questno) {
    this.questno = questno;
  }
  public String getAns() {
    return ans;
  }
  public void setAns(String ans) {
    this.ans = ans;
  }
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  @Override
  public String toString() {
    return "AnswerVO [ansno=" + ansno + ", questno=" + questno + ", ans=" + ans + ", adminno=" + adminno + ", rdate="
        + rdate + "]";
  }
}
