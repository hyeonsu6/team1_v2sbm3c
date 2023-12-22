package dev.mvc.likes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.likes.LikesProc")
public class LikesProc implements LikesProcInter {
	@Autowired
	private LikesDAOInter likesDAO;

	@Override
	public int create(LikesVO likesVO) {
		return likesDAO.create(likesVO);
	}

	@Override
	public int likes_memberno(int contentsno, int memberno) {
		return likesDAO.likes_memberno(contentsno, memberno);
	}

	@Override
	public int cnt(int contentsno) {
		return likesDAO.cnt(contentsno);
	}

	@Override
	public int increaseCnt(int contentsno) {
		return likesDAO.increaseCnt(contentsno);
	}

	@Override
	public int delete(int contentsno, int memberno) {
		return likesDAO.delete(contentsno, memberno);
	}
}
