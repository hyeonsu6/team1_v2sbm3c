package dev.mvc.frecommend;

import java.util.ArrayList;

import dev.mvc.fcate.FcateVO;
import dev.mvc.festival.FestivalVO;
import dev.mvc.mlogin.MloginVO;

public interface RecommendDAOInter {
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
	 * 회원을 이용한 조회 - 메인페이지에 사용
	 * 
	 * @param memberno
	 * @return
	 */
	public ArrayList<RecommendVO> list_by_memberno_index(int memberno);

	/**
	 * 전체 조회
	 * 
	 * @param recommendno
	 * @return
	 */
	public RecommendVO read(int recommendno);

	/**
	 * 전체 목록 + 페이징
	 * 
	 * @return
	 */
	public ArrayList<RecommendVO> list_recom(FestivalVO festivalVO);

	/**
	 * 추천해요
	 *  
	 * @return
	 */
	public ArrayList<FestivalVO> recom_like(int fcateno);
	
	/**
	 * 특정 카테고리 지정 추천해요
	 *  
	 * @return
	 */
	public ArrayList<FestivalVO> recom_like_new(int fcateno);

}