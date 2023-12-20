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

@Controller
public class AloginCont {
	@Autowired
	@Qualifier("dev.mvc.admin.AdminProc") // @Component("dev.mvc.admin.AdminProc")
	private AdminProcInter adminProc;

	@Autowired
	@Qualifier("dev.mvc.alogin.AloginProc") // @Component("dev.mvc.alogin.AloginProc")
	private AloginProcInter aloginProc;

	public AloginCont() {
		System.out.println("-> AloginCont created.");
	}

	/**
	 * 전체 로그인 내역 http://localhost:9093/alogin/list_all.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/alogin/list_all.do", method = RequestMethod.GET)
	public ModelAndView list_all(HttpSession session) {
		System.out.println("-> list_all");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/alogin/list_all"); // WEB-INF/views/alogin/list_all.jsp

		if (this.adminProc.isAdmin(session) == true) {
			mav.setViewName("/alogin/list_all"); // /WEB-INF/views/alogin/list_all.jsp
			ArrayList<AloginVO> list = this.aloginProc.list_all();

			mav.addObject("list", list);

		} else {
			mav.setViewName("/admin/login_need"); // /WEB-INF/views/admin/login_need.jsp

		}

		return mav;
	}

	/**
	 * 조회 http://localhost:9093/alogin/read.do?aloginno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/alogin/read.do", method = RequestMethod.GET)
	public ModelAndView read(int aloginno) {
		System.out.println("-> read");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/alogin/read");

		AloginVO aloginVO = this.aloginProc.read(aloginno);
		
		mav.addObject("aloginVO", aloginVO);

		return mav;
	}

	/**
	 * 파일 삭제 폼 http://localhost:9093/alogin/delete.do?aloginno=1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/alogin/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(HttpSession session, int aloginno) {
		System.out.println("-> delete");
		ModelAndView mav = new ModelAndView();

		if (adminProc.isAdmin(session)) {
			System.out.println("-> customer");
			AloginVO aloginVO = this.aloginProc.read(aloginno);
			mav.addObject("aloginVO", aloginVO);

			mav.setViewName("/alogin/delete");

		} else {
			mav.addObject("url", "/admin/login_need");
			mav.setViewName("redirect:/admin/msg.do");
		}

		return mav;
	}

	/**
	 * 삭제 처리 http://localhost:9093/alogin/delete.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/alogin/delete.do", method = RequestMethod.POST)
	public ModelAndView delete(AloginVO aloginVO) {
		System.out.println("-> delete");
		ModelAndView mav = new ModelAndView();

		AloginVO aloginVO_read = this.aloginProc.read(aloginVO.getAloginno());
		this.aloginProc.delete(aloginVO.getAloginno()); // DBMS 삭제

		mav.addObject("aloginno", aloginVO.getAloginno());
		mav.setViewName("redirect:/alogin/list_all.do");

		return mav;
	}

}
