package dev.mvc.star;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StarCont {
	@Autowired
	@Qualifier("dev.mvc.star.StarProc")
	private StarProcInter starProc;

	public StarCont() {
		System.out.println("-> StarCont created.");
	}

	/**
	 * 등록 폼 http://localhost:9093/star/create.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/star/create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/star/create"); // /WEB-INF/views/star/create.jsp

		return mav;
	}
}
