package dev.mvc.frecommend;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.frecommend.RecommendProc")
public class RecommendProc implements RecommendProcInter {
	@Autowired // RecommendDAOInter interface를 구현한 클래스의 객체를 만들어 자동으로 할당해라.
	private RecommendDAOInter recommendDAO;

	// 등록
	@Override
	public int create(RecommendVO recommendVO) {
		int cnt = this.create(recommendVO);
		return cnt;
	}

	// 전체 조회
	@Override
	public ArrayList<RecommendVO> list_all() {
		ArrayList<RecommendVO> list = this.recommendDAO.list_all();
		return list;
	}

	// recommendno별 조회
	@Override
	public RecommendVO read(int recommendno) {
		RecommendVO recommendVO = this.recommendDAO.read(recommendno);
		return recommendVO;
	}

	// 삭제
	@Override
	public int delete(int recommendno) {
		int cnt = this.recommendDAO.delete(recommendno);
		return cnt;
	}

}
