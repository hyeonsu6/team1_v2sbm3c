package dev.mvc.frecommend;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.fcate.FcateVO;
import dev.mvc.festival.FestivalVO;
import dev.mvc.mlogin.MloginVO;

@Component("dev.mvc.frecommend.RecommendProc")
public class RecommendProc implements RecommendProcInter {
	@Autowired // RecommendDAOInter interface를 구현한 클래스의 객체를 만들어 자동으로 할당해라.
	private RecommendDAOInter recommendDAO;

	@Override
	public ArrayList<RecommendVO> list_all() {
		ArrayList<RecommendVO> list = this.recommendDAO.list_all();
		return list;
	}

	public ArrayList<RecommendVO> list_by_memberno(int memberno) {
		ArrayList<RecommendVO> list = this.recommendDAO.list_by_memberno(memberno);
		return list;
	}

	public ArrayList<RecommendVO> list_by_memberno_index(int memberno) {
		ArrayList<RecommendVO> list = this.recommendDAO.list_by_memberno_index(memberno);
		return list;
	}

	@Override
	public RecommendVO read(int recommendno) {
		RecommendVO recommendVO = this.recommendDAO.read(recommendno);
		return recommendVO;
	}

	@Override
	public ArrayList<RecommendVO> list_recom(FestivalVO festivalVO) {
		ArrayList<RecommendVO> list = this.recommendDAO.list_recom(festivalVO);
		return list;
	}

	@Override
	public ArrayList<FestivalVO> recom_like(int fcateno) {
		ArrayList<FestivalVO> list = this.recommendDAO.recom_like(fcateno);
		return list;
	}

}