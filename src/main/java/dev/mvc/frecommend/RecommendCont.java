package dev.mvc.frecommend;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.member.MemberProcInter;

@Controller
public class RecommendCont {
	@Autowired
	@Qualifier("dev.mvc.frecommend.RecommendProc")
	private RecommendProcInter recommendProc;

	@Autowired
	@Qualifier("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;

	@Autowired
	@Qualifier("dev.mvc.admin.AdminProc")
	private AdminProcInter adminProc;

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

	/**
	 * 전체 목록
	 * 
	 * @param session
	 * @return ModelAndView 객체
	 */
	@RequestMapping(value = "/frecommend/list_all.do", method = RequestMethod.GET)
	public ModelAndView list_all(HttpSession session) {
		System.out.println("-> list_all");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/frecommend/list_all"); // WEB-INF/views/frecommend/list_all.jsp

		if (this.adminProc.isAdmin(session) == true) {
			mav.setViewName("/frecommend/list_all"); // /WEB-INF/views/frecommend/list_all.jsp
			ArrayList<RecommendVO> list = this.recommendProc.list_all();

			mav.addObject("list", list);

		} else {
			mav.setViewName("/admin/login_need"); // /WEB-INF/views/admin/login_need.jsp

		}

		return mav;
	}

	/**
	 * 회원을 이용한 목록 http://localhost:9093/frecommend/list_by_memberno.do?memberno=3
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/list_by_memberno.do", method = RequestMethod.GET)
	public ModelAndView list_by_memberno(HttpSession session) {
		System.out.println("-> list_by_memberno");
		ModelAndView mav = new ModelAndView();

		if (this.memberProc.isMember(session)) {
			mav.setViewName("/frecommend/list_by_memberno"); // /WEB-INF/views/frecommend/list_by_memberno.jsp
			
			int memberno = (int) session.getAttribute("memberno");
			
			ArrayList<RecommendVO> list = this.recommendProc.list_by_memberno(memberno);
			mav.addObject("list", list);

		} else {
			mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp

		}

		return mav;
	}

//	/**
//	 * 전체 조회 http://localhost:9093/frecommend/read.do?recommendno=7
//	 * 
//	 * @return
//	 */
//	@RequestMapping(value = "/frecommend/read.do", method = RequestMethod.GET)
//	public ModelAndView read(int recommendno) {
//		System.out.println("-> read");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/frecommend/read");
//
//		RecommendVO recommendVO = this.recommendProc.read(recommendno);
//		mav.addObject("recommendVO", recommendVO);
//
//		return mav;
//	}

//	/**
//	 * 추천 삭제 폼 http://localhost:9093/frecommend/delete.do?recommendno=1
//	 * 
//	 * @return
//	 */
//	@RequestMapping(value = "/frecommend/delete.do", method = RequestMethod.GET)
//	public ModelAndView delete(HttpSession session, int recommendno) {
//		ModelAndView mav = new ModelAndView();
//
//		if (memberProc.isMember(session)) {
//			RecommendVO recommendVO = this.recommendProc.read(recommendno);
//			mav.addObject("recommendVO", recommendVO);
//
//			mav.setViewName("/frecommend/delete");
//
//		} else {
//			mav.addObject("url", "/member/login_need");
//			mav.setViewName("redirect:/member/msg.do");
//		}
//
//		return mav;
//	}
//
//	/**
//	 * 추천 삭제 처리 http://localhost:9093/frecommend/delete.do
//	 * 
//	 * @return
//	 */
//	@RequestMapping(value = "/frecommend/delete.do", method = RequestMethod.POST)
//	public ModelAndView delete(RecommendVO recommendVO) {
//		ModelAndView mav = new ModelAndView();
//
//		RecommendVO recommendVO_read = this.recommendProc.read(recommendVO.getRecommendno());
//		this.recommendProc.delete(recommendVO.getRecommendno()); // DBMS 삭제
//
//		mav.addObject("recommendno", recommendVO.getRecommendno());
//		mav.setViewName("redirect:/frecommend/list_all.do");
//
//		return mav;
//	}

}
