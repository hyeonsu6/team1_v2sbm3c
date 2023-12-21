package dev.mvc.freview_reply;

import java.util.ArrayList;

public interface Freview_replyProcInter {
  /**
   * 댓글 등록
   * @param freview_replyVO
   * @return
   */
  public int create(Freview_replyVO freview_replyVO);
  
  /**
   * 댓글 목록
   * @return
   */
  public ArrayList<Freview_replyVO> list_all();
  
  /**
   * 리뷰 별 댓글
   * @param reviewno
   * @return
   */
  public ArrayList<Freview_replyVO> list_by_reviewno(int reviewno);
  
  /**
   * 댓글 조회
   * @param replyno
   * @return
   */
  public Freview_replyVO read(int replyno);
  
  /**
   * 댓글 수정
   * @param freview_replyVO
   * @return
   */
  public int update_reply (Freview_replyVO freview_replyVO);
  
  /**
   * 댓글 삭제
   * @param replyno
   * @return
   */
  public int delete(int replyno);
}
