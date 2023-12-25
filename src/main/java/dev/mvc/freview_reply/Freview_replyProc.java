package dev.mvc.freview_reply;

import java.util.ArrayList;
import java.util.HashMap;

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
  public ArrayList<Freview_replyVO> list_by_id(String id) {
    ArrayList<Freview_replyVO> list = this.freview_replyDAO.list_by_id(id);
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
//  public int delete(int replyno, String passwd) {
  public int delete(HashMap<String, Object> map) {
    //int cnt = this.freview_replyDAO.delete(replyno, passwd);
    int cnt = this.freview_replyDAO.delete(map);
    return cnt;
  }
  
  @Override
  public boolean passwdCheck(int replyno, String passwd) {
    Freview_replyVO replyVO = this.freview_replyDAO.read(replyno);
    boolean isPasswd = false;
    
    System.out.println("--> passwdCheck replyVO: " + replyVO);
    
    if(passwd.equals(replyVO.getPasswd())) {
      isPasswd = true;
    } else {
      isPasswd = false;
    }
    
    return isPasswd;
  }
}
