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
