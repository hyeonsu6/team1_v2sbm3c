package dev.mvc.freview_reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.freview_reply.Freview_replyProc")
public class Freview_replyProc implements Freview_replyProcInter {
  @Autowired
  private Freview_replyDAOInter freview_replyDAO;

  @Override
  public int create(Freview_replyVO freview_replyVO) {
    int cnt = this.freview_replyDAO.create(freview_replyVO);
    return cnt;
  }

  @Override
  public ArrayList<Freview_replyVO> list_all() {
    ArrayList<Freview_replyVO> list = this.freview_replyDAO.list_all();
    return list;
  }

  @Override
  public ArrayList<Freview_replyVO> list_by_reviewno(int reviewno) {
    ArrayList<Freview_replyVO> list = this.freview_replyDAO.list_by_reviewno(reviewno);
    return list;
  }

  @Override
  public Freview_replyVO read(int replyno) {
    Freview_replyVO freview_replyVO = this.freview_replyDAO.read(replyno);
    return freview_replyVO;
  }

  @Override
  public int update_reply(Freview_replyVO freview_replyVO) {
    int cnt = this.freview_replyDAO.update_reply(freview_replyVO);
    return cnt;
  }

  @Override
  public int delete(int replyno) {
    int cnt = this.freview_replyDAO.delete(replyno);
    return cnt;
  }
}
