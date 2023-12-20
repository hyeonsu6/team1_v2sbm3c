package dev.mvc.mlogin;

import java.util.ArrayList;
import java.util.HashMap;

public interface MloginDAOInter {

	/**
	 * 로그인 내역 등록
	 *
	 * @param mloginVO
	 * @return
	 */
	public int create(MloginVO mloginVO);

	/**
	 * 로그인 내역
	 * 
	 * @return
	 */
	// MloginVO mloginVO

	public ArrayList<MloginVO> list_all_mlogin();

	/**
	 * 조회
	 * 
	 * @param mloginno
	 * @return
	 */
	public MloginVO read_mlogin(int mloginno);

	/**
	 * 삭제
	 * 
	 * @param mloginno
	 * @return
	 */
	public int delete_mlogin(int mloginno);

}
