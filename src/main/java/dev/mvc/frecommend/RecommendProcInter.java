package dev.mvc.frecommend;

import java.util.ArrayList;

import dev.mvc.fcate.FcateVO;

public interface RecommendProcInter {

	/**
	 * 전체 목록
	 * 
	 * @return
	 */
	public ArrayList<RecommendVO> list_all();

	/**
	 * 회원을 이용한 조회
	 * 
	 * @param memberno
	 * @return
	 */
	public ArrayList<RecommendVO> list_by_memberno(int memberno);

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