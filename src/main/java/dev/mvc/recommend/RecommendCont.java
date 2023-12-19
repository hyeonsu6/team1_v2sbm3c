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

}
