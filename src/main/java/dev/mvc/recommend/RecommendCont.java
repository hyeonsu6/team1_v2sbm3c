package dev.mvc.recommend;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;

@Controller
public class RecommendCont {
	@Autowired
	@Qualifier("dev.mvc.recommend.RecommendProc")
	private RecommendProcInter recommendProc;

	@Autowired
	@Qualifier("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;

	public RecommendCont() {
		System.out.println("-> RecommendCont created.");
	}

	/**
	 * 전체 목록 조회
	 * 
	 * @param session
	 * @return ModelAndView 객체
	 */
	@RequestMapping(value = "/recommend/list_all.do", method = RequestMethod.GET)
	public ModelAndView list_all(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		ArrayList<RecommendVO> list = this.recommendProc.list_all();
		mav.addObject("list", list);

		return mav;
	}

	/**
	 * 전체 조회 http://localhost:9093/recommend/read.do?recommendno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/recommend/read.do", method = RequestMethod.GET)
	public ModelAndView read(int recommendno) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/recommend/read");

		RecommendVO recommendVO = this.recommendProc.read(recommendno);
		mav.addObject("recommendVO", recommendVO);

		return mav;
	}  

	/**
	 * 삭제 폼 http://localhost:9093/recommend/delete.do?recommendno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/recommend/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(HttpSession session, int recommendno) {
		System.out.println("-> delete");
		ModelAndView mav = new ModelAndView();

		if (memberProc.isMember(session)) {
			System.out.println("-> member");
			RecommendVO recommendVO = this.recommendProc.read(recommendno);
			mav.addObject("recommendVO", recommendVO);

			mav.setViewName("/recommend/delete"); // /WEB-INF/views/recommend/delete.jsp

		} else {
			mav.addObject("url", "/member/login_need"); // /WEB-INF/views/member/login_need.jsp
			mav.setViewName("redirect:/member/msg.do"); // /WEB-INF/views/member/msg.jsp
		}

		return mav;
	}

	/**
	 * 삭제 처리 http://localhost:9093/recommend/delete.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/recommend/delete.do", method = RequestMethod.POST)
	public ModelAndView delete(RecommendVO recommendVO) {
		System.out.println("-> delete");
		ModelAndView mav = new ModelAndView();

		RecommendVO recommendVO_read = this.recommendProc.read(recommendVO.getRecommendno());
		this.recommendProc.delete(recommendVO.getRecommendno()); // DBMS 삭제

		mav.addObject("recommendno", recommendVO.getRecommendno());
		mav.setViewName("redirect:/recommend/list_all.do"); // /WEB-INF/views/recommend/list_all.jsp

		return mav;
	}

}
