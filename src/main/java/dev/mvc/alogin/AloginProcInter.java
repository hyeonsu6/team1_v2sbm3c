package dev.mvc.alogin;

import java.util.ArrayList;

public interface AloginProcInter {
	/** 
	 * 등록, 추상 메소드 -> Spring Boot이 구현함.
	 * 
	 * @param aloginVO 객체
	 * @return 등록된 레코드 갯수
	 */
	public int create(AloginVO aloginVO);

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
	 * @param fcateno 삭제할 레코드 PK 번호
	 * @return 삭제된 레코드 갯수
	 */
	public int delete(int aloginno);

}
