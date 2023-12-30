package dev.mvc.alogin;

import java.util.ArrayList;

public interface AloginDAOInter {

	/**
	 * 로그인 내역 등록
	 *
	 * @param aloginVO
	 * @return
	 */
	public int create(AloginVO aloginVO);

	/**
	 * 전체 목록, 관리자 로그인 내역
	 * 
	 * @return
	 */
	public ArrayList<AloginVO> list_all_alogin(int adminno);

	/**
	 * 특정 관리자 로그인 내역 조회
	 * 
	 * @param aloginno
	 * @return
	 */
	public AloginVO read_alogin(int aloginno);

	/**
	 * 관리자 로그인 내역 삭제
	 * 
	 * @param aloginno
	 * @return
	 */
	public int delete_alogin(int aloginno);
}
