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