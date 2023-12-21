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
	 * 전체 로그인 내역 http://localhost:9093/login/list_all_mlogin.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/list_all_mlogin.do", method = RequestMethod.GET)
	public ModelAndView list_all_mlogin(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (this.memberProc.isMember(session)) {
			mav.setViewName("/login/list_all_mlogin"); // /WEB-INF/views/login/list_all_mlogin.jsp

			int memberno = (int) session.getAttribute("memberno");

			ArrayList<MloginVO> list = this.mloginProc.list_all_mlogin(memberno);
			mav.addObject("list", list);

		} else {
			mav.setViewName("member/login_need");
		}

		return mav; // forward
	}

	/**
	 * 특정 회원의 로그인 내역 http://localhost:9093/login/list_mlogin_by_memberno.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/list_mlogin_by_memberno.do", method = RequestMethod.GET)
	public ModelAndView list_mlogin_by_memberno(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (this.memberProc.isMember(session)) {
			mav.setViewName("/login/list_mlogin_by_memberno"); // /WEB-INF/views/login/list_mlogin_by_memberno.jsp

			int memberno = (int) session.getAttribute("memberno");

			ArrayList<MloginVO> list = this.mloginProc.list_mlogin_by_memberno(memberno);
			mav.addObject("list", list);

		} else {
			mav.setViewName("member/login_need");
		}

		return mav; // forward
	}

	/**
	 * 조회 http://localhost:9093/login/read_mlogin.do?mloginno=8
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
	 * 로그인 내역 삭제 폼 http://localhost:9093/login/delete_mlogin.do?mloginno=3
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/delete_mlogin.do", method = RequestMethod.GET)
	public ModelAndView delete_mlogin(HttpSession session, MloginVO mloginVO) {
		ModelAndView mav = new ModelAndView();

		if (memberProc.isMember(session)) {
			int mloginno = mloginVO.getMloginno(); // MloginVO 객체에서 mloginno를 추출
			MloginVO mloginVO_read = this.mloginProc.read_mlogin(mloginno);
			mav.addObject("mloginVO", mloginVO_read);

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
	public ModelAndView delete_mlogin(MloginVO mloginVO) {
		ModelAndView mav = new ModelAndView();

		MloginVO mloginVO_read = this.mloginProc.read_mlogin(mloginVO.getMloginno());
		this.mloginProc.delete_mlogin(mloginVO.getMloginno()); 

		mav.addObject("mloginno", mloginVO.getMloginno());
		mav.setViewName("redirect:/login/list_mlogin_by_memberno.do");

		return mav;
	}

}