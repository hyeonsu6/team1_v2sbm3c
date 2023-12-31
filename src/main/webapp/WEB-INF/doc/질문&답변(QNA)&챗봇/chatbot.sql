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
