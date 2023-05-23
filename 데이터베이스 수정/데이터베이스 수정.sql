-------------------------------------
-- INSERT문
-- INSERT INTO 테이블명
-- [(칼럼명1, 칼럼명2, ...)]
-- VALUES(값1, 값2, ...);
-- 주의사항
-- 1. 칼럼명 수 = 입력하는 값의 수
-- 2. 칼럼명 데이터타입 = 입력하는 값의 데이터타입
-- 3. 기본 키와 필수 칼럼(NOT NULL)은 반드시 입력해야 함
-- 4. 칼럼명이 생략되면 모든 칼럼의 값이 입력되어야 함
-- 5. 입력되지 않는 칼럼의 값은 NULL값이 저장된다
-- 6. 입력되지 않는 칼럼에 기본값이 선언된 칼럼은 기본값이 저장된다

-- 데이터타입이 허용되는 예외사항
-- 칼럼의 데이터타입과 입력하는 값의 데이터타입이 동일하지 않을 경우 허용되는 경우가 존재
-- 1. 문자형 칼럼에 숫자형 리터럴 입력할 때
-- 2. 숫자형 칼럼에 문자형 리터럴 입력할 때
-- 3. 날짜형 칼럼에 문자형 리터럴 입력할 떄
-- 단, 오라클의 날짜 기본 형식('YY/MM/DD' 또는 'DD-MON-YY')이 일치되어야 함 

-- 의사칼럼(Pseudo Column)
-- 테이블에 행이 추가될 때 누가, 언제 입력하였는지 확인 가능
-- SYSDATE: 현재 날짜와 시간이 기록되어 있음
-- USER: 로그온한 오라클 사용자명이 기록되어 있음

-- INSERT문에서 칼럼명을 기술해야 하는 이유
-- 1. 테이블의 구조는 변할 수 있음
-- 2. INSERT문의 이해가 쉬워짐
-- 3. 인접된 칼럼에 잘못 저장되는 경우 방지 가능


-- UPDATE문
-- UPDATE 테이블명
-- SET 칼럼명1 = 표현식1, 칼럼명2 = 표현식2, ....
-- [WHERE 수정조건];
-- 기본 키는 원칙적으로 변경 불가능하지만, 외부 키에 의해 참조되지 않는 기본 키 값은 변경 가능

-- DELETE문
-- DELETE FROM 테이블명
-- [WHERE 삭제조건];

-- TRUNCATE TABLE문을 이용한 전체 행 삭제
-- TRUNCATE TABLE 테이블명;
-- 전체 행을 삭제할 떄는 DELETE문보다 더 효율적
-- 그러나, 복구 불가

-- 부모 테이블의 행 삭제시 자식 행의 관리
-- 외부 키로 참조하는 부모 테이블의 행은 삭제되지 않음

-- ON DELETE 옵션이 설정된 외부 키
-- ON DELETE SET NULL절은 부모 행 삭제시 자식 행의 외부 키 칼럼 값을 NULL로 저장
-- ON DELETE CASCADE절은 부모 행 삭제시 자식 행들도 자동으로 삭제

-- MERGE문
-- MERGE Into 테이블명A
-- 		 USING [테이블B | 뷰 | 서브 쿼리]
--		 ON    [조건]
-- WHEN MATCHED THEN 
-- 		UPDATE SET ...
-- 		DELETE WHERE 삭제조건
-- WHEN NOT MATCHED THEN 
-- 	    INSERT(칼럼명1, 칼럼명2, ...)
--		VALUES(값1, 값2, ...);
-- 테이블 구조가 동일한 두 개 이상의 테이블이나 뷰, 서브 쿼리로부터 데이터를 비교하여 하나의 테이블에 데이터를 병합하는 것
-- 오라클 데이터베이스에서만 사용 가능함
 
-- 트랜잭션 제어문
-- 오라클 데이터베이스에서는 테이블에 대한 변경은 어떤 기간을 두고, 사용자가 일정기간 테이블에 대한 변경 작업을 수행한 후에 그 변경 작업을 테이블에 반영하도록 하고 있음
-- 테이블에 대하여 '행을 추가하거나 칼럼 값 수정 또는 행의 삭제에 의해 변경되는 작업의 논리적 단위' 또는 '변경 작업을 할 수 있도록 사용자에게 할당된 기간'을 말함
-- 트랜잭션 제어문이 실행되면 트랜잭션 영역은 초기화되고,
-- 트랜잭션은 종료됌
-- 이후부터 실행되는 명령문에 대하여 트랜잭션 재실행, 트랜잭션 영역 재설정 됌

-- COMMIT문
-- COMMIT;
-- 트랜잭션 영역에 있는 행의 추가, 수정, 삭제된 내용을 테이블에 영구히 저장 또는 삭제

-- ROLLBACK문 
-- ROLLBACK;
-- ROLLBACK TO 저장점명;
-- 트랜잭션 영역에 행의 추가, 수정, 삭제에 대한 명령의 실행을 취소하여, 데이터 원상 복구
-- 그러나, COMMIT된 테이블의 데이터에 대해서는 복구 불가
-- 트랜잭션 영역의 모든 명령을 취소
-- ROLLBACK TO문은 트랜잭션 영역의 부분적으로 실행된 명령문을 취소
-- 저장점은 SAVEPOINT문으로 지정

-- 저장점 지정
-- SAVEPOINT 저장점명;

-- AUTOCOMMIT 시스템 변수
-- SQL명령문의 DML(INSERT, UPDATE, DELETE, MERGE)명령문이 실행될 때 트랜잭션에 대하여 실행 완료를 제어하며,
-- SQL*Plus의 기본값은 윈도우즈 운영체제에 따라 다르다
-- ON으로 설정하면 트랜잭션이 발생할 때마다 자동 COMMIT



-------------------------------------

-- 새로운 개설 과목을 T_Course 테이블에 저장하시오.
-- 과목코드는 'L1061', 과목명이 'ERP실무', 3학점이며, 담당교수가 'P12'이고, 추가 수강료는 50000원이다
INSERT INTO T_COURSE tc 
(Course_ID, Title, C_Number, Professor_ID, COURSE_FEES)
VALUES
('L1061', 'ERP실무', 3, 'P12', 50000);

SELECT * 
FROM T_COURSE tc 
WHERE Course_ID = 'L1061';

-- 새로운 개설 과목을 T_Course 테이블에 저장하시오
-- 과목코드는 'L1062', 과목명이 '그룹웨어구축', 3학점이며, 담당교수가 'P13'이고, 추가 수강료는 40000원이다
INSERT INTO T_COURSE tc 
VALUES
('L1062', '그룹웨어구축', 3, 'P13', 40000);

SELECT * 
FROM T_COURSE tc 
WHERE Course_ID = 'L1062';
-- 칼럼명 생략하면 테이블 생성시 칼럼의 순서대로 모든 칼럼 값 기술

-- 학번이 'B1701', 과목코드가 'L1051', 성적이 85점, 성적취득 날짜는 2018년 06월 28일이다. 
-- SG_Scores 테이블에 저장
INSERT INTO SG_SCORES ss 
(STUDENT_ID , COURSE_ID, SCORE, SCORE_ASSIGNED)
VALUES
('B1701', 'L1051', 85, '18/06/28');


SELECT * 
FROM SG_SCORES ss 
WHERE STUDENT_ID = 'B1701';

-- 과목코드가 'L3041', 과목명이 'JQUERY', 3학점, 교수번호가 'P31', 추가 수강료는 30000원이다
-- Course 테이블에 저장
INSERT INTO COURSE c  
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
('L3041', 'JQUERY', 3, 'P31', '30,000');
-- 숫자형 칼럼에 문자형 데이터 입력 불가능

-- 과목코드가 'L3041', 과목명이 'JQUERY', 3학점, 교수번호가 'P31', 추가 수강료는 30000원이다
-- Course 테이블에 저장
INSERT INTO COURSE c  
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
('L3041', 'JQUERY', 3, 'P31');
-- 테이블 칼럼 수와 입력 데이터의 수가 다르면 안됌

-- 과목코드가 'L1031', 과목명이 'SQL', 3학점, 교수번호가 'P12', 추가 수강료는 30000원이다
-- Course 테이블에 저장
INSERT INTO COURSE c  
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
('L1031', 'SQL', 3, 'P12', 30000);
-- 기본 키 칼럼에 중복된 데이터 입력 불가능

-- 과목명이 '정보보', 3학점, 교수번호가 'P22', 추가 수강료는 30000원이다
-- Course 테이블에 저장
INSERT INTO COURSE c  
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
(NULL, '정보보안', 3, 'P22', '30000');
-- 기본 키 칼럼에 NULL값 입력 불가능

-- 컴퓨터 공학과의 신임 교수번호는 'P14', 교수명은 '조성우', 직위는 '조교수', 전화번호는 '765-4114'이다.
-- Professor 테이블에 저장
INSERT INTO PROFESSOR p 
(PROFESSOR_ID, NAME, POSITION, TELEPHONE, Email, MGR)
VALUES
('P14', '조성우', '조교수', '컴퓨터', '765-4114', NULL, 'P11');
-- Professor 테이블의 학과코드 외부 키 칼럼 값이 참조하는 Department 테이블의 기본 키 값을 만족하지 않기 때문에 오류 발생
-- 학과코드의 입력 데이터는 '컴공'으로 바꾸어야 함

INSERT INTO PROFESSOR p 
(PROFESSOR_ID, NAME, POSITION, TELEPHONE, Email, MGR)
VALUES
('P14', '조성우', '조교수', '컴공', '765-4114', NULL, 'P11');

-- '컴공'학과 2학년에 '박은혜' 학생이 편입학하였다. 
-- 학번은 'C1731', 주민등록번호는 '011119-4******', 이메일주소는 'c1731@cyber.ac.kr' 이다.
-- Student 테이블에 저장
INSERT INTO STUDENT s 
(DEPT_ID, YEAR, STUDENT_ID, NAME, ID_NUMBER, EMAIL)
VALUES
('컴공', '2', 'C1731', '박은혜', '011119-4******', 'c1731@cyber.ac.kr');

SELECT Student_ID, Name, ID_Number, Email
FROM STUDENT s 
WHERE ID_NUMBER = '011119-4******';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'Student';
-- '박은혜' 학생의 주민등록번호가 '이정민' 학생과 동일
-- 고유 키 제약조건이 지정된 칼럼에 중복된 데이터 입력 불가능

-- 컴퓨터공학과에 시간강사를 위촉하였다. 
-- 교수번호가 'P91', 교수명은 'Bob Miner', 직위는 '시간강사', 전화번호는 '765-4119'이다
-- Professor 테이블에 저장
INSERT INTO PROFESSOR p 
(PROFESSOR_ID, NAME, POSITION, DEPT_ID, TELEPHONE)
VALUES
('P91', 'Bob Miner', '시간강사', '컴공', '765-4119');

-- SG_Scores 테이블에 User_Name 칼럼과 C_Date 칼럼을 추가하시오
-- 단, User_Name과 C_Date 칼럼에 USER와 SYSDATE 의사칼럼을 기본값으로 지정
ALTER TABLE SG_SCORES 
ADD(User_Name VARCHAR2(25) DEFAULT '오라클계정: '|| USER,
	C_Date DATE DEFAULT SYSDATE);

-- 학번이 'C1731', 과목코드가 'L1021', 성적이 97점, 성적취득일자가 2018년 6월 28일이다
-- SG_Scores 테이블에 저장하고 출력
INSERT INTO SG_SCORES ss 
(STUDENT_ID, COURSE_ID, SCORE, SCORE_ASSIGNED)
VALUES
('C1731', 'L1021', 97, '18/06/28');

SELECT * 
FROM SG_SCORES ss 
WHERE STUDENT_ID = 'C1731' AND COURSE_ID = 'L1021';

COMMIT;

-- Department 테이블의 학과명을 '컴퓨터정보계열'로 수정
UPDATE DEPARTMENT 
SET DEPT_NAME = '컴퓨터정보계열';

SELECT *
FROM DEPARTMENT d;

ROLLBACK;

SELECT *
FROM DEPARTMENT d;

-- Course 테이블의 과목명 'Delphi'를 '델파이'로 변경
UPDATE COURSE 
SET Title = '델파이'
WHERE COURSE_ID = 'L1042';

SELECT *
FROM COURSE c 
WHERE COURSE_ID = 'L1042';

-- 학번이 'C1601', 과목코드가 'L1021'의 성적 85점을 105점으로 잘못 입력하였다. 
-- SG_Scores 테이블의 성적을 변경
UPDATE SG_SCORES 
SET SCORE = 85
WHERE STUDENT_ID = 'C1601' AND COURSE_ID = 'L1021';

-- SG_Scores 테이블에서  'L2061' 과목의 수강신청자를 검색하여 확인하고,
-- 아래 표를 참고하여 성적을 입력
-- 과목코드			과목명			학번			성적합계			성적취득일자
-- L2061		  스프링프레임워크      C1701 		87				2018/12/26
-- L2061		  스프링프레임워크      C1702		95				2018/12/26
-- L2061          스프링프레임워크      C1601		99				2018/12/26
-- L2061          스프링프레임워크      C1602		93				2018/12/26
SELECT Course_ID, Student_ID, Score, Score_Assigned "수강신청"
FROM SG_SCORES ss 
WHERE COURSE_ID = 'L2061';

UPDATE SG_SCORES
SET SCORE = 87, SCORE_ASSIGNED = '2018/12/26'
WHERE COURSE_ID = 'L2061' AND STUDENT_ID = 'C1701';

UPDATE SG_SCORES
SET SCORE = 95, SCORE_ASSIGNED = '2018/12/26'
WHERE COURSE_ID = 'L2061' AND STUDENT_ID = 'C1702';

UPDATE SG_SCORES
SET SCORE = 99, SCORE_ASSIGNED = '2018/12/26'
WHERE COURSE_ID = 'L2061' AND STUDENT_ID = 'C1601';

UPDATE SG_SCORES
SET SCORE = 93, SCORE_ASSIGNED = '2018/12/26'
WHERE COURSE_ID = 'L2061' AND STUDENT_ID = 'C1602';

SELECT Course_ID, Student_ID, Score, Score_Assigned "수강신청"
FROM SG_SCORES ss 
WHERE SCORE_ASSIGNED  = '2018/12/26';

-- Computer_Student 테이블의 모든 행 삭제
CREATE TABLE Computer_Student
AS
	SELECT Dept_ID, YEAR, Student_ID, Name, ID_Number
	FROM STUDENT s 
	WHERE Dept_ID = '컴공';

SELECT *
FROM Computer_Student;

TRUNCATE TABLE Computer_Student;

-- Department 테이블에서 '컴공' 학과의 행을 삭제
SELECT Professor_ID, Name, POSITION, Dept_ID
FROM PROFESSOR p 
WHERE DEPT_ID = '컴공';

DELETE FROM DEPARTMENT d 
WHERE DEPT_ID = '컴공';
-- Department 테이블의 '컴공'학과코드가 Professor 자식 테이블에서 '컴공'학과의 자식 행이 존재할 경우 오류

-- Course 테이블의 외부 키를 삭제하고,
-- 부모 행 삭제시 외부 키 칼럼 값을 NULL로 수정하도록 Professor_ID	칼럼을 Professor 테이블을 참조하여 외부 키를 추가
ALTER TABLE COURSE 
DROP CONSTRAINT Course_fk;

ALTER TABLE COURSE 
modify(CONSTRAINT Course_fk FOREIGN KEY(PROFESSOR_ID)
		REFERENCES Professor
		ON DELETE SET NULL);

-- Professor 부모 테이블의 교수번호 'P23'의 행을 삭제하고, 
-- Course 자식 테이블의 외부 키 칼럼 값을 확인	
SELECT  * 
FROM COURSE c2 
WHERE PROFESSOR_ID = 'P23';

DELETE FROM PROFESSOR p 
WHERE PROFESSOR_ID = 'P23';

SELECT *
FROM COURSE c2 
WHERE COURSE_ID = 'L2031';

-- Course 테이블의 Professor_ID 칼럼을 부모 행 삭제시 자식 행들이 자동 삭제되도록 Professor 테이블을 참조하여 외부 키 추가
ALTER TABLE COURSE 
DROP CONSTRAINT Course_fk;

ALTER TABLE COURSE 
modify(CONSTRAINT Course_fk FOREIGN KEY(PRofessor_ID)
							REFERENCES Professor
							ON DELETE CASCADE);
						
-- 교수번호가 'P22'인 김하늘 부교수가 퇴직하였다
-- Professor 테이블에서 삭제
SELECT *
FROM COURSE c 
WHERE PROFESSOR_ID = 'P22';

DELETE FROM PROFESSOR p 
WHERE PROFESSOR_ID = 'P22';

SELECT * 
FROM COURSE c 
WHERE PROFESSOR_ID = 'P22';

-- Course_Temp 테이블에 새로 개설된 과목과 변경된 과목을 이용하여 Course 테이블에 병합
SELECT *
FROM T_COURSE tc;

SELECT *
FROM Course;

MERGE INTO COURSE c 
	  USING T_Course t
	  ON (c.COURSE_ID = t.Course_ID)
WHEN MATCHED THEN 
	  UPDATE 
	  SET c.Title = t.Title, c.COURSE_FEES = t.Course_Fees
WHEN NOT MATCHED THEN 
	  INSERT 
	  (Course_ID, Title, C_Number, Professor_ID, Course_Fees)
	  VALUES
	  (t.Course_ID, t.Title, t.C_Number, t.Professor_ID, t.Course_Fees);
	 
SELECT *
FROM Course;

-- Student 테이블로부터 '컴공'학과의 학생 정보를 Computer_Student 테이블에 복사하고, 
-- 영구히 저장
INSERT INTO Computer_Student
	SELECT Dept_ID, YEAR, Student_ID, Name, ID_Number
	FROM STUDENT s 
	WHERE Dept_ID = '컴공';

COMMIT;

-- Computer_Student 테이블을 잘못하여 모든 행을 삭제하였다 
-- 트랜잭션의 명령을 취소
DELETE FROM Computer_Student;

ROLLBACK;

SELECT *
FROM Computer_Student;


	 







