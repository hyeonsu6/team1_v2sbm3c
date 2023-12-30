/**********************************/
/* Table Name: 페스티벌 콘텐츠       */
/**********************************/
DROP TABLE FESTIVAL CASCADE CONSTRAINTS; -- 자식 무시하고 삭제 가능
CREATE TABLE FESTIVAL(
        contentsno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        adminno                              NUMBER(10)     NOT NULL , -- FK
        fcateno                                NUMBER(10)         NOT NULL , -- FK
        title                                 VARCHAR2(100)         NOT NULL,
        content                               CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        cnt                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        word                                  VARCHAR2(100)         NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(50)          NULL,  -- 원본 파일명 image
        file1saved                            VARCHAR(50)          NULL,  -- 저장된 파일명, image
        thumb1                              VARCHAR(50)          NULL,   -- preview image
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  -- 파일 사이즈
        map                                   VARCHAR2(1000)            NULL,
        youtube                               VARCHAR2(1000)            NULL,
        FOREIGN KEY (adminno) REFERENCES admin (adminno),
        FOREIGN KEY (fcateno) REFERENCES fcate (fcateno)
);

COMMENT ON TABLE FESTIVAL is '페스티벌 콘텐츠';
COMMENT ON COLUMN FESTIVAL.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN FESTIVAL.adminno is '관리자 번호';
COMMENT ON COLUMN FESTIVAL.fcateno is '카테고리 번호';
COMMENT ON COLUMN FESTIVAL.title is '제목';
COMMENT ON COLUMN FESTIVAL.content is '내용';
COMMENT ON COLUMN FESTIVAL.recom is '추천수';
COMMENT ON COLUMN FESTIVAL.cnt is '조회수';
COMMENT ON COLUMN FESTIVAL.replycnt is '댓글수';
COMMENT ON COLUMN FESTIVAL.passwd is '패스워드';
COMMENT ON COLUMN FESTIVAL.word is '검색어';
COMMENT ON COLUMN FESTIVAL.rdate is '등록일';
COMMENT ON COLUMN FESTIVAL.file1 is '메인 이미지';
COMMENT ON COLUMN FESTIVAL.file1saved is '실제 저장된 파일명';
COMMENT ON COLUMN FESTIVAL.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN FESTIVAL.size1 is '메인 이미지 크기';
COMMENT ON COLUMN FESTIVAL.map is '지도';
COMMENT ON COLUMN FESTIVAL.youtube is 'Youtube 영상';

DROP SEQUENCE contents_seq;

CREATE SEQUENCE contents_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록 화면 유형 1: 커뮤니티(공지사항, 게시판, 자료실, 갤러리,  Q/A...)글 등록
INSERT INTO FESTIVAL(contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, 
                     word, rdate, file1, file1saved, thumb1, size1)
VALUES(contents_seq.nextval, 1, 1, '오버랜딩', '4WD 준비', 0, 0, 0, '123',
       '자연', sysdate, 'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000);

-- 유형 1, 전체 목록
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1
FROM FESTIVAL
ORDER BY contentsno DESC;

-- 유형 2, 카테고리별 목록
INSERT INTO FESTIVAL(contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, 
                     word, rdate, file1, file1saved, thumb1, size1)
VALUES(contents_seq.nextval, 1, 2, '태백', '산악 주행', 0, 0, 0, '123',
       '드라마,K드라마,넷플릭스', sysdate, 'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000);
            
INSERT INTO FESTIVAL(contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, 
                     word, rdate, file1, file1saved, thumb1, size1)
VALUES(contents_seq.nextval, 1, 2, '속초', '비포장 임도', 0, 0, 0, '123',
       '드라마,K드라마,넷플릭스', sysdate, 'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000);

INSERT INTO FESTIVAL(contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, 
                     word, rdate, file1, file1saved, thumb1, size1)
VALUES(contents_seq.nextval, 1, 2, '홍천', '서울에서 가까운 지역', 0, 0, 0, '123',
       '드라마,K드라마,넷플릭스', sysdate, 'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000);

COMMIT;

-- 1번 fcateno 만 출력
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE fcateno=1
ORDER BY contentsno DESC;

-- 2번 fcateno 만 출력
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE fcateno=2
ORDER BY contentsno ASC;

-- 3번 fcateno 만 출력
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE fcateno=3
ORDER BY contentsno ASC;

-- 일부 삭제
DELETE FROM FESTIVAL
WHERE contentsno <= 12;
COMMIT;

-- 모든 레코드 삭제
DELETE FROM FESTIVAL;
commit;

-- 삭제
DELETE FROM FESTIVAL
WHERE contentsno = 25;
commit;

DELETE FROM FESTIVAL
WHERE fcateno=12 AND contentsno <= 41;

commit;


-- ----------------------------------------------------------------------------------------------------
-- 검색, fcateno별 검색 목록
-- ----------------------------------------------------------------------------------------------------
-- 모든글
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
ORDER BY contentsno ASC;

-- 카테고리별 목록
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE fcateno=2
ORDER BY contentsno ASC;

-- 1) 검색
-- ① fcateno별 검색 목록
-- word 컬럼의 존재 이유: 검색 정확도를 높이기 위하여 중요 단어를 명시
-- 글에 'swiss'라는 단어만 등장하면 한글로 '스위스'는 검색 안됨.
-- 이런 문제를 방지하기위해 'swiss,스위스,스의스,수의스,유럽' 검색어가 들어간 word 컬럼을 추가함.
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, word, rdate,
           file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE fcateno=2 AND word LIKE '%탐험%'
ORDER BY contentsno DESC;

-- title, content, word column search
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, word, rdate,
           file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE fcateno=2 AND (title LIKE '%급여%' OR content LIKE '%급여%' OR word LIKE '%급여%')
ORDER BY contentsno DESC;

-- ② 검색 레코드 갯수
-- 전체 레코드 갯수, 집계 함수
SELECT COUNT(*)
FROM FESTIVAL
WHERE fcateno=2;

  COUNT(*)  <- 컬럼명
----------
         5
         
SELECT COUNT(*) as cnt -- 함수 사용시는 컬럼 별명을 선언하는 것을 권장
FROM FESTIVAL
WHERE fcateno=2;

       CNT <- 컬럼명
----------
         4

-- fcateno 별 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM FESTIVAL
WHERE fcateno=2 AND word LIKE '%급여%';

SELECT COUNT(*) as cnt
FROM FESTIVAL
WHERE fcateno=2 AND (title LIKE '%급여%' OR content LIKE '%급여%' OR word LIKE '%급여%');

-- SUBSTR(컬럼명, 시작 index(1부터 시작), 길이), 부분 문자열 추출
SELECT contentsno, SUBSTR(title, 1, 4) as title
FROM FESTIVAL
WHERE fcateno=2 AND (content LIKE '%급여%');

-- SQL은 대소문자를 구분하지 않으나 WHERE문에 명시하는 값은 대소문자를 구분하여 검색
SELECT contentsno, title, word
FROM FESTIVAL
WHERE fcateno=1 AND (word LIKE '%FOOD%');

SELECT contentsno, title, word
FROM FESTIVAL
WHERE fcateno=1 AND (word LIKE '%food%'); 

SELECT contentsno, title, word
FROM FESTIVAL
WHERE fcateno=1 AND (LOWER(word) LIKE '%food%'); -- 대소문자를 일치 시켜서 검색

-- ||: 문자열 연결
-- LIKE '%' || UPPER('FOOD') || '%' -> LIKE '%FOOD%'
SELECT contentsno, title, word
FROM FESTIVAL
WHERE fcateno=1 AND (UPPER(word) LIKE '%' || UPPER('FOOD') || '%'); -- 대소문자를 일치 시켜서 검색 ★

SELECT contentsno, title, word
FROM FESTIVAL
WHERE fcateno=1 AND (LOWER(word) LIKE '%' || LOWER('Food') || '%'); -- 대소문자를 일치 시켜서 검색

SELECT contentsno || '. ' || title || ' 태그: ' || word as title -- 컬럼의 결합, ||
FROM FESTIVAL
WHERE fcateno=1 AND (LOWER(word) LIKE '%' || LOWER('Food') || '%'); -- 대소문자를 일치 시켜서 검색


SELECT UPPER('한글') FROM dual; -- dual: 오라클에서 SQL 형식을 맞추기위한 시스템 테이블

-- ----------------------------------------------------------------------------------------------------
-- 검색 + 페이징 + 메인 이미지
-- ----------------------------------------------------------------------------------------------------
-- step 1
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE fcateno=2 AND (title LIKE '%탐험%' OR content LIKE '%탐험%' OR word LIKE '%탐험%')
ORDER BY contentsno DESC;

-- step 2
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, rownum as r
FROM (
          SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                     file1, file1saved, thumb1, size1, map, youtube
          FROM FESTIVAL
          WHERE fcateno=2 AND (title LIKE '%탐험%' OR content LIKE '%탐험%' OR word LIKE '%탐험%')
          ORDER BY contentsno DESC
);

-- step 3, 1 page
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=1 AND (UPPER(title) LIKE '%' || UPPER('탐험') || '%' 
                                         OR UPPER(content) LIKE '%' || UPPER('탐험') || '%' 
                                         OR UPPER(word) LIKE '%' || UPPER('탐험') || '%')
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- step 3, 2 page
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=1 AND (UPPER(title) LIKE '%' || UPPER('탐험') || '%' 
                                         OR UPPER(content) LIKE '%' || UPPER('탐험') || '%' 
                                         OR UPPER(word) LIKE '%' || UPPER('탐험') || '%')
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 4 AND r <= 6;

-- 대소문자를 처리하는 페이징 쿼리
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=2 AND (UPPER(title) LIKE '%' || UPPER('탐험') || '%' 
                                         OR UPPER(content) LIKE '%' || UPPER('탐험') || '%' 
                                         OR UPPER(word) LIKE '%' || UPPER('탐험') || '%')
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 7 AND r <= 9;

-- ----------------------------------------------------------------------------
-- 조회
-- ----------------------------------------------------------------------------
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
WHERE contentsno = 1;

-- ----------------------------------------------------------------------------
-- 다음 지도, MAP, 먼저 레코드가 등록되어 있어야함.
-- map                                   VARCHAR2(1000)         NULL ,
-- ----------------------------------------------------------------------------
-- MAP 등록/수정
UPDATE FESTIVAL SET map='카페산 지도 스크립트' WHERE contentsno=1;

-- MAP 삭제
UPDATE FESTIVAL SET map='' WHERE contentsno=1;

commit;

-- ----------------------------------------------------------------------------
-- Youtube, 먼저 레코드가 등록되어 있어야함.
-- youtube                                   VARCHAR2(1000)         NULL ,
-- ----------------------------------------------------------------------------
-- youtube 등록/수정
UPDATE FESTIVAL SET youtube='Youtube 스크립트' WHERE contentsno=1;

-- youtube 삭제
UPDATE FESTIVAL SET youtube='' WHERE contentsno=1;

commit;

-- 패스워드 검사, id="password_check"
SELECT COUNT(*) as cnt 
FROM FESTIVAL
WHERE contentsno=1 AND passwd='123';

-- ----------------------------------------------------------------------------
-- 글 수정
-- ----------------------------------------------------------------------------
-- 텍스트 수정: 예외 컬럼: 추천수, 조회수, 댓글 수
UPDATE FESTIVAL
SET title='4WD 차량 추천', content='오프로드 경사 및 눈길 주행 능력 우수차량한 렉스턴 추천',  word='4WD,차량,경사,눈길' 
WHERE contentsno = 17;

-- ERROR, " 사용 에러
UPDATE FESTIVAL
SET title='기차를 타고', content="계획없이 '여행' 출발",  word='나,기차,생각'
WHERE contentsno = 1;

-- ERROR, \' 에러
UPDATE FESTIVAL
SET title='기차를 타고', content='계획없이 \'여행\' 출발',  word='나,기차,생각'
WHERE contentsno = 1;

-- SUCCESS, '' 한번 ' 출력됨.
UPDATE FESTIVAL
SET title='닭갈비 추천', content='진짜 ''닭갈비'' 추천합니다.',  word='닭갈비'
WHERE contentsno = 19;

-- SUCCESS
UPDATE FESTIVAL
SET title='정동진 추천', content='정동진 "혼자" 찍고 오기',  word='나,기차,생각'
WHERE contentsno = 31;

commit;

-- ----------------------------------------------------------------------------
-- 파일 수정
-- file1: 메인 이미지, 원본 파일명
-- file1saved: 실제 저장된 파일명
-- thumb1: 메인 이미지 Preview
-- size1: 메인 이미지 크기, 파일 크기
-- ----------------------------------------------------------------------------
UPDATE FESTIVAL
SET file1='train.jpg', file1saved='train.jpg', thumb1='train_t.jpg', size1=5000
WHERE contentsno = 1;

-- 삭제
DELETE FROM FESTIVAL
WHERE contentsno = 42;

commit;

DELETE FROM FESTIVAL
WHERE contentsno >= 7;

commit;

-- 추천
UPDATE FESTIVAL
SET recom = recom + 1
WHERE contentsno = 1;

-- fcateno FK 특정 그룹에 속한 레코드 갯수 산출
SELECT COUNT(*) as cnt 
FROM FESTIVAL 
WHERE fcateno=7;

-- adminno FK 특정 관리자에 속한 레코드 갯수 산출
SELECT COUNT(*) as cnt 
FROM FESTIVAL 
WHERE adminno=1;

-- fcateno FK 특정 그룹에 속한 레코드 모두 삭제
DELETE FROM FESTIVAL
WHERE fcateno=7;

-- adminno FK 특정 관리자에 속한 레코드 모두 삭제
DELETE FROM FESTIVAL
WHERE adminno=1;

commit;

-- 다수의 카테고리에 속한 레코드 갯수 산출: IN
SELECT COUNT(*) as cnt
FROM FESTIVAL
WHERE fcateno IN(1,2,3);

-- 다수의 카테고리에 속한 레코드 모두 SELECT
SELECT contentsno, adminno, fcateno, title
FROM FESTIVAL
WHERE fcateno IN(1,2,3);

CONTENTSNO    ADMINNO     fcateno TITLE                                                                                                                                                                                                                                                                                                       
---------- ---------- ---------- ------------------------
         3             1                   1           인터스텔라                                                                                                                                                                                                                                                                                                  
         4             1                   2           드라마                                                                                                                                                                                                                                                                                                      
         5             1                   3           컨저링                                                                                                                                                                                                                                                                                                      
         6             1                   1           마션       
         
SELECT contentsno, adminno, fcateno, title
FROM FESTIVAL
WHERE fcateno IN('1','2','3');

CONTENTSNO    ADMINNO     fcateno TITLE                                                                                                                                                                                                                                                                                                       
---------- ---------- ---------- ------------------------
         3             1                   1           인터스텔라                                                                                                                                                                                                                                                                                                  
         4             1                   2           드라마                                                                                                                                                                                                                                                                                                      
         5             1                   3           컨저링                                                                                                                                                                                                                                                                                                      
         6             1                   1           마션
         
-- FK 컬럼별 삭제: 1번 카테고리 관련글 모두 삭제 
DELETE FROM FESTIVAL
WHERE fcateno=1;

-- 1번 관리자가 작성한 글 모두 삭제
DELETE FROM FESTIVAL
WHERE adminno=1;

-- ----------------------------------------------------------------------------------------------------
-- cate + FESTIVAL INNER JOIN
-- ----------------------------------------------------------------------------------------------------
-- 모든글
SELECT c.name,
       t.contentsno, t.adminno, t.fcateno, t.title, t.content, t.recom, t.cnt, t.replycnt, t.word, t.rdate,
       t.file1, t.file1saved, t.thumb1, t.size1, t.map, t.youtube
FROM cate c, FESTIVAL t
WHERE c.fcateno = t.fcateno
ORDER BY t.contentsno DESC;

-- FESTIVAL, admin INNER JOIN
SELECT t.contentsno, t.adminno, t.fcateno, t.title, t.content, t.recom, t.cnt, t.replycnt, t.word, t.rdate,
       t.file1, t.file1saved, t.thumb1, t.size1, t.map, t.youtube,
       a.mname
FROM admin a, FESTIVAL t
WHERE a.adminno = t.adminno
ORDER BY t.contentsno DESC;

SELECT t.contentsno, t.adminno, t.fcateno, t.title, t.content, t.recom, t.cnt, t.replycnt, t.word, t.rdate,
       t.file1, t.file1saved, t.thumb1, t.size1, t.map, t.youtube,
       a.mname
FROM admin a INNER JOIN FESTIVAL t ON a.adminno = t.adminno
ORDER BY t.contentsno DESC;

-- ----------------------------------------------------------------------------------------------------
-- View + paging
-- ----------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vcontents
AS
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, word, rdate,
        file1, file1saved, thumb1, size1, map, youtube
FROM FESTIVAL
ORDER BY contentsno DESC;
                     
-- 1 page
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
       file1, file1saved, thumb1, size1, map, youtube, r
FROM (
     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
            file1, file1saved, thumb1, size1, map, youtube, rownum as r
     FROM vcontents -- View
     WHERE fcateno=14 AND (title LIKE '%야경%' OR content LIKE '%야경%' OR word LIKE '%야경%')
)
WHERE r >= 1 AND r <= 3;

-- 2 page
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
       file1, file1saved, thumb1, size1, map, youtube, r
FROM (
     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
            file1, file1saved, thumb1, size1, map, youtube, rownum as r
     FROM vcontents -- View
     WHERE fcateno=14 AND (title LIKE '%야경%' OR content LIKE '%야경%' OR word LIKE '%야경%')
)
WHERE r >= 4 AND r <= 6;


-- ----------------------------------------------------------------------------------------------------
-- 관심 카테고리의 좋아요(recom) 기준, 1번 회원이 1번 카테고리를 추천 받는 경우, 추천 상품이 7건일 경우
-- ----------------------------------------------------------------------------------------------------
SELECT contentsno, adminno, fcateno, title, thumb1, r
FROM (
           SELECT contentsno, adminno, fcateno, title, thumb1, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, thumb1
                     FROM FESTIVAL
                     WHERE fcateno=1
                     ORDER BY recom DESC
           )          
)
WHERE r >= 1 AND r <= 7;

-- ----------------------------------------------------------------------------------------------------
-- 관심 카테고리의 평점(score) 기준, 1번 회원이 1번 카테고리를 추천 받는 경우, 추천 상품이 7건일 경우
-- ----------------------------------------------------------------------------------------------------
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=1
                     ORDER BY score DESC
           )          
)
WHERE r >= 1 AND r <= 7;

-- ----------------------------------------------------------------------------------------------------
-- 관심 카테고리의 최신 상품 기준, 1번 회원이 1번 카테고리를 추천 받는 경우, 추천 상품이 7건일 경우
-- ----------------------------------------------------------------------------------------------------
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=1
                     ORDER BY rdate DESC
           )          
)
WHERE r >= 1 AND r <= 7;

-- ----------------------------------------------------------------------------------------------------
-- 관심 카테고리의 조회수 높은 상품기준, 1번 회원이 1번 카테고리를 추천 받는 경우, 추천 상품이 7건일 경우
-- ----------------------------------------------------------------------------------------------------
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=1
                     ORDER BY cnt DESC
           )          
)
WHERE r >= 1 AND r <= 7;

-- ----------------------------------------------------------------------------------------------------
-- 관심 카테고리의 낮은 가격 상품 추천, 1번 회원이 1번 카테고리를 추천 받는 경우, 추천 상품이 7건일 경우
-- ----------------------------------------------------------------------------------------------------
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=1
                     ORDER BY price ASC
           )          
)
WHERE r >= 1 AND r <= 7;

-- ----------------------------------------------------------------------------------------------------
-- 관심 카테고리의 높은 가격 상품 추천, 1번 회원이 1번 카테고리를 추천 받는 경우, 추천 상품이 7건일 경우
-- ----------------------------------------------------------------------------------------------------
SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, map, youtube, r
FROM (
           SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, fcateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, map, youtube
                     FROM FESTIVAL
                     WHERE fcateno=1
                     ORDER BY price DESC
           )          
)
WHERE r >= 1 AND r <= 7;

