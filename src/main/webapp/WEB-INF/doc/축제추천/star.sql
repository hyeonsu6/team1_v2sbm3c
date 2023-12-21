CREATE TABLE STAR (
		starno              NUMBER(10)		 NOT NULL PRIMARY KEY,
		star                NUMBER(10)		 NOT NULL,
		contentsno          NUMBER(10)		 NOT NULL,
        memberno            NUMBER(10)		 NOT NULL,
		rdate               DATE		     NOT NULL,
        FOREIGN KEY (contentsno) REFERENCES festival (contentsno),
        FOREIGN KEY (memberno) REFERENCES member (memberno)
        
);