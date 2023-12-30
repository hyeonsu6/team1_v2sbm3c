package dev.mvc.festival_likes;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.festival.FestivalProcInter;
import dev.mvc.member.MemberProcInter;

@Controller
public class Festival_likesCont {
	@Autowired
	@Qualifier("dev.mvc.festival_likes.Festival_likeProc")
	private Festival_likeProcInter festival_likeProc;

	@Autowired
	@Qualifier("dev.mvc.festival.FestivalProc")
	private FestivalProcInter festivalProc;

	@Autowired
	@Qualifier("dev.mvc.member.MemberProc") // @Component("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;

	public Festival_likesCont() {
		System.out.println("-> Festival_likes created.");
	}

	/**
	 * 좋아요 및 좋아요 취소
	 * 
	 * @param session
	 * @param festival_likeVO
	 * @return
	 */
	@RequestMapping(value = "/festival_likes/do_like.do", method = RequestMethod.POST)
	@ResponseBody
	public String do_like(HttpSession session, Festival_likeVO festival_likeVO) {
		// 사용자가 로그인한 경우
		if (memberProc.isMember(session)) {
			int memberno = (int) session.getAttribute("memberno");

			// 좋아요 등록
			festival_likeVO.setMemberno(memberno);
			int count = festival_likeProc.do_like(festival_likeVO);

			return "success";
		} else {
			return "login_required";
		}
	}

	/**
	 * 좋아요가 눌렸는지 아닌지의 상태
	 * 
	 * @param session
	 * @param festival_likeVO
	 * @return
	 */
	@RequestMapping(value = "/festival_likes/get_likecount.do", method = RequestMethod.POST)
	@ResponseBody
	public String get_likecount(HttpSession session, Festival_likeVO festival_likeVO) {
		// 사용자가 로그인한 경우
		if (memberProc.isMember(session)) {
			int memberno = (int) session.getAttribute("memberno");

			// 해당 게시글에 대한 좋아요 상태 확인
			int likeCount = festival_likeProc.get_likecount(festival_likeVO);

			return Integer.toString(likeCount);
		} else {
			return "login_required";
		}
	}

	/**
	 * 좋아요 취소
	 * 
	 * @param session
	 * @param festival_likeVO
	 * @return
	 */
	@RequestMapping(value = "/festival_likes/delete_like.do", method = RequestMethod.POST)
	@ResponseBody
	public String delete_like(HttpSession session, Festival_likeVO festival_likeVO) {
		// 사용자가 로그인한 경우
		if (memberProc.isMember(session)) {
			int memberno = (int) session.getAttribute("memberno");

			// 좋아요 취소
			int result = festival_likeProc.delete_like(festival_likeVO);

			if (result > 0) {
				return "success"; // 좋아요 취소 성공
			} else {
				return "fail"; // 좋아요 취소 실패
			}
		} else {
			return "login_required"; // 로그인 필요
		}
	}

	/**
	 * 좋아요 총 갯수
	 * 
	 * @param contentsno
	 * @return
	 */
	@RequestMapping(value = "/festival_likes/get_total_likecount.do", method = RequestMethod.POST)
	@ResponseBody
	public String get_total_likecount(int contentsno) {

		// 총 좋아요 개수 가져오기
		int totalLikeCount = festival_likeProc.get_total_likecount(contentsno);

		return Integer.toString(totalLikeCount);
	}

}
