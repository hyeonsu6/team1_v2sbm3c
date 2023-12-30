/**********************************/
/* Table Name: 캘린더(일정 달력)     */
/**********************************/
DROP TABLE CALENDAR CASCADE CONSTRAINTS;

CREATE TABLE CALENDAR (
    calno NUMBER NOT NULL PRIMARY KEY,     -- 일정 번호
    title VARCHAR2(200) NOT NULL,          -- 일정 제목
    memo CLOB NULL,                        -- 상세 내용
    calstart VARCHAR2(10) NOT NULL,        -- 시작일
    calend VARCHAR2(10) NULL               -- 종료일
);

COMMENT ON TABLE CALENDAR IS '캘린더';
COMMENT ON COLUMN CALENDAR.calno IS '일정 번호';
COMMENT ON COLUMN CALENDAR.title IS '일정 제목';
COMMENT ON COLUMN CALENDAR.memo IS '상세 내용';
COMMENT ON COLUMN CALENDAR.calstart IS '시작일';
COMMENT ON COLUMN CALENDAR.calend IS '종료일';

DROP SEQUENCE CALENDAR_SEQ;

CREATE SEQUENCE CALENDAR_SEQ
    START WITH 1
    INCREMENT BY 1;
    
COMMIT;

-- INSERT, 날짜 형식을 'YYYY-MM-DD'로 변경하여 데이터 삽입
INSERT INTO CALENDAR (calno, title, memo, calstart, calend)
VALUES (CALENDAR_SEQ.NEXTVAL, '일정 등록 테스트', '일정 등록 테스트', '2023-12-28', '2023-12-28');

COMMIT;

-- READ: List, 전체 목록
SELECT * FROM CALENDAR;

-- READ, 특정 일정 조회
SELECT calno, title, memo, calstart, calend
FROM CALENDAR
WHERE calno = 1;

-- UPDATE, 수정
UPDATE CALENDAR
SET title = '일정 수정 테스트', memo = '일정 수정 테스트',
    calstart = '2023-12-29',
    calend = '2023-12-30'
WHERE calno = 1;

COMMIT;

-- DELETE, 삭제
DELETE FROM CALENDAR WHERE calno = 1;
        
COMMIT;
