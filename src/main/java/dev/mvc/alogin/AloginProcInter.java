package dev.mvc.alogin;

import java.util.ArrayList;
import java.util.HashMap;

public interface AloginProcInter {

	/**
	 * 전체 로그인 내역
	 * 
	 * @return
	 */
	public ArrayList<AloginVO> list_all();

	/**
	 * 특정 관리자의 로그인 내역
	 * 
	 * @param adminno
	 * @return
	 */
	public AloginVO read(int adminno);

	/**
	 * 삭제
	 * 
	 * @param aloginno 삭제할 레코드 PK 번호
	 * @return 삭제된 레코드 갯수
	 */
	public int delete(int aloginno);
}
