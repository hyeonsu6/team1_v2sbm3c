package dev.mvc.alogin;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.mlogin.MloginVO;

@Controller
public class AloginCont {
	@Autowired
	@Qualifier("dev.mvc.admin.AdminProc")
	private AdminProcInter adminProc;

	@Autowired
	@Qualifier("dev.mvc.alogin.AloginProc")
	private AloginProcInter aloginProc;

	public AloginCont() {
		System.out.println("-> AloginCont created.");
	}

	/**
	 * 전체 목록 http://localhost:9093/login/list_all_alogin.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/list_all_alogin.do", method = RequestMethod.GET)
	public ModelAndView list_all_alogin(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (this.adminProc.isAdmin(session)) {
			mav.setViewName("/login/list_all_alogin"); // /WEB-INF/views/login/list_all_alogin.jsp

			int adminno = (int) session.getAttribute("adminno");

			ArrayList<AloginVO> list = this.aloginProc.list_all_alogin(adminno);
			mav.addObject("list", list);

		} else {
			mav.setViewName("/admin/login_need");
		}

		return mav; // forward
	}

	/**
	 * 조회 http://localhost:9093/login/read_alogin.do?aloginno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/read_alogin.do", method = RequestMethod.GET)
	public ModelAndView read_alogin(int aloginno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/read_alogin");

		AloginVO aloginVO = this.aloginProc.read_alogin(aloginno);
		mav.addObject("aloginVO", aloginVO);

		return mav;
	}

	/**
	 * 로그인 내역 삭제 폼 http://localhost:9093/login/delete_alogin.do?aloginno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/delete_alogin.do", method = RequestMethod.GET)
	public ModelAndView delete_alogin(HttpSession session, AloginVO aloginVO) {
		ModelAndView mav = new ModelAndView();

		if (adminProc.isAdmin(session)) {
			int aloginno = aloginVO.getAloginno(); // AloginVO 객체에서 aloginno를 추출
			AloginVO aloginVO_read = this.aloginProc.read_alogin(aloginno);
			mav.addObject("aloginVO", aloginVO_read);

			mav.setViewName("/login/delete_alogin");

		} else {
			mav.addObject("url", "/admin/login_need");
			mav.setViewName("redirect:/admin/msg.do");
		}

		return mav;
	}

	/**
	 * 삭제 처리 http://localhost:9093/login/delete_alogin.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login/delete_alogin.do", method = RequestMethod.POST)
	public ModelAndView delete_alogin(AloginVO aloginVO) {
		ModelAndView mav = new ModelAndView();

		AloginVO aloginVO_read = this.aloginProc.read_alogin(aloginVO.getAloginno());
		this.aloginProc.delete_alogin(aloginVO.getAloginno());

		mav.addObject("aloginno", aloginVO.getAloginno());
		mav.setViewName("redirect:/login/list_all_alogin.do");

		return mav;
	}

}
