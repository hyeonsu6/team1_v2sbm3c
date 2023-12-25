package dev.mvc.freview_reply;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import dev.mvc.freview.FreviewVO;
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
   * 회원별 댓글 목록
   * 
   * @return
   */
  @RequestMapping(value = "/freview_reply/list_by_id.do", method = RequestMethod.GET)
  public ModelAndView list_by_id(HttpSession session, String id) {
    System.out.println("--> list_by_id");
    ModelAndView mav = new ModelAndView();

    boolean isMember = memberProc.isMember(session); 
    if(isMember) {
      mav.setViewName("/freview_reply/list_by_id"); // /WEB-INF/views/freview_reply/list_by_id.jsp

      ArrayList<Freview_replyVO> list = this.freview_replyProc.list_by_id(id);
      List<String> titles = new ArrayList<>(); //댓글 별 리뷰 제목 저장
      
      // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
      for (Freview_replyVO freview_replyVO : list) {
        String getid = freview_replyVO.getId();
        String reply = freview_replyVO.getReply();
        String rdate = freview_replyVO.getRdate();
        
        FreviewVO freviewVO = freviewProc.read(freview_replyVO.getReviewno());
        String title = freviewVO.getTitle();

        getid = Tool.convertChar(getid); // 특수 문자 처리
        reply = Tool.convertChar(reply);
        rdate = Tool.convertChar(rdate);
        title = Tool.convertChar(title);

        freview_replyVO.setId(getid);
        freview_replyVO.setReply(reply);
        freview_replyVO.setRdate(rdate);
        
        titles.add(title);
      }
      mav.addObject("titles", titles);
      mav.addObject("list", list);
    } else {
      mav.setViewName("/member/login_need");
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
   * 수정 처리 http://localhost:9093/freview_reply/update_reply.do?replyno=1
   * 
   * @return
   */
  @RequestMapping(value = "/freview_reply/update_reply.do", method = RequestMethod.POST)
  //public ModelAndView update_reply(HttpSession session, Freview_replyVO freview_replyVO) {
  public ModelAndView update_reply(HttpSession session, int replyno, String reply, String passwd) {
    ModelAndView mav = new ModelAndView();
    Freview_replyVO freview_replyVO = this.freview_replyProc.read(replyno);
    freview_replyVO.setReply(reply);
    freview_replyVO.setPasswd(passwd);
    
    if (this.memberProc.isMember(session)) { // 회원 로그인 확인
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("replyno", freview_replyVO.getReplyno());

      int cnt = this.freview_replyProc.update_reply(freview_replyVO); // 글 수정
      
      //System.out.println("-> freview_replyVO.getReviewno(): " + freview_replyVO.getReviewno());

      // mav 객체 이용
      mav.addObject("replyno", freview_replyVO.getReplyno());
      mav.addObject("reply", freview_replyVO.getReply());
      mav.setViewName("redirect:/freview/read.do?reviewno=" + freview_replyVO.getReviewno());
    } else { // 정상적인 로그인이 아닌 경우 로그인 유도
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
      mav.setViewName("redirect:/question/msg.do");
    }

    // mav.addObject("now_page", questionVO.getNow_page()); // POST -> GET: 데이터 분실이
    // 발생함으로 다시하번 데이터 저장

    return mav; // forward
  }

  /**
   * 삭제 처리 http://localhost:9093/freview_reply/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/freview_reply/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int replyno, String passwd) {
    //public ModelAndView delete(Freview_replyVO freview_replyVO) {
    
    //System.out.println("--> reply delete");
    //System.out.println("--> replyno: " + replyno);
    //System.out.println("--> passwd: " + passwd);
    
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("replyno", replyno);
    hashMap.put("passwd", passwd);
    
    Freview_replyVO freview_replyVO = this.freview_replyProc.read(replyno);
    //System.out.println("-> replyVO" + freview_replyVO);
    
    boolean isPasswd = this.freview_replyProc.passwdCheck(replyno, passwd);
    int cnt = 0;
    //System.out.println("--> isPasswd: " + isPasswd);
    
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
