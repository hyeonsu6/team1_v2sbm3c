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
import dev.mvc.festival.FestivalProcInter;
import dev.mvc.festival.FestivalVO;
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

	@Autowired
	@Qualifier("dev.mvc.festival.FestivalProc")
	private FestivalProcInter festivalProc;

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

	/**
	 * 회원을 이용한 목록
	 * http://localhost:9093/frecommend/list_by_memberno_index.do?memberno=3
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/list_by_memberno_index.do", method = RequestMethod.GET)
	public ModelAndView list_by_memberno_index(HttpSession session) {
		System.out.println("-> list_by_memberno_index");
		ModelAndView mav = new ModelAndView();

		if (this.memberProc.isMember(session)) {
			mav.setViewName("/frecommend/list_by_memberno_index"); // /WEB-INF/views/frecommend/list_by_memberno_index.jsp

			int memberno = (int) session.getAttribute("memberno");

			ArrayList<RecommendVO> list = this.recommendProc.list_by_memberno_index(memberno);
			mav.addObject("list", list);

		} else {
			mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp

		}

		return mav;
	}

	/**
	 * 전체 조회 http://localhost:9093/frecommend/read.do?recommendno=7
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/read.do", method = RequestMethod.GET)
	public ModelAndView read(int recommendno) {
		System.out.println("-> read");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/frecommend/read");

		RecommendVO recommendVO = this.recommendProc.read(recommendno);
		mav.addObject("recommendVO", recommendVO);

		return mav;
	}

	/**
	 * 추천해요 http://localhost:9093/frecommend/recom_like.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/recom_like.do", method = RequestMethod.GET)
	public ModelAndView recom_like(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/frecommend/recom_like");

		int memberno = (int) session.getAttribute("memberno");
		mav.addObject("memberno", memberno);

		RecommendVO recommendVO = this.recommendProc.read(memberno);

		if (recommendVO != null) {
			int fcateno = recommendVO.getFcateno();
			ArrayList<FestivalVO> list = this.recommendProc.recom_like(fcateno);
			if (list.size() > 5) {
				list = new ArrayList<>(list.subList(0, 5));
			}
			mav.addObject("list", list);
		} else {
			ArrayList<FestivalVO> list = this.festivalProc.list_all();
			if (list.size() > 5) {
				list = new ArrayList<>(list.subList(0, 5));
			}
			mav.addObject("list", list);
		}
		return mav;
	}

	/**
	 * 특정 카테고리 지정 추천해요 http://localhost:9093/frecommend/recom_like_new.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/recom_like_new.do", method = RequestMethod.GET)
	public ModelAndView recom_like_new(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/frecommend/recom_like_new");

		int memberno = (int) session.getAttribute("memberno");
		mav.addObject("memberno", memberno);

		RecommendVO recommendVO = this.recommendProc.read(memberno);

		// 원하는 카테고리 번호 (예: 11)
		int fcateno_new = 11;

		if (recommendVO != null) {
			int fcateno = recommendVO.getFcateno();
			// 기존 코드에서 사용된 fcateno 대신 원하는 값으로 설정
			ArrayList<FestivalVO> list = this.recommendProc.recom_like_new(fcateno_new);
			if (list.size() > 3) {
				list = new ArrayList<>(list.subList(0, 3));
			}
			mav.addObject("list", list);
		} else {
			// recommendVO가 null인 경우에도 원하는 카테고리 번호로 설정
			ArrayList<FestivalVO> list = this.festivalProc.recom_like_new(fcateno_new);
			if (list.size() > 3) {
				list = new ArrayList<>(list.subList(0, 3));
			}
			mav.addObject("list", list);
		}
		return mav;
	}

}
