package dev.mvc.freview_reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.answer.AnswerVO;
import dev.mvc.freview.FreviewProcInter;
import dev.mvc.member.MemberProcInter;

public class Freview_replyCont {
  @Autowired
  @Qualifier("dev.mvc.member.Freview_reply")
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
    if(memberProc.isMember(session) || adminProc.isAdmin(session)) { // 로그인 한 경우
      if (this.memberProc.isMember(session)) { // 회원으로 로그인
        memberno = (int) session.getAttribute("memberno");
      } else if (this.adminProc.isAdmin(session)) { // 관리자로 로그인
        memberno = (int) session.getAttribute("adminno");
      }
      
      int cnt = this.freview_replyProc.create(freview_replyVO);
      
      if(cnt == 1) {
        mav.addObject("code", "create_success");
      } else {
        mav.addObject("code", "create_fail");
      }
      
      mav.addObject("cnt", cnt);
      mav.addObject("replyno", freview_replyVO.getReplyno());

      mav.addObject("url", "/freview_reply/msg");
      mav.setViewName("redirect:/freview_reply/msg.do");
      
    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/member/login_need.jsp
      mav.setViewName("redirect:/freview_reply/msg.do");
    }

    return mav;
  }
  
  
}
