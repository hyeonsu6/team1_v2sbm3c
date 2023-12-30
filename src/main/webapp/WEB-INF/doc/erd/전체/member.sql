/************************************/
/* Table Name: 회원 로그인 내역        */
/************************************/

-- 테이블 구조
-- member 삭제전에 FK가 선언된 blog 테이블 먼저 삭제합니다.
DROP TABLE qna;
DROP TABLE reply;
DROP TABLE member;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE MEMBER CASCADE CONSTRAINTS; 

CREATE TABLE MEMBER (
  memberno NUMBER(10) NOT NULL PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  id         VARCHAR(30)   NOT NULL UNIQUE, -- 이메일(아이디), 중복 안됨, 레코드를 구분 
  passwd     VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  mname      VARCHAR(30)   NOT NULL, -- 성명, 한글 10자 저장 가능
  tel            VARCHAR(14)   NOT NULL, -- 전화번호
  zipcode     VARCHAR(5)        NULL, -- 우편번호, 12345
  address1    VARCHAR(80)       NULL, -- 주소 1
  address2    VARCHAR(50)       NULL, -- 주소 2
  mdate       DATE             NOT NULL, -- 가입일    
  grade        NUMBER(2)     NOT NULL, -- 등급(1~10: 관리자, 11~20: 회원, 30~39: 비회원, 40~49: 정지 회원, 99: 탈퇴 회원)
);
 
COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.memberno is '회원 번호';
COMMENT ON COLUMN MEMBER.id is '아이디';
COMMENT ON COLUMN MEMBER.passwd is '패스워드';
COMMENT ON COLUMN MEMBER.mname is '성명';
COMMENT ON COLUMN MEMBER.tel is '전화번호';
COMMENT ON COLUMN MEMBER.zipcode is '우편번호';
COMMENT ON COLUMN MEMBER.address1 is '주소1';
COMMENT ON COLUMN MEMBER.address2 is '주소2';
COMMENT ON COLUMN MEMBER.mdate is '가입일';
COMMENT ON COLUMN MEMBER.grade is '등급';

DROP SEQUENCE MEMBER_SEQ;

CREATE SEQUENCE MEMBER_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
-- INSERT, 데이터 삽입
-- id 중복 확인(null 값을 가지고 있으면 count에서 제외됨)
SELECT COUNT(id)
FROM MEMBER
WHERE id='user1';

SELECT COUNT(id) as cnt
FROM MEMBER
WHERE id='user1';
   
-- INSERT, 데이터 삽입
-- 회원 관리용 계정, Q/A 용 계정
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode,
                                 address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.nextval, 'qnaadmin', '1234', '질문답변관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', sysdate, 1);
 
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode,
                                address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.nextval, 'crm', '1234', '고객관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', sysdate, 1);
 
-- INSERT, 데이터 삽입 개인 회원 테스트 계정
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'user1@gmail.com', '1234', '왕눈이', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'user2@gmail.com', '1234', '아로미', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'user3@gmail.com', '1234', '투투투', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
-- INSERT, 데이터 삽입 부서별(그룹별) 공유 회원 기준
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'team1', '1234', '개발팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'team2', '1234', '웹퍼블리셔팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'team3', '1234', '디자인팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);

INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'unsub', '1234', '탈퇴용', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);

INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'lock', '1234', '정지용', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);

COMMIT;
 
-- READ: List, 목록
-- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade
FROM MEMBER
ORDER BY grade ASC, id ASC;
     
-- READ, 조회    
-- 사원 정보 조회
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade
FROM MEMBER
WHERE memberno = 1;

SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade
FROM MEMBER
WHERE id = 'user1@gmail.com';

SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate, grade
FROM MEMBER
WHERE mname = '왕눈이' AND tel = '000-0000-0000';
    
-- UPDATE, 수정
UPDATE MEMBER 
SET id='user5', mname='조인성', tel='111-1111-1111', zipcode='00000',
    address1='강원도', address2='홍천군', grade=14
WHERE memberno=12;

COMMIT;

-- DELETE, 삭제
-- 1) 모두 삭제
DELETE FROM MEMBER;
 
-- 2) 특정 회원 삭제
DELETE FROM MEMBER
WHERE memberno=12;

COMMIT;

-- 로그인
SELECT COUNT(memberno) as cnt
FROM MEMBER
WHERE id='user1@gmail.com' AND passwd='1234';
   
-- 패스워드 변경
-- 패스워드 검사
SELECT COUNT(memberno) as cnt
FROM MEMBER
WHERE memberno=1 AND passwd='1234';
 
-- 패스워드 수정
UPDATE MEMBER
SET passwd='0000'
WHERE memberno=1;

COMMIT;


-- 회원 탈퇴
UPDATE MEMBER
SET grade=99
WHERE memberno=14;

UPDATE MEMBER
SET grade=15
WHERE memberno=14;

COMMIT;

-- 회원 정지
UPDATE MEMBER
SET grade=15
WHERE memberno=17;

COMMIT;
