package dev.mvc.mlogin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MloginProc implements MloginProcInter {
	@Autowired
	private MloginDAOInter mloginDAO;

	// 로그인 내역
	@Override
	public ArrayList<MloginVO> list_all() {
		ArrayList<MloginVO> list = this.mloginDAO.list_all();
		return list;
	}

	// 조회
	@Override
	public MloginVO read(int mloginno) {
		MloginVO cloginVO = this.mloginDAO.read(mloginno);
		return cloginVO;
	}

	// 삭제
	@Override
	public int delete(int mloginno) {
		int cnt = this.mloginDAO.delete(mloginno);
		return cnt;
	}

}
