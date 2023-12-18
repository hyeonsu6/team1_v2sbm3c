/* Table name: CHATTING 
*/
DROP TABLE CHATTING;

CREATE TABLE CHATTING(
    CHATTINGNO      NUMBER(10)      NOT NULL,
    MEMBERNO        NUMBER(10)      NOT NULL,   -- FK
    MSG             VARCHAR(500)    NOT NULL,
    RDATE           DATE            NOT NULL,
    FOREIGN KEY (MEMBERNO) REFERENCES member (MEMBERNO),
    PRIMARY KEY (CHATTINGNO)
);

COMMENT ON TABLE CHATTING is '응답';
COMMENT ON COLUMN CHATTING.CHATTINGNO is '채팅 번호';
COMMENT ON COLUMN CHATTING.MEMBERNO is '회원 번호';
COMMENT ON COLUMN CHATTING.MSG is '채팅 메시지';
COMMENT ON COLUMN CHATTING.RDATE is '등록일';

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
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode,
                                 address1, address2, mdate, grade)
VALUES (member_seq.nextval, 'gpt', '1234', 'Chatting 관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', sysdate, 1);

COMMIT;

INSERT INTO chatting(chattingno, memberno, msg, rdate)
VALUES(chatting_seq.nextval, 3, '안녕하세요.',sysdate);

INSERT INTO chatting(chattingno, memberno, msg, rdate)
VALUES(chatting_seq.nextval, 1, '네 안녕하세요, 저는 챗봇입니다.',sysdate);

COMMIT;
------------------------------------------------------------------------------------
/*AWS-kd의 CHATTING 테이블*/
-- 조회
-- 2023-11-24일자 채팅만 출력
SELECT chattingno, memberno, msg, rdate
FROM chatting
WHERE memberno=1 and SUBSTR(rdate, 1, 10) = '2023-12-16';

-- 시분초 일치하지 않음, 조회안됨
SELECT chattingno, memberno, msg, rdate
FROM chatting
WHERE memberno=1 and rdate = TO_DATE('2023-12-16', 'YYYY-MM-DD');

-- 문열로 변경하는 가능함
SELECT chattingno, memberno, msg, rdate
FROM chatting
WHERE memberno=1 and TO_CHAR(rdate, 'YYYY-MM-DD') = '2023-12-16';

-- LIKE
SELECT chattingno, memberno, msg, rdate
FROM chatting
WHERE memberno=1 and msg LIKE '%안녕%';


UPDATE chatting
SET msg='반가워요~'
WHERE chattingno=2;

COMMIT;

SELECT chattingno, memberno, msg, rdate FROM chatting ORDER BY chattingno DESC;

DELETE FROM chatting
WHERE chattingno=1;

DELETE FROM chatting;

SELECT chattingno, memberno, msg, rdate FROM chatting ORDER BY chattingno DESC;

COMMIT;





