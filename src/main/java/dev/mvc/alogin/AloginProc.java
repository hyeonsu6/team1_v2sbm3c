package dev.mvc.alogin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.mlogin.MloginVO;

@Component("dev.mvc.alogin.AloginProc")
public class AloginProc implements AloginProcInter {
	@Autowired
	private AloginDAOInter aloginDAO;

	@Override
	public int create(AloginVO aloginVO) {
		int cnt = this.aloginDAO.create(aloginVO);
		return cnt;
	}

	@Override
	public ArrayList<AloginVO> list_all_alogin(int adminno) {
		ArrayList<AloginVO> list = this.aloginDAO.list_all_alogin(adminno);
		return list;
	}

	@Override
	public AloginVO read_alogin(int aloginno) {
		AloginVO aloginVO = this.aloginDAO.read_alogin(aloginno);
		return aloginVO;
	}

	@Override
	public int delete_alogin(int aloginno) {
		int cnt = this.aloginDAO.delete_alogin(aloginno);
		return cnt;
	}

}
