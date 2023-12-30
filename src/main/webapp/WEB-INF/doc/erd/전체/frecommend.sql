/**********************************/
/* Table Name: 카테고리 추천        */
/**********************************/
DROP TABLE FRECOMMEND;   

CREATE TABLE FRECOMMEND(
  recommendno   NUMBER(8)   NOT NULL   PRIMARY KEY,
  memberno      NUMBER(10)  NULL,
  fcateno       NUMBER(10)  NULL,
  seq           NUMBER(2)   DEFAULT 1  NOT NULL,
  rdate         DATE        NOT NULL,
  FOREIGN KEY (memberno) REFERENCES MEMBER (memberno),
  FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno)
);

COMMENT ON TABLE FRECOMMEND IS '카테고리 추천';
COMMENT ON COLUMN FRECOMMEND.recommendno IS '추천번호';
COMMENT ON COLUMN FRECOMMEND.memberno IS '회원번호';
COMMENT ON COLUMN FRECOMMEND.fcateno IS '카테고리번호';
COMMENT ON COLUMN FRECOMMEND.seq IS '추천 우선순위';
COMMENT ON COLUMN FRECOMMEND.rdate IS '추천 날짜';

DROP SEQUENCE FRECOMMEND_SEQ;

CREATE SEQUENCE FRECOMMEND_SEQ
  START WITH 1           -- 시작 번호
  INCREMENT BY 1         -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                -- 2번은 메모리에서만 계산
  NOCYCLE;               -- 다시 1부터 생성되는 것을 방지

-- INSERT, 데이터 삽입
INSERT INTO FRECOMMEND (recommendno, memberno, fcateno, seq, rdate)
VALUES (FRECOMMEND_SEQ.NEXTVAL, 1, 7, 1, sysdate);

-- READ: List, 추천 전체 목록
SELECT recommendno, memberno, fcateno, seq, rdate
FROM FRECOMMEND
ORDER BY recommendno DESC;

-- READ, 회원 번호를 이용한 조회
SELECT recommendno, memberno, fcateno, seq, rdate
FROM FRECOMMEND
WHERE memberno = 1;

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
    FROM FESTIVAL
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
    FROM FESTIVAL
    ORDER BY cnt DESC
  )
)
WHERE r BETWEEN 1 AND 5;
