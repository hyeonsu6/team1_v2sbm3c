package dev.mvc.mlogin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;

@Controller
public class MloginCont {
	@Autowired
	@Qualifier("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;

	@Autowired
	@Qualifier("dev.mvc.mlogin.MloginProc")
	private MloginProcInter mloginProc;

	public MloginCont() {
		System.out.println("-> MloginCont created.");
	}

	/**
	 * 전체 목록 http://localhost:9093/login/list_all_mlogin.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/list_all_mlogin.do", method = RequestMethod.GET)
	public ModelAndView list_all_mlogin(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int memberno = 0;
		
		if (this.memberProc.isMember(session) == true) {
			mav.setViewName("/login/list_all_mlogin"); // /WEB-INF/views/login/list_all_mlogin.jsp

			memberno = (int) session.getAttribute("memberno");

			ArrayList<MloginVO> list = this.mloginProc.list_all_mlogin(memberno);
			mav.addObject("list", list);

		} else {
			mav.setViewName("member/login_need");
		}

		return mav; // forward
	}
}
