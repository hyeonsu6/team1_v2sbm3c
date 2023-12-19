package dev.mvc.frecommend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.frecommend.RecommendProc")
public class RecommendProc implements RecommendProcInter {
	@Autowired // RecommendDAOInter interface를 구현한 클래스의 객체를 만들어 자동으로 할당해라.
	private RecommendDAOInter recommendDAO;

	@Override
	public int create(RecommendVO recommendVO) {
		int cnt = this.recommendDAO.create(recommendVO);
		return cnt;
	}

}
