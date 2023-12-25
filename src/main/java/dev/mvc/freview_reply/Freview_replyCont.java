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
import dev.mvc.fcate.FcateVO;
import dev.mvc.freview.FreviewProcInter;
import dev.mvc.member.MemberProcInter;
import dev.mvc.question.QuestionVO;

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
    
    System.out.println("--> reply create");
    
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
   * 파일 삭제 폼 http://localhost:9093/freview_reply/delete.do?questno=17
   * 
   * @return
   */
  @RequestMapping(value = "/freview_reply/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int replyno) {
    ModelAndView mav = new ModelAndView();

    if (memberProc.isMember(session)) { // 회원 로그인 경우
      Freview_replyVO freview_replyVO = this.freview_replyProc.read(replyno);
      mav.addObject("freview_replyVO", freview_replyVO);

      mav.setViewName("/freview_reply/delete"); // /WEB-INF/views/question/delete.jsp

    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/member/login_need.jsp
      mav.setViewName("redirect:/freview_reply/msg.do");
    }

    return mav; // forward
  }

  /**
   * 삭제 처리 http://localhost:9093/freview_reply/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/freview_reply/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int replyno) {
    //public ModelAndView delete(Freview_replyVO freview_replyVO) {
    
    System.out.println("--> reply delete");
    
    ModelAndView mav = new ModelAndView();
    
    Freview_replyVO freview_replyVO = this.freview_replyProc.read(replyno); 
    
    // QuestionVO questionVO_read = questionProc.read(questionVO.getQuestno());
    this.freview_replyProc.delete(freview_replyVO.getReplyno()); // DBMS 삭제

    mav.addObject("replyno", freview_replyVO.getReplyno());

    // mav.addObject("now_page", now_page);
    // mav.setViewName("redirect:/question/list_by_tcateno.do");

    mav.setViewName("redirect:/freview/read.do?reviewno=" + freview_replyVO.getReviewno());
    
    return mav;
  }
  
  
}
