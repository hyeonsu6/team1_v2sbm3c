/************************************/
/* Table Name: 회원 로그인 내역 */
/************************************/
DROP TABLE mlogin;

CREATE TABLE mlogin(
  mloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  memberno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(15) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE mlogin is '로그인 내역';
COMMENT ON COLUMN mlogin.mloginno is '로그인 번호';
COMMENT ON COLUMN mlogin.memberno is '회원 번호';
COMMENT ON COLUMN mlogin.ip is '접속 IP';
COMMENT ON COLUMN mlogin.logindate is '로그인 날짜';

DROP SEQUENCE MLOGIN_SEQ;

CREATE SEQUENCE MLOGIN_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
  
-- INSERT
INSERT INTO mlogin (mloginno, memberno, ip, logindate)
VALUES (ALOGIN_SEQ.NEXTVAL, 1, '192.168.2.2', SYSDATE);

commit;

-- LIST
SELECT * FROM mlogin;

-- 특정 회원의 로그인 전체 목록
SELECT * FROM mlogin WHERE memberno = 4;

-- 로그인 내역 삭제
DELETE FROM mlogin WHERE mloginno = 4;