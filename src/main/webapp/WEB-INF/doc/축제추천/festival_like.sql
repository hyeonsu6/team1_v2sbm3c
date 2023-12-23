DROP TABLE FESTIVAL_LIKES;   

CREATE TABLE FESTIVAL_LIKES(
        likesno           NUMBER(10)         NOT NULL         PRIMARY KEY,
        contentsno        NUMBER(10)         NULL ,
        memberno          NUMBER(10)         NULL ,
        point             NUMBER(1)  NOT NULL,
        rdate             DATE         NOT NULL,
  FOREIGN KEY (contentsno) REFERENCES festival (contentsno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE FESTIVAL_LIKES is '축제 컨텐츠 추천';
COMMENT ON COLUMN FESTIVAL_LIKES.likesno is '좋아요 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.contentsno is '회원 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.memberno is '축제 컨텐츠 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.point is '싫어요 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.rdate is '등록일';

DROP SEQUENCE FESTIVAL_LIKES_SEQ;

CREATE SEQUENCE FESTIVAL_LIKES_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 등록
INSERT INTO FESTIVAL_LIKES(likesno, contentsno, memberno, rdate) 
VALUES (festival_likes_SEQ.nextval, 1, 3, sysdate);

-- 조회 : List
SELECT * FROM FESTIVAL_LIKES;
SELECT likesno, contentsno, memberno, rdate FROM FESTIVAL_LIKES ORDER BY likesno ASC;

-- 콘텐츠의 모든 조회수
SELECT COUNT(*) as cnt FROM FESTIVAL_LIKES
WHERE contentsno=1;

SELECT COUNT(*) as cnt 
FROM FESTIVAL_LIKES
WHERE contentsno=1 AND memberno=3;

-- 삭제
DELETE FROM FESTIVAL_LIKES WHERE contentsno=2 and memberno=3;  

commit;