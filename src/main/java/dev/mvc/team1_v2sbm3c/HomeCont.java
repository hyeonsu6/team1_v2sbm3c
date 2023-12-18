package dev.mvc.team1_v2sbm3c;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.fcate.FcateProcInter;
import dev.mvc.fcate.FcateVO;

@Controller
public class HomeCont {
	@Autowired // FcateProcInter interface 구현한 객체를 만들어 자동으로 할당해라.
	@Qualifier("dev.mvc.fcate.FcateProc")
	private FcateProcInter fcateProc;

	public HomeCont() {
		System.out.println("-> HomeCont created.");
	}

	// http://localhost:9093
	@RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index"); // /WEB-INF/views/index.jsp

		System.out.println("-> HomeCont index_adminno: " + session.getAttribute("adminno"));
		
		return mav;
	}

	// http://localhost:9093/menu/top.do
	@RequestMapping(value = { "/menu/top.do" }, method = RequestMethod.GET)
	public ModelAndView top() {
		ModelAndView mav = new ModelAndView();

		ArrayList<FcateVO> list_top = this.fcateProc.list_all_y();
		mav.addObject("list_top", list_top);

		mav.setViewName("/menu/top"); // /WEB-INF/views/menu/top.jsp

		return mav;

	}
}