package dev.mvc.alogin;

import java.util.ArrayList;

import dev.mvc.mlogin.MloginVO;

public interface AloginProcInter {
	/**
	 * 로그인 내역 등록
	 *
	 * @param aloginVO
	 * @return
	 */
	public int create(AloginVO aloginVO);

	/**
	 * 로그인 내역
	 * 
	 * @return
	 */
	// AloginVO aloginVO

	public ArrayList<AloginVO> list_all_alogin(int adminno);
	
	/**
	 * 조회
	 * 
	 * @param aloginno
	 * @return
	 */
	public AloginVO read_alogin(int aloginno);

	/**
	 * 로그인 내역 삭제
	 * 
	 * @param aloginno
	 * @return
	 */
	public int delete_alogin(int aloginno);
}

