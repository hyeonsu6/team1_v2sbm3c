package dev.mvc.admin;

public class AdminVO {
  /*
    adminno  NUMBER(5)    NOT NULL, PRIMARY KEY      -- 관리자 번호, 중복 안됨
    id       VARCHAR(20)  NOT NULL UNIQUE,           -- 아이디, 중복 안됨, 레코드를 구분 
    passwd   VARCHAR(15)  NOT NULL,                  -- 패스워드, 영숫자 조합
    mname    VARCHAR(20)  NOT NULL,                  -- 성명, 한글 10자 저장 가능
    mdate    DATE         NOT NULL,                  -- 가입일    
    grade    NUMBER(2)    NOT NULL,                  -- 등급(1~10: 관리자, 정지 관리자: 20, 탈퇴 관리자: 99)    
   */
  private int adminno;
  private String id = "";
  private String passwd = "";
  private String mname = "";
  private String mdate = "";
  private int grade;

  public int getAdminno() {
    return adminno;
  }

  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

  public String getMname() {
    return mname;
  }

  public void setMname(String mname) {
    this.mname = mname;
  }

  public String getMdate() {
    return mdate;
  }

  public void setMdate(String mdate) {
    this.mdate = mdate;
  }

  public int getGrade() {
    return grade;
  }

  public void setGrade(int grade) {
    this.grade = grade;
  }

  @Override
  public String toString() {
    return "AdminVO [adminno=" + adminno + ", id=" + id + ", passwd=" + passwd + ", mname=" + mname + ", mdate="
        + mdate + ", grade=" + grade + "]";
  }

}
