package dev.mvc.frecommend;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.fcate.FcateProcInter;
import dev.mvc.fcate.FcateVO;
import dev.mvc.member.MemberProcInter;

public class RecommendCont {
	@Autowired
	@Qualifier("dev.mvc.fcate.FcateProc") // @Component("dev.mvc.fcate.FcateProc")
	private FcateProcInter fcateProc;

	@Autowired
	@Qualifier("dev.mvc.member.MemberProc") // @Component("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;

	@Autowired
	@Qualifier("dev.mvc.admin.AdminProc") // @Component("dev.mvc.admin.AdminProc")
	private AdminProcInter AaminProc;

	@Autowired
	@Qualifier("dev.mvc.frecommend.RecommendProc") // @Component("dev.mvc.frecommend.RecommendProc")
	private RecommendProcInter recommendProc;

	public RecommendCont() {
		System.out.println("-> RecommendCont created.");
	}

	/**
	 * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근 POST → url → GET →
	 * 데이터 전송
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/msg.do", method = RequestMethod.GET)
	public ModelAndView msg(String url) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName(url); // forward

		return mav; // forward
	}

	// 등록 폼, festival 테이블은 FK로 fcateno를 사용함.
	// http://localhost:9093/frecommend/create.do X
	// http://localhost:9093/frecommend/create.do?fcateno=1
	// http://localhost:9093/frecommend/create.do?fcateno=2
	// http://localhost:9093/frecommend/create.do?fcateno=3
	@RequestMapping(value = "/frecommend/create.do", method = RequestMethod.GET)
	public ModelAndView create(int memberno, int fcateno) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/frecommend/create"); // /webapp/WEB-INF/views/frecommend/create.jsp

		return mav;
	}

	/**
	 * 등록 처리 http://localhost:9093/frecommend/create.do?fcateno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/create.do", method = RequestMethod.POST)
	public ModelAndView create(HttpSession session, RecommendVO recommendVO) {
		ModelAndView mav = new ModelAndView();

		if (memberProc.isMember(session)) { // 회원으로 로그인한경우

			mav.addObject("url", "/frecommend/msg"); //
			mav.setViewName("redirect:/frecommend/msg.do");

		} else {
			mav.addObject("url", "/member/login_need");
			mav.setViewName("redirect:/frecommend/msg.do");
		}

		return mav; // forward
	}

	/**
	 * 전체 목록 http://localhost:9093/frecommend/list_all.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/list_all.do", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/frecommend/list_all"); // /WEB-INF/views/frecommend/list_all.jsp

		ArrayList<RecommendVO> list = this.recommendProc.list_all();
		mav.addObject("list", list);

		return mav;
	}

	/**
	 * 파일 삭제 폼 http://localhost:9093/frecommend/delete.do?recommendno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(HttpSession session, int recommendno) {
		ModelAndView mav = new ModelAndView();

		if (memberProc.isMember(session)) { // 회원으로 로그인한경우
			RecommendVO recommendVO = this.recommendProc.read(recommendno);
			mav.addObject("recommendVO", recommendVO);

			FcateVO fcateVO = this.fcateProc.read(recommendVO.getFcateno());
			mav.addObject("fcateVO", fcateVO);

			mav.setViewName("/frecommend/delete"); // /WEB-INF/views/frecommend/delete.jsp

		} else {
			mav.addObject("url", "/member/login_need"); // /WEB-INF/views/member/login_need.jsp
			mav.setViewName("redirect:/frecommend/msg.do");
		}

		return mav; // forward
	}

	// 삭제 처리, 수정 처리를 복사하여 개발
	// 자식 테이블 레코드 삭제 -> 부모 테이블 레코드 삭제
	/**
	 * 카테고리 삭제
	 * 
	 * @param session
	 * @param fcateno 삭제할 카테고리 번호
	 * @return
	 */
	@RequestMapping(value = "/frecommend/delete.do", method = RequestMethod.POST)
	public ModelAndView delete_proc(HttpSession session, int fcateno) { // <form> 태그의 값이 자동으로 저장됨
		ModelAndView mav = new ModelAndView();

		if (this.memberProc.isMember(session) == true) {
			ArrayList<RecommendVO> list = this.recommendProc.list_all();

			int cnt = this.fcateProc.delete(fcateno);

			if (cnt == 1) {
				mav.setViewName("redirect:/index.do");

			} else {
				mav.addObject("code", "delete_fail");
				mav.setViewName("/frecommend/msg");
			}

			mav.addObject("cnt", cnt);

		} else {
			mav.setViewName("/member/login_need");
		}

		return mav;
	}
}
