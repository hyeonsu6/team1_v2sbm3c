package dev.mvc.frecommend;

import java.util.ArrayList;

public interface RecommendDAOInter {

	/**
	 * 등록, 추상 메소드 -> Spring Boot이 구현함.
	 * 
	 * @param recommendVO 객체
	 * @return 등록된 레코드 갯수
	 */
	public int create(RecommendVO recommendVO);

	/**
	 * 전체 조회
	 */
	public ArrayList<RecommendVO> list_all();

	/**
	 * 조회 by memberno
	 */
	public RecommendVO read(int recommendno);

	/**
	 * 삭제
	 */
	public int delete(int recommendno);

}
