package dev.mvc.mlogin;

import java.util.ArrayList;

public interface MloginProcInter {
	/**
	 * 로그인 내역
	 * 
	 * @return
	 */
	// MloginVO mloginVO

	public ArrayList<MloginVO> list_all();

	/**
	 * 조회
	 * 
	 * @param mloginno
	 * @return
	 */
	public MloginVO read(int mloginno);

	/**
	 * 삭제
	 * 
	 * @param mloginno
	 * @return
	 */
	public int delete(int mloginno);

}
