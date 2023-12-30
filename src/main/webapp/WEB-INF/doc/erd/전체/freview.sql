/**********************************/
/* Table Name: 축제/행사 리뷰 */
/**********************************/
DROP TABLE FREVIEW;

CREATE TABLE FREVIEW(
		reviewno NUMBER(10) NOT NULL PRIMARY KEY,
		contentsno NUMBER(10),
        memberno NUMERIC(10),
        nickname VARCHAR2(50) NOT NULL,
		title VARCHAR2(100) NOT NULL,
		content CLOB NOT NULL,
        pwd VARCHAR2(10),
		rdate DATE NOT NULL,
        cnt NUMERIC(10),
        word VARCHAR2(100),
		file1 VARCHAR2(200),
        file1saved VARCHAR2(400),
		thumb1 VARCHAR2(200),
		size1 NUMBER(10),
		map VARCHAR2(2000),
    FOREIGN KEY (contentsno) REFERENCES FESTIVAL (contentsno),
    FOREIGN KEY (memberno) REFERENCES MEMBER (memberno)
);

DROP SEQUENCE review_seq;

CREATE SEQUENCE review_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
-- INSERT, 데이터 삽입
INSERT INTO FREVIEW (reviewno, contentsno, MEMBERNO, nickname, title, content, pwd, rdate, cnt, word, file1, file1saved, thumb1, size1, map) 
VALUES (review_seq.nextval, 1, 3, '아로미', '빛 축제', '처음 가봤는데 너무 이쁘고 좋았어요', '1234', sysdate, 0, '서울, 청계천', 'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 'sample_map_url');
INSERT INTO FREVIEW (reviewno, contentsno, MEMBERNO, nickname, title, content, pwd, rdate, cnt, word, file1, file1saved, thumb1, size1, map) 
VALUES (review_seq.nextval, 1, 3, '청계천 빛 축제', '투투투', '가족들과 함께 갔는데,,,', '1234', sysdate, 0, '서울, 빛','space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 'sample_map_url');

COMMIT;

-- READ: List 전체 리뷰 목록
SELECT reviewno, contentsno, memberno, nickname, title, content, pwd, rdate, cnt, word,
file1, file1saved, thumb1, size1
FROM freview
ORDER BY reviewno DESC;

-- READ: List 특정 컨텐츠의 등록된 리뷰 목록
SELECT reviewno, contentsno, memberno, nickname, title,
content, pwd, rdate, cnt, word,
file1, file1saved, thumb1, size1
FROM freview
WHERE contentsno = 1
ORDER BY reviewno DESC;

-- READ, 조회   
SELECT reviewno, contentsno, memberno, nickname, title, content, pwd,
rdate, cnt, word,
file1, file1saved, thumb1, size1, map
FROM freview
WHERE reviewno = 1;

-- INSERT, 맵 등록, 수정, 삭제
UPDATE freview SET map = '예시' WHERE reviewno=1;

-- INSERT, 유튜브 등록, 수정, 삭제
UPDATE freview SET youtube = '예시' WHERE reviewno=1;

-- UPDATE, 수정
UPDATE freview
SET title='테스트', content='테스트', word='테스트'
WHERE reviewno = 1;

COMMIT;

-- DELETE, 삭제
DELETE FROM freview
WHERE reviewno=1;

-- 특정 콘텐츠에 속한 레코드 갯수를 리턴
SELECT COUNT(*) as cnt
FROM freview
WHERE contentsno=1;

COMMIT;
