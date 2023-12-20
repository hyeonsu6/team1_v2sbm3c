package dev.mvc.mlogin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.mlogin.MloginProc")
public class MloginProc implements MloginProcInter {
	@Autowired
	private MloginDAOInter mloginDAO;

	@Override
	public ArrayList<MloginVO> list_all_mlogin() {
		ArrayList<MloginVO> list = this.mloginDAO.list_all_mlogin();
		return list;
	}

	@Override
	public MloginVO read_mlogin(int mloginno) {
		MloginVO mloginVO = this.mloginDAO.read_mlogin(mloginno);
		return mloginVO;
	}

	@Override
	public int delete_mlogin(int mloginno) {
		int cnt = this.mloginDAO.delete_mlogin(mloginno);
		return cnt;
	}

}
