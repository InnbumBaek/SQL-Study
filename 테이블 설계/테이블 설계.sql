-------------------
-- 테이블 생성 --
-- CREATE TABLE 테이블명(
-- 칼럼명1 데이터 타입 [NUll | NOT NULL],
-- ...
-- 칼럼명N 데이터 타입 [NUll | NOT NULL],
-- [CONSTRAINT 제약조건명1 PRIMARY KEY(칼럼명1, ....)],
-- [CONSTRAINT 제약조건명2 FOREIGN KEY(칼럼명1, ....),
--  REFERENCES 참조테이블명(칼럼명P11, ....)],
-- CONSTRAINT 제약조건명3 UNIQUE,
-- [CONSTRAINT 제약조건명4][check (조건)]
-- ON DELETE 옵션);
-- 기술 방법
-- 1. 테이블명: 생성할 테이블명 기술
-- 2. 칼럼명1, ....: 테이블의 칼럼명 기술
-- 3. 데이터타입: 칼럼의 데이터타입과 크기를 지정
-- 4. NULL: 선택 칼럼을 지정하는 제약조건(생략 가능)
-- 5. NOT NULL: 필수 칼럼을 지정하는 제약 조건 
-- 6. CONSTRAINT: 무결성 규칙의 제약조건을 정의하는 예약어
-- 7. 제약조건명: 기본 키/외부 키에 대한 제약조건명을 기술(일반적으로, 테이블명_칼럼명_구분자 형태)
-- * 구분자로 기본 키는 "pk", 외부 키는 "fk", 고유 키는 "uk", 체크 제약조건은 "ck"
-- 8. PRIMARY KEY: 기본 키를 정의하는 예약어
-- 9. FOREIGN KEY: 외부 키를 정의하는 예약 
-- 9. (칼럼명1, 칼럼명2,...): 기본 키/외부 키의 칼럼명 기술 
-- 10. REFERENCES: 참조 테이블명을 지정하기 위한 예약어
-- 11. 참조테이블명: 참조할 자식 테이블명 기술
-- 12. (칼럼명P11,....): 참조되는 테이블의 기본 키 칼럼명 기술(생략 가능) 
-- 13. UNIQUE KEY: 고유 키 칼럼에 저장되는 데이터가 유일한 값인가를 자동 검증하여 중복되는 데이터가 입력되는 것을 방지 
-- 14. check: 값을 제한할 수 있는 칼럼은 일정한 범위의 값이 입력되는 칼럼이나 특정 값들 중 하나가 입력되는 칼럼 등에 사용 
-- 15. "ON DELETE 옵션" 절: 부모 테이블의 특정 행이 삭제될 때 자식 테이블의 행들도 자동 삭제되거나, 외부 키 칼럼의 값을 NULL로 저장
-- * 옵션
-- 1. CASCADE: 부모 행이 삭제되면 자식 행들도 자동 삭제
-- 2. SET NULL: 부모 행이 삭제되면 외부 키 칼럼 값을 NULL로 변경 


-- 테이블명 정의 --
-- 1. 사용자 이름에 속한 각 테이블명은 유일해야 함
-- 2. 영문자로 시작
-- 3. 영문자, 1부터 9까지 숫자, 특수문자($, #, _) 사용 가능
-- 4. 30자 이내
-- 5. SQL 예약어 사용 불가능
-- 6. 서술적
-- 7. 대소문자로 구분 가능. 단, 소문자인 경우 큰따옴표 사용

-- 칼럼명 정의 --
-- 1. 하나의 테이블에서 칼럼명은 유일해야 함
-- 2. 영문자로 시작
-- 3. 영문자, 1부터 9까지 숫자, 특수문자($, #, _) 사용 가능
-- 4. 30자 이내
-- 5. SQL 예약어 사용 불가능
-- 6. 서술적
-- 7. 한글 사용 가능

-- 테이블에 기본 키 제약조건 지정 
-- PRIMARY KEY: 테이블에 각 행을 유일하게 식별하기 위하여 사용되는 칼럼 또는 칼럼의 조합 
-- 검증 내용:
-- 1. 기본 키 칼럼에 중복된 데이터를 허용하지 않음
-- 2. 기본 키 칼럼에 NULL값을 허용하지 않음
-- 고려 사항:
-- 1. 기본 키 칼럼은 NULL이 될 수 없음
-- 2. 기본 키 칼럼은 자동으로 NOT NULL이 된다
-- 3. LONG RAW, LONG, LOB 데이터 타입은 기본 키 될 수 없음
-- 4. 기본 키를 구성하는 복합 칼럼의 최대 수는 16개 

-- 테이블에 외부 키 제약조건 지정
-- FOREIGN KEY: 테이블과 테이블 간의 관계를 정의하는 칼럼
-- 외부 키와 기본 키와의 관계
-- 1. 생성할 테이블의 관계를 정의하는 칼럼이 외부 키가 된다
-- 2. 참조하는 테이블의 기본 키와 관계가 정의된다
-- 3. 외부 키 칼럼의 수 = 참조 테이블의 기본 키 칼럼의 수
-- 4. 외부 키 칼럼의 데이터타입 = 참조 테이블의 기본 키 칼럼의 데이터타입
-- 5. 외부 키 칼럼의 데이터타입을 생략하면, 참조 테이블의 기본 키 칼럼의 데이터타입 참고한다
-- 6. 참조 테이블의 기본 키 칼럼은 생략 가능

-- 고유 키 제약조건과 기본 키 제약조건의 차이점
-- 1. 기본 키는 테이블에 대하여 단지 한번만 지정 가능
-- 2. 고유 키 제약조건은 각 칼럼에 대하여 여러 번 지정 가능 
-- 3. 기본 키는 자동으로 NOT NULL 칼럼으로 지정되나, 고유 키 제약조건은 NOT NULL로 지정해야 함

-- 체크 제약 조건 
-- * 특정 값 중에 하나를 제한하는 경우 "(칼럼명 IN (값1, 값2,...))" 형태
-- * 연속된 값 제한하는 경우 "(칼럼명 BETWEEN 최솟값 AND 최댓값)" 형태
-- * 0보다 큰 값을 만족하는 경우 "칼럼명 > 0" 사용 

-- 테이블의 칼럼에 DEFAULT절로 기본값 지정
-- 기본값 지정한 칼럼에 데이터가 입력되지 않으면 자동으로 기본값이 대체되어 입력된다.
-- 기본값 지정한 칼럼은 NOT NULL 제약조건을 지정하지 않으며, 
-- 칼럼명의 데이터타입 = 기본값의 데이터타입
-- DEFAULT절에 인수가 없는 함수 사용 가능하나, CURRVAL, NEXTVAL, LEVEL, PRIOR, ROWNUM의 의사칼럼 또는 날짜 리터럴은 포함 불가능 

-- 테이블 수정
-- ALTER TABLE문의 문법
-- 1. ALTER TABLE 테이블명
--    ADD (column-specification | constraint- specification);
-- * 칼럼을 추가하거나, 기본 키와 외부 키 제약조건을 추가
-- 2.ALTER TABLE 테이블명
--   MODIFY (column-specification | constraint- specification);
-- * 기존 칼럼의 크기 변경, 
-- * 제약조건의 NULL, NOT NULL, DEFAULT값 변경 
-- 3. ALTER TABLE 테이블명
--    DROP PRIMARY KEY{CASCADE};
-- * 테이블의 기본 키 삭제. 
-- * CASCADE절을 이용할 시, 기본 키를 강제로 삭제하고 참조하는 외부 키도 삭제
-- 4. ALTER TABLE 테이블명
--	 DROP UNIQUE(고유 키 칼럼명);
-- * 고유 키 삭제
-- 5. ALTER TABLE 테이블명
-- 	  DROP CONSTRAINT 제약조건명{CASCADE};
-- * 외부 키, 고유 키, 체크 제약조건을 제약조건명으로 삭제
-- * CASCADE절은 제약조건을 강제로 삭제
-- 6. ALTER TABLE 테이블명
--    DROP {COLUMN} (칼럼명1, 칼럼명2, ...);
-- * 칼럼 삭제. 
-- * COLUMN 예약어 생략 가능 
-- 7. ALTER TABLE 테이블명
--    RENAME COLUMN 칼럼명 TO 변경칼럼명;
-- * 칼럼명 변경 
-- 8. ALTER TABLE 테이블명
-- 	  RENAME CONSTRAINT 제약조건명 TO 변경제약조건명;
-- * 제약조건명 변경
-- 9. ALTER TABLE 테이블명 RENAME TO 변경테이블명;
-- * 테이블명 변경 

-- 테이블 삭제 
-- DROP TABLE 테이블명 
-- {PURGE | CASCADE CONSTRAINTS};
-- 기술 방법:
-- PURGE: 복구 가능한 임시 테이블을 생성하지 않고 영구히 삭제
-- CASCADE CONSTRAINTS: 삭제할 테이블의 기본 키가 다른 테이블의 외부 키로 참조되고 있을 때 테이블을 강제로 삭제 

-- RECYCLEBIN 임시테이블
-- ALTER SYSTEM SET RECYCLEBIN=ON/OFF
-- 1. SELECT * FROM RECYCLEBIN;
-- * 삭제된 테이블의 임시테이블 출력
-- 2. PURGE RECYCLEBIN;
-- * 임시 테이블 삭제
-- 3. FLASHBACK TABLE 테이블명 TO BEFORE DROP;
-- * 임시테이블에 있는 테이블 복구 

-- 테이블명 변경
-- RENAME 기존테이블명 TO 변경테이블명;

-- 임시테이블 생성
-- 성능을 향샹시킴
-- 임시테이블의 행들은 트랜잭션 또는 세션에서 사용 가능
-- CREATE GLOBAL TEMPORARY TABLE 임시테이블명(
-- 칼럼명 1 데이터타입(크기) NULL | NOT NULL,
-- ....
-- 칼럼명 1 데이터타입(크기) NULL | NOT NULL)
-- ON COMMIT [PRESERVE ROWS | DELETE ROWS];
-- 기술 방법:
-- ON COMMIT DELETE ROWS: 트랜잭션 종료 시 임시테이블의 행 삭제
-- ON COMMIT PRESERVE ROWS: 트랜잭션이 종료되면 임시테이블의 행이 남아 있고,
-- 세션이 종료되면 임시테이블의 행 삭제

-- 테이블 관리
-- 1. 사용자의 객체명 출력
-- 오라클 사용자가 생성한 객체들 조회
-- SELECT * FROM TAB;
-- * 테이블명만 조회 
-- SELECT * FROM USER_CATALOG;
-- * 모든 객체 조회 

-- 테이블 제약조건 조회
-- USER_CONSTRAINTS 객체로부터 생성된 테이블에 대한 제약조건 정보 반환 
-- SELECT *
-- FROM USER_CONSTRAINTS/USER_CONS_COLUMNS
-- WHERE TABLE_NAME = '테이블명';

-- USER_CONSTRAINTS 객체의 주요 칼럼
-- 1. CONSTRAINT_NAME: 제약조건명
-- 2. CONSTRAINT_TYPE: 제약조건에 대한 타입
-- * 기본 키(P), 외부 키(R), 고유 키(U), NOT NULL(C), 체크(C)
-- 3. SEARCH_CONDITION: 제약조건이 지정된 내용
-- 4. TABLE_NAME: WHERE절에 조회할 테이블명 기술  

-- USER_CONS_COLUMNS 객체의 주요 칼럼
-- 1. OWNER: 오라클 사용자
-- 2. CONSTRAINT_NAME: 제약조건명
-- 3. COLUMN_NAME: 칼럼명
-- 4. POSITION: NOT NULL과 CHECK 제약조건은 NULL값, 기본 키, 외부 키, 고유 키가 복합 칼럼이 아닐 경우 1을 반환
-- 5. TABLE_NAME: WHERE절에 조회할 테이블명 기술 

-- 제약조건의 활성화/비활성화
-- 테이블에 지정된 제약조건에 대하여 활성화/비활성화
-- 기본 키의 제약조건은 비활성화 불가능 
-- ALTER TABLE 테이블명
-- {DISABLE | ENABLE} CONSTRAINT 제약조건명;
-- * 'DISABLE'을 하면 데이터 무결성 검증하지 않음
-- * 'DISABLE' 되어 입력된 데이터가 제약조건이 위배되면 제약조건을 활성화하지 못함 
-------------------






/**********************************************************
*  테이블 삭제
***********************************************************/
DROP TABLE SG_Scores	purge;
DROP TABLE Student	purge;
DROP TABLE Course	purge;
DROP TABLE Professor	purge;
DROP TABLE Department	purge;
DROP TABLE T_Course	purge;
DROP TABLE T_SG_Scores	purge;
DROP TABLE Score_Grade	purge;

/**********************************************************
*  Department 테이블 생성
***********************************************************/
CREATE TABLE Department (
Dept_ID      VARCHAR2(10)   CONSTRAINT Department_pk PRIMARY KEY,
Dept_Name    VARCHAR2(25),
Dept_Tel     VARCHAR2(12) );

/**********************************************************
*  Student 테이블 생성
***********************************************************/
CREATE TABLE Student (
Dept_ID      VARCHAR2(10),
Year         VARCHAR2(1),
Student_ID   VARCHAR2(7),
Name         VARCHAR2(10)   NOT NULL,
ID_Number    VARCHAR2(14)   NOT NULL CONSTRAINT Student_uk UNIQUE,
Address      VARCHAR2(40),
Telephone    VARCHAR2(13),
Email        VARCHAR2(20),
Status       VARCHAR2(1),
I_Date       DATE,
CONSTRAINT   Student_pk      PRIMARY KEY (Student_ID),
CONSTRAINT   Student_fk      FOREIGN KEY (Dept_ID)
                             REFERENCES Department);

/**********************************************************
*  Professor 테이블 생성
***********************************************************/
CREATE  TABLE  Professor (
Professor_ID   VARCHAR2(3),
Name           VARCHAR2(10)  NOT NULL,
Position       VARCHAR2(10)  NOT NULL CONSTRAINT Professor_ck
        CHECK (Position in ('총장','교수','부교수','조교수','초빙교수')),
Dept_ID        VARCHAR2(10),
Telephone      VARCHAR2(12)  CONSTRAINT Professor_uk UNIQUE,
Email          VARCHAR2(20),
Duty           VARCHAR2(10),
Mgr            VARCHAR2(3), 
CONSTRAINT     Professor_pk  PRIMARY KEY (Professor_ID),
CONSTRAINT     Professor_fk  FOREIGN KEY (Dept_ID)
                             REFERENCES Department);

/**********************************************************
*  Course 테이블 생성
***********************************************************/
CREATE  TABLE  Course (
Course_ID      VARCHAR2(5),
Title          VARCHAR2(20) NOT NULL,
C_Number       NUMBER(1)    NOT NULL,
Professor_ID   VARCHAR2(3),
Course_Fees    NUMBER(7),
CONSTRAINT     Course_pk    PRIMARY KEY (Course_ID),
CONSTRAINT     Course_fk    FOREIGN KEY (Professor_ID)
                            REFERENCES   Professor);
ALTER TABLE Course
MODIFY Title VARCHAR2(30);
/**********************************************************
*  SG_Scores 테이블 생성
***********************************************************/
CREATE  TABLE  SG_Scores (
Student_ID     VARCHAR2(7),
Course_ID      VARCHAR2(5),
Score          NUMBER(3),
Grade          VARCHAR2(2),
Score_Assigned DATE          DEFAULT  SYSDATE,
CONSTRAINT     SG_Scores_pk  PRIMARY KEY (Student_ID, Course_ID),
CONSTRAINT     SG_Scores_fk1 FOREIGN KEY (Student_ID)
                             REFERENCES   Student,
CONSTRAINT     SG_Scores_fk2 FOREIGN KEY (Course_ID)
                             REFERENCES   Course);


/**********************************************************
* Score_Grade 테이블 생성
***********************************************************/
CREATE TABLE Score_Grade (
LOW    NUMBER(3),
HIGH   NUMBER(3),
GRADE  CHAR(2));

/**********************************************************
*  T_Course 테이블 생성
***********************************************************/
CREATE  TABLE  T_Course 
AS 
   SELECT * 
   FROM   Course
   WHERE  10=20;

/**********************************************************
*  T_SG_Scores 테이블 생성
***********************************************************/
CREATE TABLE T_SG_Scores
AS
   SELECT *
   FROM   SG_Scores
   WHERE  10 = 20;

/**********************************************************
*  테이블명 조회
***********************************************************/
SELECT * FROM USER_CATALOG;
/


-- 참조 테이블에 기본 키가 없는 경우 
ALTER TABLE Professor
DROP PRIMARY KEY CASCADE;

CREATE TABLE Course(
Course_ID VARCHAR2(5) PRIMARY KEY,
Title VARCHAR2(20),
C_Number NUMBER(1) NOT NULL,
Professor_ID VARCHAR(3),
CONSTRAINT Student_fk
		   REFERENCES Professor);

		  
-- Department 테이블의 부모 행이 삭제될 때 자식 행이 자동 삭제되도록 Professor 테이블 생성
DROP TABLE Professor

CREATE TABLE Professor(
Professor_ID VARCHAR2(3) PRIMARY KEY,
Name VARCHAR2(20) NOT NULL,
POSITION VARCHAR2(10) NOT NULL,
Dept_ID VARCHAR2(10),
CONSTRAINT Professor_DeptID_fk FOREIGN KEY(Dept_ID)
		   REFERENCES Department
		   ON DELETE CASCADE,
Telephone VARCHAR2(12));


-- 고유 키 제약조건 
DROP TABLE Professor

CREATE TABLE Professor(
Professor_ID VARCHAR2(3) PRIMARY KEY,
Name VARCHAR2(20) NOT NULL,
POSITION VARCHAR2(10) NOT NULL,
Dept_ID VARCHAR2(10),
CONSTRAINT Professor_DeptID_fk FOREIGN KEY(Dept_ID)
		   REFERENCES Department
		   ON DELETE CASCADE,
Telephone VARCHAR2(12) CONSTRAINT Professor_Telephone_uk UNIQUE)


-- check 제약조건
DROP TABLE Professor;

CREATE TABLE Professor(
Professor_ID VARCHAR2(3) PRIMARY KEY,
Name VARCHAR2(20) NOT NULL,
POSITION VARCHAR2(10) NOT NULL,
Dept_ID VARCHAR2(10),
Telephone VARCHAR2(12), 
CONSTRAINT Professor_Position_ck
	   check(POSITION IN ('교수', '부교수', '조교수', '초빙 교수')),
CONSTRAINT Professor_DeptID_fk FOREIGN KEY(Dept_ID)
	   REFERENCES Department 
	   ON DELETE CASCADE, 
CONSTRAINT Professor_Telephone_uk UNIQUE(Telephone));


-- Course 테이블의 C_Number(학점수)를 기본값 3학점으로 지정하여 테이블 생성하고, 
-- 과목코드가 'L1031', 
-- 과목명이 'SQL', 
-- 담당교수가 'P12',
-- 추가 수강료가 30000원인 정보 입력
CREATE TABLE Course(
Course_ID VARCHAR2(5) PRIMARY KEY,
Title VARCHAR2(20) NOT NULL,
C_Number NUMBER(1) DEFAULT 3,
Professor_ID VARCHAR2(3));

INSERT INTO COURSE c
(Course_ID, Title, PROFESSOR_ID)
VALUES
('L1031', 'SQL', 'P12');

SELECT * FROM Course;

-- 칼럼 추가
ALTER TABLE Professor
add(Email VARCHAR2(60),
	Duty VARCHAR2(10),
	Mgr VARCHAR2(3));

SELECT * FROM PROFESSOR p;

-- 칼럼 크기 줄이기
-- 테이블의 값이 비어 있거나,
-- 테이블의 값이 저장된 경우에는 모두 NULL값이 저장된 칼럼 
ALTER TABLE DEPARTMENT
MODIFY (Dept_Name VARCHAR2(15));

-- 칼럼 크기 늘리기
ALTER TABLE DEPARTMENT
MODIFY (Dept_Name VARCHAR2(30));

-- NULL을 NOT NULL로 변경
-- 테이블의 값이 비었거나,
-- 테이블의 값이 저장된 경우에는 NULL값이 없는 칼럼
ALTER TABLE DEPARTMENT 
MODIFY(Dept_Name VARCHAR2(30) NOT NULL);

-- NOT NULL을 NULL로 변경
ALTER TABLE DEPARTMENT 
MODIFY(Dept_Name VARCHAR2(30) NULL);

-- 기본 키 삭제
-- 외부 키로 관계가 정의되어 있지 않은 기본 키
ALTER TABLE SG_Scores
DROP PRIMARY KEY; 

-- CASCADE절을 이용한 기본 키 삭제
ALTER TABLE department  
DROP PRIMARY KEY CASCADE;

-- 기본 키 추가
-- 테이블의 값이 비어있거나,
-- 테이블의 칼럼에 NULL값 또는 중복된 데이터가 없을 때
ALTER TABLE department
ADD PRIMARY KEY(Dept_ID);

-- 외부 키 추가
-- 테이블의 값이 비어있거나,
-- 테이블의 값이 저장되어 있는 경우 외부 키 칼럼이 NULL이거나, 참조하는 테이블의 기본 키 값을 만족할 때
SELECT Course_ID, Title, C_Number, Professor_ID
FROM Course;

ALTER TABLE Course
ADD CONSTRAINT Course_fk FOREIGN KEY(Professor_ID) 
REFERENCES Professor;

SELECT Professor_ID, Name, Position, Dept_ID 
FROM Professor;

SELECT * 
FROM Department;

ALTER TABLE PROFESSOR  
ADD CONSTRAINT Professor_fk FOREIGN KEY(Dept_ID)
REFERENCES Department;

-- 외부 키 삭제
ALTER TABLE PROFESSOR 
DROP CONSTRAINT Professor_fk;

-- 체크 제약조건 삭제
ALTER TABLE PROFESSOR 
DROP CONSTRAINT Professor_Position_ck;

-- 기존 칼럼 삭제
ALTER TABLE PROFESSOR 
DROP COLUMN Email;

-- 칼럼명 변경
ALTER TABLE PROFESSOR 
RENAME COLUMN Telephone TO Tel_No;

-- 테이블 삭제
DROP TABLE Student;

ALTER TABLE PROFESSOR 
ADD CONSTRAINT Professor_fk FOREIGN KEY(Dept_ID)
REFERENCES Department;

DROP TABLE Department;

DROP TABLE Department
CASCADE CONSTRAINTS;

-- 임시테이블 조회
SELECT * 
FROM RECYCLEBIN;

-- 테이블 복구
FLASHBACK TABLE Student TO BEFORE DROP;

-- 임시테이블 모두 삭제
PURGE RECYCLEBIN;

SELECT * FROM TAB;

-- 테이블명 변경
RENAME Course TO T_Course;

-- 제약조건 조회
DROP TABLE Professor purge;

CREATE TABLE Professor(
Professor_ID VARCHAR2(3) PRIMARY KEY,
Name VARCHAR2(20) NOT NULL,
POSITION VARCHAR2(10) NOT NULL,
Dept_ID VARCHAR2(10),
Telephone VARCHAR2(12), 
CONSTRAINT Professor_Position_ck
	   check(POSITION IN ('교수', '부교수', '조교수', '초빙 교수')),
CONSTRAINT Professor_Telephone_uk UNIQUE(Telephone));


SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM  USER_CONSTRAINTS
WHERE TABLE_NAME = 'Professor';

-- 제약조건명, 칼럼명, 복합칼럼(POSITION) 유무 조회
SELECT CONSTRAINT_NAME, COLUMN_NAME, POSITION
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'Professor';


