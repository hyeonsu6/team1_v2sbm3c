package dev.mvc.recommend;

import java.util.ArrayList;

public interface RecommendProcInter {

	/**
	 * 전체 목록
	 * 
	 * @return
	 */
	public ArrayList<RecommendVO> list_all();

	/**
	 * recommendno 조회
	 * 
	 * @param recommendno
	 * @return
	 */
	public RecommendVO read(int recommendno);

	/**
	 * 삭제
	 * 
	 * @param recommendno
	 * @return 삭제된 레코드 개수
	 */
	public int delete(int recommendno);

}