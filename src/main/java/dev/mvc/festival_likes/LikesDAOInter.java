package dev.mvc.likes;

import org.apache.ibatis.annotations.Param;

public interface LikesDAOInter {

	/**
	 * 등록
	 */
	public int create(LikesVO likesVO);
	
	/**
     * 회원을 이용한 좋아요 조회
     */
	public int likes_memberno(@Param("contentsno") int contentsno, @Param("memberno") int memberno);
	
	/**
	 * 게시물의 좋아요 수 조회
	 */
	public int cnt(int contentsno);

	/**
	 * 좋아요 수 증가
	 */
	public int increaseCnt(int contentsno);

	/**
	 * 좋아요 삭제
	 */
	public int delete(int contentsno, int memberno);

}
