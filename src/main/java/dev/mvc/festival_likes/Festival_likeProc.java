package dev.mvc.festival_likes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.festival_likes.Festival_likeProc")
public class Festival_likeProc implements Festival_likeProcInter {
	@Autowired
	private Festival_likeDAOInter festival_likeDAO;

	@Override
	public int do_like(Festival_likeVO festival_likeVO) {
		return festival_likeDAO.do_like(festival_likeVO);
	}

	@Override
	public int get_likecount(Festival_likeVO festival_likeVO) {
		return festival_likeDAO.get_likecount(festival_likeVO);
	}

	@Override
	public int delete_like(Festival_likeVO festival_likeVO) {
		return festival_likeDAO.delete_like(festival_likeVO);
	}

	@Override
	public int get_total_likecount(int contentsno) {
		return festival_likeDAO.get_total_likecount(contentsno);
	}
}
