CREATE TABLE Board(
B_Id NUMBER(5),
B_Name VARCHAR2(20) NOT NULL,
B_Pwd VARCHAR2(20) NOT NULL,
B_Email VARCHAR2(20) NOT NULL,
B_Title VARCHAR2(80) NOT NULL,
B_Content VARCHAR2(2000) NOT NULL,
B_Date DATE DEFAULT SYSDATE,
B_Hit NUMBER(5) DEFAULT 0,
B_Ip VARCHAR2(15),
CONSTRAINT Id_pk PRIMARY KEY(B_Id)
);

-- 답변형 게시판에 필요한 칼럼을 Board 테이블에 추가
ALTER TABLE Board
ADD (B_Ref NUMBER(5) DEFAULT 0,
	 B_Step NUMBER(5) DEFAULT 0,
	 B_Order NUMBER(5) DEFAULT 0);
	 
-- 자유게시판 테이블의 제목 칼럼 길이를 100자로 늘이시오
ALTER TABLE Board
modify(B_Title VARCHAR2(100));

-- 자유게시판 테이블의 비밀번호 칼럼을 NULL로 수정
ALTER TABLE Board
modify(B_Title VARCHAR2(100) NULL);

-- 자유게시판 테이블의 IP주소 칼럼을 삭제하시오
ALTER TABLE BOARD
DROP COLUMN B_Ip;

-- 자유게시판 테이블의 구조 확인
DESC Board;

-- 회원관리 테이블의 회원 ID 칼럼에 영소문자로 제한하시오. 체크 제한조건이 동작하는지 다음 INSERT문을 실행해보시오
ALTER TABLE EC_MEMBER 
ADD CONSTRAINT MemID_ck CHECK(UserID BETWEEN 'a' AND 'z');

INSERT INTO EC_MEMBER(UserID, Passwd, Name, Regist_No, TELEPHONE)
VALUES('srlee', '1234', '이소라', '821001-2******', '010-1234-1234');

INSERT INTO EC_MEMBER(UserID, Passwd, Name, Regist_No, TELEPHONE)
VALUES('20park', '1234', '박연수', '810604-1******', '010-2345-2345');

-- 자유게시판 테이블의 동일게시물번호 칼러명을 'B_Level'로 변경
ALTER TABLE BOARD 
RENAME COLUMN B_Step TO B_Level;

-- 주문처리 테이블의 기본 키를 삭제
ALTER TABLE EC_ORDER 
DROP PRIMARY KEY;

-- 자유게시판 테이블의 B_Email 칼럼에 유일성 제약조건을 추가
ALTER TABLE BOARD 
ADD CONSTRAINT Email_uk Unique(B_Email);

-- 자유게시판 테이블을 Free_Board 테이블명으로 변경
RENAME Board TO Free_Board;

-- 장바구니 테이블을 삭제
DROP TABLE EC_BASKET;

-- 휴지통의 임시테이블들을 삭제
PURGE RECYCLEBIN;

--

