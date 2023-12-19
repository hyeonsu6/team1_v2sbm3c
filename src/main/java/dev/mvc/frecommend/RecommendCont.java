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
import dev.mvc.festival.FestivalVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.tool.Tool;

public class RecommendCont {
	@Autowired
	@Qualifier("dev.mvc.fcate.FcateProc") // @Component("dev.mvc.fcate.FcateProc")
	private FcateProcInter fcateProc;

	@Autowired
	@Qualifier("dev.mvc.member.MemberProc") // @Component("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;

	@Autowired
	@Qualifier("dev.mvc.admin.AdminProc") // @Component("dev.mvc.admin.AdminProc")
	private AdminProcInter adminProc;

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
	 * 등록 처리 http://localhost:9093/frecommend/create.do
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
	public ModelAndView list_all(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (this.adminProc.isAdmin(session) == true) {
			mav.setViewName("/frecommend/list_all"); // /WEB-INF/views/frecommend/list_all.jsp

			ArrayList<RecommendVO> list = this.recommendProc.list_all();
			mav.addObject("list", list);

		} else {
			mav.setViewName("/admin/login_need"); // /WEB-INF/views/admin/login_need.jsp

		}

		return mav;
	}
}
