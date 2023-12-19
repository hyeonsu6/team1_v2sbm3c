package dev.mvc.frecommend;

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
	@Qualifier("dev.mvc.frecommend.RecommendProc")
	private RecommendProcInter recommendProc;

	@Autowired
	@Qualifier("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;

	public RecommendCont() {
		System.out.println("-> RecommendCont created.");
	}

	/**
	 * 전체 목록
	 * 
	 * @param session
	 * @return ModelAndView 객체
	 */
	@RequestMapping(value = "/frecommend/list_all.do", method = RequestMethod.GET)
	public ModelAndView list_all(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		ArrayList<RecommendVO> list = this.recommendProc.list_all();
		mav.addObject("list", list);

		return mav;
	}

	/**
	 * 전체 조회 http://localhost:9093/frecommend/read.do?recommendno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/read.do", method = RequestMethod.GET)
	public ModelAndView read(int recommendno) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/frecommend/read");

		RecommendVO recommendVO = this.recommendProc.read(recommendno);
		mav.addObject("recommendVO", recommendVO);

		return mav;
	}

	/**
	 * 회원을 이용한 조회 http://localhost:9093/frecommend/read_memberno.do?memberno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/read_memberno.do", method = RequestMethod.GET)
	public ModelAndView read_memberno(int memberno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/frecommend/read");

		RecommendVO recommendVO = this.recommendProc.read_memberno(memberno);

		mav.addObject("recommendVO", recommendVO);

		return mav;
	}

	/**
	 * 삭제 폼 http://localhost:9093/frecommend/delete.do?recommendno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/frecommend/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(HttpSession session, int recommendno) {
		ModelAndView mav = new ModelAndView();

		if (memberProc.isMember(session)) {
			RecommendVO recommendVO = this.recommendProc.read(recommendno);
			mav.addObject("recommendVO", recommendVO);

			mav.setViewName("/frecommend/delete"); // /WEB-INF/views/frecommend/delete.jsp

		} else {
			mav.addObject("url", "/member/login_need"); // /WEB-INF/views/member/login_need.jsp
			mav.setViewName("redirect:/member/msg.do"); // /WEB-INF/views/member/msg.jsp
		}

		return mav;
	}

//	/**
//	 * 삭제 처리 http://localhost:9093/frecommend/delete.do
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
//		mav.setViewName("redirect:/frecommend/list_all.do"); // /WEB-INF/views/frecommend/list_all.jsp
//
//		return mav;
//	}

}
