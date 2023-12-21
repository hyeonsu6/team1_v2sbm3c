DROP TABLE GOOD;   

CREATE TABLE GOOD(
        goodno                 NUMBER(10)         NOT NULL         PRIMARY KEY,
        memberno             NUMBER(10)         NULL ,
        contentsno           NUMBER(10)         NULL ,
        RDATE                DATE         NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES festival (contentsno)
);

COMMENT ON TABLE good is '축제/행사 컨텐츠 추천';
COMMENT ON COLUMN good.goodno is '좋아요 번호';
COMMENT ON COLUMN good.memberno is '회원번호';
COMMENT ON COLUMN good.contentsno is '컨텐츠번호';
COMMENT ON COLUMN good.RDATE is '추천 날짜';

DROP SEQUENCE GOOD_SEQ;

CREATE SEQUENCE GOOD_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--1) 기존에 추천을 했는지 확인하는 쿼리, 1: 좋아요 클릭함, 0: 아직 좋아요 클릭안함.
SELECT COUNT(*) as cnt
FROM good
WHERE memberno = 1 AND contentsno=1;

--2) 좋아요 처리
INSERT INTO good(goodno, memberno, contentsno, rdate)
VALUES(good_seq.nextval, 3, 1, SYSDATE);

--1) 1번 회원 로그인시 관심분야를 가져오는 SQL
   SELECT fcateno FROM frecommend WHERE memberno=1

--2) 가장 추천(좋아요)을 많이 받은 상품 10건 출력
-- 관심분야의 카테고리 1번 상품중에 recom(추천수) 컬럼의 내림차순 정렬후 상품 목록 6건을 출력 

SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM festival
                     WHERE fcateno=7 AND (title LIKE '%서울%' OR content LIKE '%서울%' OR word LIKE '%서울%')
                     ORDER BY recom DESC
           )          
)
WHERE r >= 1 AND r <= 6;
