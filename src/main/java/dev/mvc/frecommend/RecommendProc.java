package dev.mvc.frecommend;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.frecommend.RecommendProc")
public class RecommendProc implements RecommendProcInter {
	@Autowired // RecommendDAOInter interface를 구현한 클래스의 객체를 만들어 자동으로 할당해라.
	private RecommendDAOInter recommendDAO;

	@Override
	public ArrayList<RecommendVO> list_all() {
		ArrayList<RecommendVO> list = this.recommendDAO.list_all();
		return list;
	}

	@Override
	public RecommendVO read(int recommendno) {
		RecommendVO recommendVO = this.recommendDAO.read(recommendno);
		return recommendVO;
	}

	@Override
	public RecommendVO read_memberno(int memberno) {
		RecommendVO recommendVO = this.recommendDAO.read_memberno(memberno);
		return recommendVO;
	}

	@Override
	public int delete(int recommendno) {
		int cnt = this.recommendDAO.delete(recommendno);
		return cnt;
	}

}
