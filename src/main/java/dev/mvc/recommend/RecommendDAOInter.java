package dev.mvc.recommend;

import java.util.ArrayList;

public interface RecommendDAOInter {
	/**
	 * 등록
	 * 
	 * @return
	 */
	public int create(RecommendVO recommendVO);

	/**
	 * 전체 목록
	 * 
	 * @return
	 */
	public ArrayList<RecommendVO> list_all();

	/**
	 * 조회
	 * 
	 * @param recommendno
	 * @return
	 */
	public RecommendVO read(int recommendno);

	/**
	 * memberno 조회
	 * 
	 * @param recommendno
	 * @return
	 */
	public RecommendVO read_by_memberno(int memberno);

	/**
	 * 삭제
	 * 
	 * @param recommendno
	 * @return 삭제된 레코드 개수
	 */
	public int delete(int recommendno);

}