package dev.mvc.festival_likes;

public interface Festival_likeProcInter {
	/**
	 * 좋아요 등록
	 * 
	 * @param festival_likeVO
	 * @return 등록된 레코드 갯수
	 */
	public int do_like(Festival_likeVO festival_likeVO);

	/**
	 * 좋아요가 눌렸는지 아닌지의 상태
	 * 
	 * @param festival_likeVO
	 * @return 좋아요 상태 (likescheck 값)
	 */
	public int get_likecount(Festival_likeVO festival_likeVO);

	/**
	 * 좋아요 취소
	 * 
	 * @param festival_likeVO
	 * @return 삭제된 레코드 갯수
	 */
	public int delete_like(Festival_likeVO festival_likeVO);

	/**
	 * 좋아요 총 갯수
	 * 
	 * @param contentsno
	 * @return 총 좋아요 갯수
	 */
	public int get_total_likecount(int contentsno);
}
