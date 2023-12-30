/**********************************/
/* Table Name: 관리자              */
/**********************************/
DROP TABLE ADMIN;

CREATE TABLE ADMIN (
    adminno NUMBER(5) NOT NULL PRIMARY KEY,        -- 관리자 번호
    id VARCHAR(20) NOT NULL UNIQUE,                -- 아이디, 중복 안됨, 레코드를 구분 
    passwd VARCHAR(15) NOT NULL,                   -- 패스워드, 영숫자 조합
    mname VARCHAR(20) NOT NULL,                    -- 성명, 한글 10자 저장 가능
    mdate DATE NOT NULL,                           -- 가입일    
    grade NUMBER(2) NOT NULL,                      -- 등급(1~10: 관리자, 정지 관리자: 20, 탈퇴 관리자: 99)    
);

COMMENT ON TABLE ADMIN IS '관리자';
COMMENT ON COLUMN ADMIN.adminno IS '관리자 번호';
COMMENT ON COLUMN ADMIN.id IS '아이디';
COMMENT ON COLUMN ADMIN.passwd IS '패스워드';
COMMENT ON COLUMN ADMIN.mname IS '이름';
COMMENT ON COLUMN ADMIN.mdate IS '가입일';
COMMENT ON COLUMN ADMIN.grade IS '등급';

DROP SEQUENCE ADMIN_SEQ;

CREATE SEQUENCE ADMIN_SEQ
    START WITH 1               -- 시작 번호
    INCREMENT BY 1             -- 증가값
    MAXVALUE 99999             -- 최대값: 99999 --> NUMBER(5) 대응
    CACHE 2                    -- 2번은 메모리에서만 계산
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

-- INSERT, 데이터 삽입
INSERT INTO ADMIN (adminno, id, passwd, mname, mdate, grade)
VALUES (ADMIN_SEQ.NEXTVAL, 'admin1', '1234', '관리자1', SYSDATE, 1);

INSERT INTO ADMIN (adminno, id, passwd, mname, mdate, grade)
VALUES (ADMIN_SEQ.NEXTVAL, 'admin2', '1234', '관리자2', SYSDATE, 1);

INSERT INTO ADMIN (adminno, id, passwd, mname, mdate, grade)
VALUES (ADMIN_SEQ.NEXTVAL, 'admin3', '1234', '관리자3', SYSDATE, 1);

COMMIT;

-- READ: List, 관리자 전체 목록(adminno를 기준으로 오름차순 정렬)
SELECT adminno, id, passwd, mname, mdate, grade FROM ADMIN ORDER BY adminno ASC;
   
-- READ: 조회, 특정 관리자 조회
SELECT adminno, id, passwd, mname, mdate, grade 
FROM ADMIN
WHERE adminno = 1;

-- READ by id, 조회(id = 'admin1'에 해당하는 것만 조회)
SELECT adminno, id, passwd, mname, mdate, grade 
FROM ADMIN
WHERE id = 'admin1';

-- UPDATE, 수정
UPDATE ADMIN
SET passwd='1234', mname='관리자1', mdate=SYSDATE, grade=1
WHERE adminno = 1;

COMMIT;

-- DELETE, 삭제
DELETE FROM ADMIN WHERE adminno=3;
         
-- 로그인 확인, 1: 로그인 성공, 0: 로그인 실패
SELECT COUNT(*) AS cnt
FROM ADMIN
WHERE id='admin1' AND passwd = '1234'; 

COMMIT;




/**************************************/
/* Table Name: 관리자 로그인 내역        */
/**************************************/
DROP TABLE ALOGIN;

CREATE TABLE ALOGIN (
    aloginno   NUMBER(10)    NOT NULL PRIMARY KEY,
    adminno    NUMBER(10)    NOT NULL,  -- FK
    ip         VARCHAR2(15)  NOT NULL,
    logindate  DATE          NOT NULL,
    FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE ALOGIN IS '로그인 내역';
COMMENT ON COLUMN ALOGIN.aloginno IS '로그인 번호';
COMMENT ON COLUMN ALOGIN.adminno IS '관리자 번호';
COMMENT ON COLUMN ALOGIN.ip IS '접속 IP';
COMMENT ON COLUMN ALOGIN.logindate IS '로그인 날짜';

DROP SEQUENCE ALOGIN_SEQ;

CREATE SEQUENCE ALOGIN_SEQ
    START WITH 1             -- 시작 번호
    INCREMENT BY 1           -- 증가값
    MAXVALUE 9999999999      -- 최대값: 9999999999 --> NUMBER(10) 대응
    CACHE 2                  -- 2번은 메모리에서만 계산
    NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지

-- INSERT, 데이터 삽입
INSERT INTO ALOGIN (aloginno, adminno, ip, logindate)
VALUES (ALOGIN_SEQ.NEXTVAL, 1, '192.168.2.2', SYSDATE);

COMMIT;

-- READ: List, 로그인 내역 전체 목록
SELECT * FROM ALOGIN;

-- READ: List, 특정 관리자 로그인 내역(adminno = 1에 해당하는 로그인 내역)
SELECT * FROM ALOGIN WHERE adminno = 1;

-- DELETE, 삭제
DELETE FROM ALOGIN WHERE aloginno = 2;

COMMIT;





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





/************************************/
/* Table Name: 회원 로그인 내역        */
/************************************/
DROP TABLE MLOGIN;

CREATE TABLE MLOGIN(
  mloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  memberno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(15) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (memberno) REFERENCES MEMBER (memberno)
);

COMMENT ON TABLE MLOGIN is '로그인 내역';
COMMENT ON COLUMN MLOGIN.mloginno is '로그인 번호';
COMMENT ON COLUMN MLOGIN.memberno is '회원 번호';
COMMENT ON COLUMN MLOGIN.ip is '접속 IP';
COMMENT ON COLUMN MLOGIN.logindate is '로그인 날짜';

DROP SEQUENCE MLOGIN_SEQ;

CREATE SEQUENCE MLOGIN_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
  
-- INSERT, 데이터 삽입
INSERT INTO MLOGIN (mloginno, memberno, ip, logindate)
VALUES (MLOGIN_SEQ.NEXTVAL, 3, '192.168.2.2', SYSDATE);

COMMIT;

-- READ: List, 목록
SELECT * FROM MLOGIN;

-- READ, 특정 회원의 로그인 전체 목록
SELECT * FROM MLOGIN WHERE memberno = 4;

-- DELETE, 로그인 내역 삭제
DELETE FROM MLOGIN WHERE mloginno = 1;





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




/**********************************/
/* Table Name: 리뷰댓글             */
/**********************************/
DROP TABLE FREVIEW_REPLY;

CREATE TABLE FREVIEW_REPLY(
		replyno     NUMERIC(10)     NOT NULL PRIMARY KEY,
		reviewno    NUMBER(10)      NOT NULL,
		id          VARCHAR(30)     NOT NULL,
		reply       VARCHAR(150)    NOT NULL,
		passwd      VARCHAR(10)     NOT NULL,
		rdate       DATE            NOT NULL,
  FOREIGN KEY (id) REFERENCES MEMBER (id),
  FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno)
);

COMMENT ON TABLE FREVIEW_REPLY is '리뷰 댓글';
COMMENT ON COLUMN FREVIEW_REPLY.replyno is '댓글번호';
COMMENT ON COLUMN FREVIEW_REPLY.reviewno is '리뷰번호';
COMMENT ON COLUMN FREVIEW_REPLY.id is '회원 아이디';
COMMENT ON COLUMN FREVIEW_REPLY.reply is '댓글내용';
COMMENT ON COLUMN FREVIEW_REPLY.passwd is '패스워드';
COMMENT ON COLUMN FREVIEW_REPLY.rdate is '등록일';

DROP SEQUENCE FREVIEW_REPLY_SEQ;

CREATE SEQUENCE FREVIEW_REPLY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
 

COMMIT; 

/*******************************************************************************/

-- INSERT, 데이터 삽입
INSERT INTO FREVIEW_REPLY(replyno, reviewno, id, reply, passwd, rdate)
VALUES (FREVIEW_REPLY_SEQ.NEXTVAL, 6, 'user1@gmail.com', '리뷰보고 다녀왔는데 너무 재밌었어요~!', '1234', sysdate);
INSERT INTO FREVIEW_REPLY(replyno, reviewno, id, reply, passwd, rdate)
VALUES (FREVIEW_REPLY_SEQ.NEXTVAL, 6, 'user1@gmail.com', '추천해요~!! 완전 재밌어요~', '1234', sysdate);
INSERT INTO FREVIEW_REPLY(NEXTVAL, reviewno, id, reply, passwd, rdate)
VALUES (FREVIEW_REPLY_SEQ.NEXTVAL, 6, 'user1@gmail.com', '사람 엄청 많아요! 조심하세요~', '1234', sysdate);

COMMIT; 


-- READ, 목록&조회   
SELECT replyno, reviewno, id, reply, passwd, rdate FROM FREVIEW_REPLY ORDER BY replyno ASC;
SELECT replyno, reviewno, id, reply, passwd, rdate FROM FREVIEW_REPLY WHERE reviewno = 6 ORDER BY replyno ASC;
SELECT replyno, reviewno, id, reply, passwd, rdate FROM FREVIEW_REPLY WHERE id = 'user2@gmail.com' ORDER BY replyno ASC;


-- UPDATE, 수정
UPDATE FREVIEW_REPLY SET reply = '리뷰보고 다녀왔는데 너무 재밌었어요~~~!' WHERE replyno = 1;

COMMIT; 

-- DELETE, 삭제
DELETE FROM FREVIEW_REPLY WHERE replyno = 8 AND passwd = '1234';

COMMIT; 




/* Table name: Question */
DROP TABLE QUESTION;

CREATE TABLE QUESTION(
    questno     NUMBER(10)      NOT NULL PRIMARY KEY,
    memberno    NUMBER(10)      NOT NULL,   -- FK
    fcateno     NUMBER(10)      NOT NULL,   -- FK
    title       VARCHAR(50)     NOT NULL,
    quest       VARCHAR(300)    NOT NULL,
    rdate       DATE            NOT NULL,
    FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno),
    FOREIGN KEY (memberno) REFERENCES MEMBER (memberno),
);

COMMENT ON TABLE QUESTION is '질문';
COMMENT ON COLUMN QUESTION.questno is '질문 번호';
COMMENT ON COLUMN QUESTION.memberno is '회원 번호';
COMMENT ON COLUMN QUESTION.fcateno is '축제 카테고리 번호';
COMMENT ON COLUMN QUESTION.title is '제목';
COMMENT ON COLUMN QUESTION.quest is '질문내용';
COMMENT ON COLUMN QUESTION.rdate is '등록일';

DROP SEQUENCE QUESTION_SEQ;

CREATE SEQUENCE QUESTION_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

-- INSERT, 데이터 삽입
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 1, '제목', '내용', sysdate);

INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 1, '질문 테스트', '질문 내용 테스트', sysdate);
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 2, 'OO지역 페스티벌', '내용이 다릅니다. 수정해주세요.', sysdate);
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 3, 'OO 봄 페스티벌', '비슷한 내용의 글을 추가해도 되나요?', sysdate);
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 4, '문화관광', '사진 수정해주세요~', sysdate);

-- READ: List, 목록&조회
SELECT questno, memberno, fcateno, title, quest, rdate FROM question ORDER BY questno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question ORDER BY fcateno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question ORDER BY memberno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question WHERE fcateno = 3 ORDER BY questno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question WHERE fcateno = 2 AND quest LIKE '%내용%' ORDER BY questno ASC;

-- UPDATE
-- UPDATE question SET title = '결제 방법', quest = '결제는 어떻게 하나요' WHERE questno  = 1;

-- commit;

-- DELETE, 삭제
-- DELETE FROM question;
DELETE FROM question WHERE questno = 13;


-- COUNT
SELECT COUNT(*) as cnt FROM question WHERE fcateno = 1;
SELECT COUNT(*) as cnt FROM question WHERE fcateno = 3 AND quest LIKE '%사진%';





/**********************************/
/* Table Name: 답변                */
/**********************************/
DROP TABLE ANSWER;

CREATE TABLE ANSWER(
    ansno       NUMBER(10)      NOT NULL,
    questno     NUMBER(10)      NOT NULL,  -- FK
    ans         VARCHAR(300)    NOT NULL,
    adminno     NUMBER(5)       NOT NULL,  -- FK
    rdate       DATE            NOT NULL,
    FOREIGN KEY (questno) REFERENCES QUESTION (questno),
    FOREIGN KEY (adminno) REFERENCES ADMIN (adminno),
    PRIMARY KEY (ansno)
);

COMMENT ON TABLE ANSWER IS '답변';
COMMENT ON COLUMN ANSWER.ansno IS '답변 번호';
COMMENT ON COLUMN ANSWER.questno IS '질문 번호';
COMMENT ON COLUMN ANSWER.ans IS '답변 내용';
COMMENT ON COLUMN ANSWER.adminno IS '관리자 번호';
COMMENT ON COLUMN ANSWER.rdate IS '등록일';

DROP SEQUENCE ANSWER_SEQ;

CREATE SEQUENCE ANSWER_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

-- INSERT, 데이터 삽입
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 1, '[등록]을 눌러 글을 입력할 수 있습니다.', 1, SYSDATE);
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 2, '수정하였습니다. 불편을 드려 죄송합니다.', 1, SYSDATE);
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 3, '네. 내용 상관없이 등록 가능합니다.', 1, SYSDATE);
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 4, '수정하였습니다. 불편을 드려 죄송합니다.', 1, SYSDATE);

COMMIT;

-- READ, 목록&조회   
SELECT ansno, questno, ans, adminno, rdate FROM ANSWER ORDER BY ansno DESC;
SELECT ansno, questno, ans, adminno, rdate FROM ANSWER WHERE adminno = 1 ORDER BY ansno DESC;
SELECT ansno, questno, ans, adminno, rdate FROM ANSWER WHERE adminno = 1 AND ans LIKE '%수정%' ORDER BY ansno DESC;

-- UPDATE, 수정
-- UPDATE ANSWER SET ans = '카드, 무통장입금 등' WHERE ansno = 1;
UPDATE ANSWER
SET ans = '[등록]을 눌러 글을 입력해주세요.'
WHERE ansno = 1;
   
COMMIT;   
        
-- DELETE, 삭제
DELETE FROM ANSWER WHERE ansno = 16;
COMMIT;

-- COUNT
SELECT COUNT(*) AS cnt FROM ANSWER WHERE ansno = 1;
SELECT COUNT(*) AS cnt FROM ANSWER WHERE ansno = 1 AND ans LIKE '%카드%';





/**********************************/
/* Table Name: 챗봇                */
/**********************************/
DROP TABLE CHATTING;

CREATE TABLE CHATTING(
    chattingno      NUMBER(10)      NOT NULL PRIMARY KEY,
    memberno        NUMBER(10)      NOT NULL,   -- FK
    msg             VARCHAR(500)    NOT NULL,
    rdate           DATE            NOT NULL,
    FOREIGN KEY (memberno) REFERENCES MEMBER (memberno)
);

COMMENT ON TABLE CHATTING is '응답';
COMMENT ON COLUMN CHATTING.chattingno is '채팅 번호';
COMMENT ON COLUMN CHATTING.memberno is '회원 번호';
COMMENT ON COLUMN CHATTING.msg is '채팅 메시지';
COMMENT ON COLUMN CHATTING.rdate is '등록일';

DROP SEQUENCE CHATTING_SEQ;

CREATE SEQUENCE CHATTING_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지


commit;

------------------------------------------------------------------------------------
-- GPT ChatBot용 관리자 계정 추가
INSERT INTO MEMBER(memberno, id, passwd, mname, tel, zipcode,
                                 address1, address2, mdate, grade)
VALUES (MEMBER_SEQ.NEXTVAL, 'gpt', '1234', 'Chatting 관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', sysdate, 1);

COMMIT;

INSERT INTO CHATTING(chattingno, memberno, msg, rdate)
VALUES(CHATTING_SEQ.NEXTVAL, 3, '안녕하세요.',sysdate);

INSERT INTO CHATTING(chattingno, memberno, msg, rdate)
VALUES(CHATTING_SEQ.NEXTVAL, 1, '네 안녕하세요, 저는 챗봇입니다.',sysdate);

COMMIT;
------------------------------------------------------------------------------------
/*AWS-kd의 CHATTING 테이블*/
-- 조회
-- 2023-11-24일자 채팅만 출력
SELECT chattingno, memberno, msg, rdate
FROM CHATTING
WHERE memberno=1 and SUBSTR(rdate, 1, 10) = '2023-12-16';

-- 시분초 일치하지 않음, 조회안됨
SELECT chattingno, memberno, msg, rdate
FROM CHATTING
WHERE memberno=1 and rdate = TO_DATE('2023-12-16', 'YYYY-MM-DD');

-- 문열로 변경하는 가능함
SELECT chattingno, memberno, msg, rdate
FROM CHATTING
WHERE memberno=1 and TO_CHAR(rdate, 'YYYY-MM-DD') = '2023-12-16';

-- LIKE
SELECT chattingno, memberno, msg, rdate
FROM CHATTING
WHERE memberno=1 and msg LIKE '%안녕%';

-- UPDATE, 수정
UPDATE CHATTING
SET msg='반가워요~'
WHERE chattingno=2;

COMMIT;

-- READ: List, 목록
SELECT chattingno, memberno, msg, rdate FROM CHATTING ORDER BY chattingno DESC;

-- DELETE, 삭제
DELETE FROM CHATTING
WHERE chattingno=1;

DELETE FROM CHATTING;

-- READ, 조회   
SELECT chattingno, memberno, msg, rdate FROM CHATTING ORDER BY chattingno DESC;

COMMIT;




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





/**********************************/
/* Table Name: 페스티벌 콘텐츠 추천   */
/**********************************/
DROP TABLE FESTIVAL_LIKES;   

CREATE TABLE FESTIVAL_LIKES(
    likesno           NUMBER(10)         NOT NULL         PRIMARY KEY,
    memberno          NUMBER(10)         NULL ,   -- FK
    contentsno        NUMBER(10)         NULL ,   -- FK       
    rdate             DATE         NOT NULL,
    FOREIGN KEY (memberno) REFERENCES member (memberno),
    FOREIGN KEY (contentsno) REFERENCES festival (contentsno)
);

COMMENT ON TABLE FESTIVAL_LIKES is '페스티벌 컨텐츠 추천';
COMMENT ON COLUMN FESTIVAL_LIKES.likesno is '좋아요 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.memberno is '회원 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.contentsno is '축제 컨텐츠 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.rdate is '등록일';

DROP SEQUENCE FESTIVAL_LIKES_SEQ;

CREATE SEQUENCE FESTIVAL_LIKES_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

CREATE TABLE FESTIVAL_LIKES(
    likesno           NUMBER(10)         NOT NULL         PRIMARY KEY,
    memberno          NUMBER(10)         NULL,   -- FK
    contentsno        NUMBER(10)         NULL,   -- FK       
    rdate             DATE         NOT NULL,
    FOREIGN KEY (memberno) REFERENCES member (memberno),
    FOREIGN KEY (contentsno) REFERENCES festival (contentsno)
);

COMMENT ON TABLE FESTIVAL_LIKES is '페스티벌 컨텐츠 추천';
COMMENT ON COLUMN FESTIVAL_LIKES.likesno is '좋아요 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.memberno is '회원 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.contentsno is '축제 컨텐츠 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.rdate is '등록일';

DROP SEQUENCE FESTIVAL_LIKES_SEQ;

CREATE SEQUENCE FESTIVAL_LIKES_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- INSERT, 추천해요 데이터 삽입
INSERT INTO FESTIVAL_LIKES(likesno, memberno, contentsno, likescheck, rdate)
VALUES (FESTIVAL_LIKES_SEQ.NEXTVAL, 3, 1, 1, sysdate);

-- READ, 조회 추천해요 상태 확인
SELECT likescheck FROM FESTIVAL_LIKES
WHERE contentsno = 1 AND memberno = 3;

-- DELETE, 삭제
DELETE FROM FESTIVAL_LIKES
WHERE contentsno = 1 AND memberno = 3;

-- 추천해요 총 갯수 
SELECT count(*) FROM FESTIVAL_LIKES
WHERE contentsno = 1;

COMMIT;




/**********************************/
/* Table Name: 캘린더(일정 달력)     */
/**********************************/
DROP TABLE CALENDAR CASCADE CONSTRAINTS;

CREATE TABLE CALENDAR (
    calno NUMBER NOT NULL PRIMARY KEY,     -- 일정 번호
    title VARCHAR2(200) NOT NULL,          -- 일정 제목
    memo CLOB NULL,                        -- 상세 내용
    calstart VARCHAR2(10) NOT NULL,        -- 시작일
    calend VARCHAR2(10) NULL               -- 종료일
);

COMMENT ON TABLE CALENDAR IS '캘린더';
COMMENT ON COLUMN CALENDAR.calno IS '일정 번호';
COMMENT ON COLUMN CALENDAR.title IS '일정 제목';
COMMENT ON COLUMN CALENDAR.memo IS '상세 내용';
COMMENT ON COLUMN CALENDAR.calstart IS '시작일';
COMMENT ON COLUMN CALENDAR.calend IS '종료일';

DROP SEQUENCE CALENDAR_SEQ;

CREATE SEQUENCE CALENDAR_SEQ
    START WITH 1
    INCREMENT BY 1;
    
COMMIT;

-- INSERT, 날짜 형식을 'YYYY-MM-DD'로 변경하여 데이터 삽입
INSERT INTO CALENDAR (calno, title, memo, calstart, calend)
VALUES (CALENDAR_SEQ.NEXTVAL, '일정 등록 테스트', '일정 등록 테스트', '2023-12-28', '2023-12-28');

COMMIT;

-- READ: List, 전체 목록
SELECT * FROM CALENDAR;

-- READ, 특정 일정 조회
SELECT calno, title, memo, calstart, calend
FROM CALENDAR
WHERE calno = 1;

-- UPDATE, 수정
UPDATE CALENDAR
SET title = '일정 수정 테스트', memo = '일정 수정 테스트',
    calstart = '2023-12-29',
    calend = '2023-12-30'
WHERE calno = 1;

COMMIT;

-- DELETE, 삭제
DELETE FROM CALENDAR WHERE calno = 1;
        
COMMIT;














