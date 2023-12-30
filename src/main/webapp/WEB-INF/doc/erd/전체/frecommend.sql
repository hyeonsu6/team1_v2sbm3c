/**********************************/
/* Table Name: 카테고리 추천 */
/**********************************/
DROP TABLE FRECOMMEND;   

CREATE TABLE FRECOMMEND(
  RECOMMENDNO   NUMBER(8)   NOT NULL   PRIMARY KEY,
  MEMBERNO      NUMBER(10)  NULL,
  FCATENO       NUMBER(10)  NULL,
  SEQ           NUMBER(2)   DEFAULT 1  NOT NULL,
  RDATE         DATE        NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (FCATENO) REFERENCES FCATE (FCATENO)
);

COMMENT ON TABLE FRECOMMEND IS '카테고리 추천';
COMMENT ON COLUMN FRECOMMEND.RECOMMENDNO IS '추천번호';
COMMENT ON COLUMN FRECOMMEND.MEMBERNO IS '회원번호';
COMMENT ON COLUMN FRECOMMEND.FCATENO IS '카테고리번호';
-- cnt 대신 사용
COMMENT ON COLUMN FRECOMMEND.SEQ IS '추천 수';
COMMENT ON COLUMN FRECOMMEND.RDATE IS '추천 날짜';

DROP SEQUENCE FRECOMMEND_SEQ;

CREATE SEQUENCE FRECOMMEND_SEQ
  START WITH 1           -- 시작 번호
  INCREMENT BY 1         -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                -- 2번은 메모리에서만 계산
  NOCYCLE;               -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO frecommend (recommendno, memberno, fcateno, seq, rdate)
VALUES (FRECOMMEND_SEQ.nextval, 1, 7, 1, sysdate);

-- 추천 목록
SELECT recommendno, memberno, fcateno, seq, rdate
FROM frecommend
ORDER BY recommendno DESC;

-- 회원 번호를 이용한 조회
SELECT recommendno, memberno, fcateno, seq, rdate
FROM frecommend
WHERE memberno = 1;

-- 조회
SELECT recommendno, memberno, fcateno, seq, rdate
FROM frecommend
WHERE recommendno = 1;

-- 관심분야의 카테고리 1번 컨텐츠 중 recom(추천수) 컬럼의 내림차순 정렬후 상품 목록 5건을 출력
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate, file1, file1saved, thumb1,
       size1, r
FROM (
  SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate, file1,
         file1saved, thumb1, size1,
         rownum AS r
  FROM (
    SELECT contentsno, adminno, fcateno, title, content, recom, cnt,
           replycnt, rdate, file1, file1saved, thumb1, size1
    FROM festival
    WHERE fcateno=1
    ORDER BY recom DESC
  )
)
WHERE r BETWEEN 1 AND 5;

-- 조회수가 높은 영화 목록 5건을 출력        
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate, file1, file1saved, thumb1,
       size1, r
FROM (
  SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate, file1,
         file1saved, thumb1, size1,
         rownum AS r
  FROM (
    SELECT contentsno, adminno, fcateno, title, content, recom, cnt,
           replycnt, rdate, file1, file1saved, thumb1, size1
    FROM festival
    ORDER BY cnt DESC
  )
)
WHERE r BETWEEN 1 AND 5;
