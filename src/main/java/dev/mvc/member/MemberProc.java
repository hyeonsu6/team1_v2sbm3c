package dev.mvc.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
	@Autowired
	private MemberDAOInter memberDAO;

	public MemberProc() {
		// System.out.println("-> MemberProc created.");
	}

	@Override
	public int checkID(String id) {
		int cnt = this.memberDAO.checkID(id);
		return cnt;
	}

	@Override
	public int create(MemberVO memberVO) {
		int cnt = this.memberDAO.create(memberVO);
		return cnt;
	}

	@Override
	public ArrayList<MemberVO> list() {
		ArrayList<MemberVO> list = this.memberDAO.list();
		return list;
	}

	@Override
	public MemberVO read(int memberno) {
		MemberVO memberVO = this.memberDAO.read(memberno);
		return memberVO;
	}

	@Override
	public MemberVO readById(String id) {
		MemberVO memberVO = this.memberDAO.readById(id);
		return memberVO;
	}
	
	@Override
	public MemberVO findId(HashMap<String, Object> map) {
	  MemberVO memberVO = this.memberDAO.findId(map);
	  return memberVO;
	}
	
	 @Override
	  public MemberVO findPasswd(HashMap<String, Object> map) {
	    MemberVO memberVO = this.memberDAO.findPasswd(map);
	    return memberVO;
	  }

	@Override
	public boolean isMember(HttpSession session) {
		boolean sw = false; // 로그인하지 않은 것으로 초기화
		int grade = 99;

		// System.out.println("-> grade: " + session.getAttribute("grade"));
		if (session != null) {
			String id = (String) session.getAttribute("id");
			if (session.getAttribute("grade") != null) {
				grade = (int) session.getAttribute("grade");
			}

			if (id != null && grade <= 20) { // 관리자 + 회원
				sw = true; // 로그인 한 경우
			}
		}

		return sw;
	}

	@Override
	public boolean isMemberAdmin(HttpSession session) {
		boolean sw = false; // 로그인하지 않은 것으로 초기화
		int grade = 99;

		// System.out.println("-> grade: " + session.getAttribute("grade"));
		if (session != null) {
			String id = (String) session.getAttribute("id");
			if (session.getAttribute("grade") != null) {
				grade = (int) session.getAttribute("grade");
			}

			if (id != null && grade <= 10) { // 관리자
				sw = true; // 로그인 한 경우
			}
		}

		return sw;
	}

	@Override
	public int update(MemberVO memberVO) {
		int cnt = this.memberDAO.update(memberVO);
		return cnt;
	}

	@Override
	public int delete(int memberno) {
		int cnt = this.memberDAO.delete(memberno);
		return cnt;
	}

	@Override
	public int passwd_check(HashMap<String, Object> map) {
		int cnt = this.memberDAO.passwd_check(map);
		return cnt;
	}

	@Override
	public int passwd_update(HashMap<String, Object> map) {
		int cnt = this.memberDAO.passwd_update(map);
		return cnt;
	}

	@Override
	public int login(HashMap<String, Object> map) {
		int cnt = this.memberDAO.login(map);
		return cnt;
	}

  @Override
  public int unsubscribe(HashMap<String, Object> map) {
    int cnt = this.memberDAO.unsubscribe(map);
    return cnt;
  }

  @Override
  public int check_unsubscribe(String id) {
    //System.out.println("-> check_unsubscribe");
    
    int check_unsubscribe;
    //String id = (String)session.getAttribute("id");
    System.out.println("-> id: " + id);
    //System.out.println("-> ck_id: " + ck_id);
    
    MemberVO memberVO = this.memberDAO.readById(id);
    int grade = memberVO.getGrade();
    
    System.out.println("-> grade: " + grade);
    
    if(grade == 99) { // 탈퇴 회원 로그인 불가
      check_unsubscribe = 0;
    } else if (grade >= 40 && grade <= 49) { // 정지 회원 로그인 불가
      check_unsubscribe = -1;
    } else { // 로그인 가능
      check_unsubscribe = 1;
    }
    
    return check_unsubscribe;
  }

  @Override
  public int update_grade(MemberVO memberVO) {
    int cnt = this.memberDAO.update_grade(memberVO);
    return cnt;
  }

}
