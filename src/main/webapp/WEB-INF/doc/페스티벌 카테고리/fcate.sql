/**********************************/
/* Table Name: 페스티벌 카테고리     */
/**********************************/
DROP TABLE FCATE;

CREATE TABLE FCATE(
    fcateno         NUMBER(10)      NOT NULL PRIMARY KEY,
    name            VARCHAR2(100)   NOT NULL,
    cnt             NUMBER(7)       DEFAULT 0 NOT NULL,
    rdate           DATE            NOT NULL,
    seqno           NUMBER(5)       DEFAULT 1 NOT NULL,
    visible         CHAR(1)         DEFAULT 'N' NOT NULL  
);
--
--COMMENT ON TABLE FCATE is '카테고리';
COMMENT ON COLUMN FCATE.FCATENO is '카테고리 번호';
COMMENT ON COLUMN FCATE.NAME is '카테고리 이름';
COMMENT ON COLUMN FCATE.CNT is '관련 자료수';
COMMENT ON COLUMN FCATE.RDATE is '등록일';
COMMENT ON COLUMN FCATE.SEQNO is '출력 순서';
COMMENT ON COLUMN FCATE.VISIBLE is '출력 모드';

DROP SEQUENCE FCATE_SEQ;

CREATE SEQUENCE FCATE_SEQ
  START WITH 1        -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지
  
-- INSERT, 데이터 삽입
-- INSERT INTO FCATE(FCATEno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '테마별', 0, sysdate); 
-- INSERT INTO FCATE(FCATEno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '지역별', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '지역 페스티벌', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '계절(겨울) 페스티벌', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '문화관광 페스티벌', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '예술(춤/무용/전통공연) 페스티벌', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '체험 페스티벌', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '인생샷(꽃/빛) 페스티벌', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '뮤직(재즈, K-POP) 페스티벌', 0, sysdate); 
INSERT INTO FCATE(fcateno, name, cnt, rdate) VALUES(FCATE_seq.nextval, '추천 테스트', 0, sysdate); 

-- READ: LIST, 전체 목록
SELECT * FROM FCATE;
SELECT FCATEno, name, cnt, rdate, seqno, visible FROM FCATE ORDER BY fcateno ASC;

-- READ, 특정 카테고리 조회
SELECT fcateno, name, cnt, rdate FROM FCATE WHERE fcateno=1;
        
-- UPDATE, 수정
UPDATE FCATE SET name='전라도', cnt=1 WHERE FCATEno=1;

-- DELETE, 삭제
DELETE FROM FCATE WHERE fcateno=1;
DELETE FROM FCATE WHERE fcateno >= 10;

COMMIT;

-- COUNT
SELECT COUNT(*) as cnt FROM FCATE;

-- 우선 순위 높임, 10 등 -> 1 등
UPDATE FCATE SET seqno = seqno - 1 WHERE fcateno=1;
SELECT fcateno, name, cnt, rdate, seqno FROM FCATE ORDER BY fcateno ASC;

-- 우선 순위 낮춤, 1 등 -> 10 등
UPDATE FCATE SET seqno = seqno + 1 WHERE fcateno=1;
SELECT fcateno, name, cnt, rdate, seqno FROM FCATE ORDER BY fcateno ASC;

-- READ: List, 목록
SELECT fcateno, name, cnt, rdate, seqno FROM FCATE ORDER BY seqno ASC;

COMMIT;

-- 카테고리 공개 설정
UPDATE FCATE SET visible='Y' WHERE fcateno=1;
SELECT fcateno, name, cnt, rdate, seqno, visible FROM FCATE ORDER BY fcateno ASC;

-- 카테고리 비공개 설정
UPDATE FCATE SET visible='N' WHERE fcateno=1;
SELECT fcateno, name, cnt, rdate, seqno, visible FROM FCATE ORDER BY fcateno ASC;

COMMIT;

-- 비회원/회원 SELECT LIST, id: list_all_y
SELECT fcateno, name, cnt, rdate, seqno, visible 
FROM FCATE 
WHERE visible='Y'
ORDER BY seqno ASC;

