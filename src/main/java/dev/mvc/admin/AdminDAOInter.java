package dev.mvc.admin;

public interface AdminDAOInter {
  /**
   * 관리자 로그인
   * 
   * @param AdminVO
   * @return
   */
  public int login(AdminVO adminVO);
  
  /**
   * 관리자 정보 조회
   * 
   * @param String
   * @return
   */
  public AdminVO read_by_id(String id);
  
  /**
   * 특정 관리자 정보
   * 
   * @param admino
   * @return
   */
  public AdminVO read(int admino);
  
}
