package dev.mvc.alogin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//Controller가 사용하는 이름
@Component("dev.mvc.alogin.AloginProc")
public class AloginProc implements AloginProcInter {
	@Autowired // FcateDAOInter interface를 구현한 클래스의 객체를 만들어 자동으로 할당해라.
	private AloginDAOInter aloginDAO;
	
	@Override
	public int create(AloginVO aloginVO) {
		int cnt = this.aloginDAO.create(aloginVO);
		return cnt;
	}

	@Override
	public ArrayList<AloginVO> list_all() {
		ArrayList<AloginVO> list = this.aloginDAO.list_all();
		return list;
	}

	@Override
	public AloginVO read(int adminno) {
		AloginVO aloginVO = this.aloginDAO.read(adminno);
		return aloginVO;
	}

	@Override
	public int delete(int aloginno) {
		int cnt = this.aloginDAO.delete(aloginno);
		return cnt;
	}
}
