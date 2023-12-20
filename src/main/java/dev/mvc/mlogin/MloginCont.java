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
	public ModelAndView list_all_mlogin(HttpSession session, HttpServletRequest request) {
		System.out.println("-> list_all_mlogin");
		ModelAndView mav = new ModelAndView();

		Integer memberno = (Integer) session.getAttribute("memberno");

		if (memberno != null) {
			System.out.println("-> memberno: " + memberno.intValue());
			String ip = request.getRemoteAddr();
			System.out.println("-> ip: " + ip);

			if (this.memberProc.isMember(session)) {
				mav.setViewName("/login/list_all_mlogin"); // /WEB-INF/views/login/list_all_mlogin.jsp
				ArrayList<MloginVO> list = this.mloginProc.list_all_mlogin();
				list.forEach(mloginVO -> mloginVO.setIp(ip));
				mav.addObject("list", list);
			} else {
				mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
			}
		} else {
			mav.setViewName("/member/login_need"); // Handle the case where memberno is null
		}

		return mav;
	}

	/**
	 * 조회 http://localhost:9093/login/read_mlogin.do?mloginno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/read_mlogin.do", method = RequestMethod.GET)
	public ModelAndView read_mlogin(int mloginno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/read_mlogin");

		MloginVO mloginVO = this.mloginProc.read_mlogin(mloginno);
		mav.addObject("mloginVO", mloginVO);

		return mav;
	}

	/**
	 * 삭제 폼 http://localhost:9093/login/delete_mlogin.do?mloginno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/delete_mlogin.do", method = RequestMethod.GET)
	public ModelAndView delete_mlogin(HttpSession session, int mloginno) {
		ModelAndView mav = new ModelAndView();

		if (memberProc.isMember(session)) {
			MloginVO mloginVO = this.mloginProc.read_mlogin(mloginno);
			mav.addObject("mloginVO", mloginVO);

			mav.setViewName("/login/delete_mlogin");

		} else {
			mav.addObject("url", "/member/login_need");
			mav.setViewName("redirect:/member/msg.do");
		}

		return mav;
	}

	/**
	 * 삭제 처리 http://localhost:9093/login/delete_mlogin.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/delete_mlogin.do", method = RequestMethod.POST)
	public ModelAndView delete(MloginVO mloginVO) {
		ModelAndView mav = new ModelAndView();

		MloginVO mloginVO_read = this.mloginProc.read_mlogin(mloginVO.getMloginno());
		this.mloginProc.delete_mlogin(mloginVO.getMloginno()); // DBMS 삭제

		mav.addObject("mloginno", mloginVO.getMloginno());
		mav.setViewName("redirect:/login/list_all_mlogin.do"); // 수정된 부분

		return mav;
	}
}
