package dev.mvc.mlogin;

import java.util.ArrayList;
import java.util.HashMap;

public interface MloginProcInter {

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
	public ArrayList<MloginVO> list_all_mlogin(int memberno);

	/**
	 * 특정 회원의 로그인 내역
	 * 
	 * @param memberno 회원 번호
	 * @return 로그인 기록 리스트
	 */
	public ArrayList<MloginVO> list_mlogin_by_memberno(int memberno);

	/**
	 * 조회
	 * 
	 * @param mloginno
	 * @return
	 */
	public MloginVO read_mlogin(int mloginno);

	/**
	 * 로그인 내역 삭제
	 * 
	 * @param mloginno
	 * @return
	 */
	public int delete_mlogin(int mloginno);

}
