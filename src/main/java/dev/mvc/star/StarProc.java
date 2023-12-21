package dev.mvc.star;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.star.StarProc")
public class StarProc implements StarProcInter {
	// StarDAOInter interface를 구현한 클래스의 객체를 만들어 자동으로 할당해라.
	@Autowired
	private StarDAOInter starDAO;

	@Override
	public int create(StarVO starVO) {
		// 등록
		int cnt = this.starDAO.create(starVO);
		return cnt;
	}

}
