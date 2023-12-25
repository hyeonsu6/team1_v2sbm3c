package dev.mvc.freview_reply;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.freview.FreviewProcInter;
import dev.mvc.member.MemberProcInter;
import dev.mvc.tool.Tool;

@Controller
public class Freview_replyCont {
  @Autowired
  @Qualifier("dev.mvc.freview_reply.Freview_replyProc")
  private Freview_replyProcInter freview_replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.freview.FreviewProc")
  private FreviewProcInter freviewProc;
  
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/freview_reply/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 등록 폼
   * @param session
   * @param reviewno
   * @return
   */
  //http://localhost:9093/freview_reply/create.do?questno=1
  @RequestMapping(value="/freview_reply/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session, int reviewno) {
    ModelAndView mav = new ModelAndView();

    Freview_replyVO freview_replyVO = this.freview_replyProc.read(reviewno);
    mav.addObject("freview_replyVO", freview_replyVO);
    
    mav.setViewName("/freview_reply/create"); // /webapp/WEB-INF/views/freview_reply/create.jsp

    return mav;
  }
 
   /**
    * 등록 처리 http://localhost:9093/freview_reply/create.do
    * 
    * @return
    */
  @RequestMapping(value="/freview_reply/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, HttpSession session, Freview_replyVO freview_replyVO) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = 0;
    if(memberProc.isMember(session)) { // 로그인 한 경우
      memberno = (int)session.getAttribute("memberno");
      
      int cnt = this.freview_replyProc.create(freview_replyVO);
      
      if(cnt == 1) {
        mav.addObject("code", "reply_success");
      } else {
        mav.addObject("code", "reply_fail");
      }
      
      mav.addObject("cnt", cnt);
      mav.addObject("replyno", freview_replyVO.getReplyno());
        
      //mav.addObject("url", "/freview_reply/msg");
      mav.setViewName("redirect:/freview/read.do?reviewno=" + freview_replyVO.getReviewno());
      
    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/member/login_need.jsp
      mav.setViewName("redirect:/freview_reply/msg.do");
    }

    return mav;
  }
  
  /**
   * 조회
   * @param replyno
   * @return
   */
  @RequestMapping(value = "/freview_reply/read.do", method = RequestMethod.GET)
  public ModelAndView read(int replyno) {
    ModelAndView mav = new ModelAndView();
    
    Freview_replyVO freview_replyVO = this.freview_replyProc.read(replyno);
    
    String id = freview_replyVO.getId();
    String reply = freview_replyVO.getReply();
    String passwd = freview_replyVO.getPasswd();
    
    id = Tool.convertChar(id);
    reply = Tool.convertChar(reply);
    passwd = Tool.convertChar(passwd);
    
    freview_replyVO.setId(id);
    freview_replyVO.setReply(reply);
    freview_replyVO.setPasswd(passwd);
    
    mav.addObject("freview_replyVO", freview_replyVO);
    
    return mav;
  }

  /**
   * 삭제 처리 http://localhost:9093/freview_reply/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/freview_reply/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int replyno, String passwd) {
    //public ModelAndView delete(Freview_replyVO freview_replyVO) {
    
    System.out.println("--> reply delete");
    System.out.println("--> replyno: " + replyno);
    System.out.println("--> passwd: " + passwd);
    
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("replyno", replyno);
    hashMap.put("passwd", passwd);
    
    Freview_replyVO freview_replyVO = this.freview_replyProc.read(replyno);
    System.out.println("-> replyVO" + freview_replyVO);
    
    boolean isPasswd = this.freview_replyProc.passwdCheck(replyno, passwd);
    int cnt = 0;
    System.out.println("--> isPasswd: " + isPasswd);
    
    if(isPasswd) {
      //cnt = this.freview_replyProc.delete(replyno, passwd); // DBMS 삭제
      cnt = this.freview_replyProc.delete(hashMap); // DBMS 삭제
      System.out.println("--> cnt: " + cnt);
      if(cnt == 1) {
        mav.addObject("code", "reply_delete_success");
      } else {
        mav.addObject("code", "reply_delete_fail");
      }
    } else {
      mav.addObject("code", "reply_passwd_fail");
    }

    mav.addObject("replyno", freview_replyVO.getReplyno());
    mav.setViewName("redirect:/freview/read.do?reviewno=" + freview_replyVO.getReviewno());
    
    return mav;
  }
  
  
}
