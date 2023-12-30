/**************************************/
/* Table Name: 관리자 로그인 내역 */
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

