package dev.mvc.frecommend;

import java.util.ArrayList;

public interface RecommendDAOInter {
	/**
	 * 전체 목록
	 * 
	 * @return
	 */
	public ArrayList<RecommendVO> list_all();

	/**
	 * 전체 조회
	 * 
	 * @param recommendno
	 * @return
	 */
	public RecommendVO read(int recommendno);

	/**
	 * 회원을 이용한 조회
	 * 
	 * @param memberno
	 * @return
	 */
	public RecommendVO read_memberno(int memberno);

	/**
	 * 삭제
	 * 
	 * @param recommendno
	 * @return 삭제된 레코드 개수
	 */
	public int delete(int recommendno);

}