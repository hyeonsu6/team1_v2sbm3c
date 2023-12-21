package dev.mvc.star;

public interface StarDAOInter {
	
	/** 
	 * 등록, 추상 메소드 -> Spring Boot이 구현함.
	 * 
	 * @param starVO 객체
	 * @return 등록된 레코드 갯수
	 */
	public int create(StarVO starVO);
	
}
