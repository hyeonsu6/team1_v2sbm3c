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
