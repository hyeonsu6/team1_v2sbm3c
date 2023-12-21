/**********************************/
/* Table Name: 평점 */
/**********************************/
DROP TABLE STAR;
CREATE TABLE STAR(
		starno                       	NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		star                         	NUMBER(1)		 NOT NULL,
		contentsno                 		NUMBER(10)		 NULL ,
		memberno                  		NUMBER(10)		 NULL,
        rdate                         	DATE		 NOT NULL,
  FOREIGN KEY (contentsno) REFERENCES festival (contentsno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE STAR is '평점';
COMMENT ON COLUMN STAR.starno is '평점 번호';
COMMENT ON COLUMN STAR.star is '평점 점수';
COMMENT ON COLUMN STAR.contentsno is '축제 컨텐츠 번호';
COMMENT ON COLUMN STAR.memberno is '회원 번호';
COMMENT ON COLUMN STAR.rdate is '등록일';

DROP SEQUENCE STAR_SEQ;

CREATE SEQUENCE STAR_SEQ
    START WITH 1        -- 시작번호
    INCREMENT BY 1      -- 증가값
    MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10)대응
    CACHE 2             -- 2번은 메모리에서만 계산
    NOCYCLE;            -- 다시 1부터 생성되는 것을 방지

-- 등록 : CREATE
INSERT INTO star (starno, star, contentsno, memberno, rdate) 
VALUES(star_seq.nextval, 5, 1, 3, sysdate);

-- 조회 : READ; LIST
SELECT * FROM star;
SELECT starno, star, contentsno, memberno, rdate FROM star ORDER BY starno ASC;

-- SELECT 조회
SELECT avg(star)
FROM star
WHERE contentsno = 1;

-- 삭제 : DELETE
DELETE FROM star WHERE memberno = 3 AND contentsno = 1;

COMMIT;
















