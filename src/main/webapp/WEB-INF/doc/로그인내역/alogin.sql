/**************************************/
/* Table Name: 관리자 로그인 내역 */
/**************************************/
DROP TABLE alogin;

CREATE TABLE alogin(
  aloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  adminno                     NUMBER(10) NOT NULL,
  ip                              VARCHAR2(15) NOT NULL,
  logindate                   DATE NOT NULL,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE alogin is '로그인 내역';
COMMENT ON COLUMN alogin.aloginno is '로그인 번호';
COMMENT ON COLUMN alogin.adminno is '회원 번호';
COMMENT ON COLUMN alogin.ip is '접속 IP';
COMMENT ON COLUMN alogin.logindate is '로그인 날짜';

DROP SEQUENCE ALOGIN_SEQ;

CREATE SEQUENCE ALOGIN_SEQ
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
-- INSERT

commit;

-- LIST

-- READ

-- UPDATE

-- DELETE