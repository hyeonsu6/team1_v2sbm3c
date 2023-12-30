package dev.mvc.answer;

public interface AnswerDAOInter {
	/**
	 * 답변 등록
	 * 
	 * @param answerVO
	 * @return 등록된 레코드
	 */
	public int create(AnswerVO answerVO);

	/**
	 * 일반적인 조회
	 * 
	 * 등록, 수정, 삭제를 위해 존재
	 */
	public AnswerVO read(int ansno);

	/**
	 * 특정 잘문에 대한 조회
	 * 
	 * @param questno
	 * @return
	 */
	public AnswerVO read_questno(int questno);

	/**
	 * 답변 수정
	 * 
	 * @param answerVO
	 * @return
	 */
	public int update_answer(AnswerVO answerVO);

	/**
	 * 답변 삭제
	 * 
	 * @param ansno
	 * @return
	 */
	public int delete(int ansno);
}
