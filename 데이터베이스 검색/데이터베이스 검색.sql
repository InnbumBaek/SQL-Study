----------------------------
-- SELECT문
-- SELECT [ALL | (DISTINCT | UNIQUE)] {칼럼명[ 별명],...}, * 
-- FROM 테이블명;

-- SELECT절에는
-- 1. FROM절의 테이블로부터 검색하여 출력할 칼럼명이나, '*'(모든 칼럼)를 기술
-- 여러 칼럼을 기술할 때는 콤마로 구분
-- 2. 칼럼명 앞에 기술하는 ALL은 기본값으로 전체 행을 출력하고, 
-- DISTINCT 또는 UNIQUE는 동의어로 중복되지 않는 하나의 행을 출력
-- 3. 칼럼명 뒤에는 한 칸 이상의 공백을 주고 별명을 줄 수 있다
-- 4. 산술식, 리터럴, 함수 등을 기술 가능

-- FROM절에는
-- 검색에 사용할 객체명으로 테이블명이나 뷰명 등을 기술

-- 결과 행이 출력될 떄 SELECT절의 칼럼명이나 수식 등이 부제목으로 출력

-- 기본 맞춤(justification) 형식
-- 칼럼값이 출력되는 기본 맞춤 형식은 문자형과 날짜형 데이터는 왼쪽 정렬,
-- 숫자형 데이터는 오른쪽 정렬

-- SELECT문의 확장
-- SELECT 칼럼명1, ...., *, 리터럴, 함수, 수식, 서브 쿼리, ...(출력할 칼럼명 등을 기술, 최종 결과 테이블 생성)
-- FROM 테이블명1, ...., 뷰명1, ....(검색할 객체명들을 기술, 중간결과 테이블[1] 생성)
-- WHERE 검색조건1(FROM절의 검색조건 기술)
-- GROUP BY 칼럼명1, 칼럼명2, ....(그룹화할 칼럼명들을 기술, 중간결과 테이블[2] 생성)
-- HAVING 검색조건2(GROUP BY절의 검색조건 기술)
-- ORDER BY 칼럼명1 [ASC | DESC], ...
--  		순서번호1[ASC | DESC], ...(출력할 정렬방법 기술)

-- SELECT문의 주요 사항
-- 절의 기술 순서는 고정
-- HAVING절은 GROUP BY절이 기술될 떄만 사용 가능 
-- SELECT문의 결과 행의 수는 0행, 한 행, 복수 행 모두 정상적으로 실행됌
-- SELECT문의 실행 결과는 화면에 출력

-- 별명(alias) 사용
-- SELECT와 FROM절에 사용 가능
-- SELECT절에 기술되는 복잡한 칼럼명이나 산술식, 함수 등에 대하여 간단하고, 이해하기 쉽도록 하기 위해 사용
-- SELECT절의 별명
-- 한 칸 이상의 공백을 띄운 후 따옴표("")내에 별명을 기술하거나 AS 다음에 기술
-- * 칼럼의 별명은 출력시 부제목으로 사용
-- * 칼럼의 별명은 ORDER BY절의 출력순서를 지정할 떄 사용 가능
-- FROM절의 별명
-- 테이블명 등을 단순화할 떄 사용
-- FROM절에 테이블명 한 칸 이상의 공백을 띄운 후 별명 기술
-- * 테이블명의 별명은 SELECT문의 각 절에서 칼럼명을 구분할 떄 사용 

-- ORDER BY절
-- FROM절에 기술한 테이블의 칼럼명이나 SELECT절에 기술된 칼럼명, 산술식 등의 순서번호로 출력되는 데이터를 정렬 가능
-- 테이블의 칼럼명, 순서번호, SELECT절의 별명은 기술 할 수 있으나, 
-- 수식이나 함수, 리터럴 등은 기술 불가
-- 오름차순 정렬 방법은 생략 가능
-- 기본 키나 고유 키 칼럼을 오름차순으로 출력할 경우에는 기술 불필요

-- WHERE절에 검색조건 지정
-- FROM절에 기술된 테이블에서 일부 데이터나 특정 데이터를 검색하기 위한 조건 지정할 때 사용
-- 테이블의 행들은 WHERE절의 검색조건이 참이 되는 행에 대해서만 반환
-- 검색조건 기술
-- WHERE 표현식1 연산자 표현식2 
-- 1. 표현식1과 표현식2는 테이블이나 뷰의 컬럼명, 리터럴, 수식, 함수, 서브 쿼리, ROWNUM, NULL, 시퀀스.CURRVAL, 시퀀스.NEXTVAL이 기술될 수 있으나,
-- 데이터타입이 같아야 하며,
-- 두 개의 표현식에 대하여 연산자의 결과가 참이 되는가 확인함
-- 2. 연산자는 산술연산자, 관계연산자, 논리연산자, SQL연산자 등이 존재
-- 3. 만약 다중 칼럼으로 검색조건을 기술할 경우 칼럼명과 검색할 값은 "(칼럼명1, 칼럼명2) 연산자 (('값1', '값2'), ....)" 형식으로 기술

-- 산술연산자
-- SELECT절에 기술된 칼럼명 이외에 수식이나, 함수명 등의 값으로 정렬하고자 할 때, ORDER BY절에 수식 기술 불가능
-- 수식을 기술하지 못할 경우에는 SELECT절에 순서번호로 정렬 방법을 기술
-- SELECT절 순서번호 
-- 순서번호			1			2			  	3
-- SELECT		A * 100,		B + 500,		C - 30
-- FROM						  Temp
-- ORDER BY		1 ASC,			3 DESC;

-- 관계연산자
-- 관계연산자			의미					표현식
--  >				크다					표현식1 > 표현식2
--  >=				크거나 같다 			표현식1 > 표현식2
--  <				작다 					표현식1 > 표현식2
--  <=				작거나 같다 			표현식1 > 표현식2
--  =				같다 					표현식1 > 표현식2
--  <>, !=			같지 않다 				표현식1 > 표현식2

-- 논리연산자
-- 논리연산자			의미					표현식			 
-- AND				논리곱				조건1 AND 조건2 	
-- OR 				논리합				조건1 OR 조건2
-- NOT 				부정 					NOT 조건1

-- 연결연산자
-- 표현식1 || 표현식2
-- 문자형 데이터들 결합

-- LIKE연산자
-- 표현식 LIKE '문자패턴'
-- 부정 NOT LIKE 
-- 문자열의 문자패턴에 의해서 검색할 수 있는 SQL 연산자
-- '문자패턴'에 사용되는 대체 문자(wild card)
-- 1. "%" 기호는 모든 문자 대체
-- 2. "_" 기호는 한 문자 대체
-- LIKE연산자의 '문자패턴'에 대체 문자를 사용하지 않으면,
-- LIKE연산자가 "=" 관계연산자로 대체

-- IN연산자
-- 표현식 IN (값1, 값2, ....)
-- 부정 NOT IN 
-- 가능한 값들의 목록과 비교하여, 가능한 값의 목록 중 하나일 때 '참'이 되고, 그렇지 않으면 '거짓'

-- BETWEEN ~ AND ~연산자 
-- 표현식 BETWEEN 최솟값 AND 최댓값
-- 부정 NOT BETWEEM ~ AND ~
-- 최솟값부터 최댓값의 범위에 포함되는가를 검색하는 SQL연산자

-- IS NULL연산자
-- 표현식 IS NULL 
-- 부정 IS NOT NULL 
-- 표현식이 NULL이면 '참', 아니면 '거짓'

-- ROWNUM 의사칼럼
-- FROM절에 기술한 테이블이나 뷰, 서브 쿼리의 행 번호를 반환
-- WHERE절에 ROWNUM 의사칼럼을 이용하여 TOP-N 쿼리 가능




------------------------------

-- Department 테이블의 모든 데이터 출력
SELECT Dept_ID, Dept_Name, Dept_Tel
FROM Department;

-- 중복되지 않도록 칼럼값 검색
SELECT DISTINCT Dept_ID
FROM Professor;

-- Professor 테이블의 중복되지 않은 Dept_ID 칼럼의 값들을 출력. 
-- 단 부제목은 '소속학과'로 출력
SELECT UNIQUE Dept_ID "소속학과"
FROM Professor;

-- Course 테이블에서 과목코드, 과목명, 학점수를 출력
SELECT Course_ID "과목코드", Title "과목명", C_Number "학점수" 
FROM Course;

-- Course 테이블에서 과목코드, 과목명, 학점수를 과목명 오름차순으로 정렬
SELECT Course_ID "과목코드", Title "과목명", C_Number "학점수"
FROM COURSE c 
ORDER BY Title;

-- Course 테이블에서 과목코드, 과목명, 학점수, 과목별수강료(학점수 * 30000 + 추가수강료)를 출력하되, 과목별 수강료를 내림차순, 과목코드는 오름차순으로 출력
SELECT Course_ID "과목코드", Title "과목명", C_Number "학점수", C_Number * 30000 + NVL(Course_Fees,0) "과목별 수강료"
FROM COURSE 
ORDER BY 4 DESC, Course_ID ASC;
-- NVL(Course_Fees, 0)함수는 Course_Fees 칼럼이 NULL값일 때 0 반환, NULL값이 아닐 때 Course_Fees 칼럼 값 반환 

-- Professor 테이블로부터 '컴공' 학과의 교수명을 출력
SELECT Professor_ID, Name, POSITION, Dept_ID
FROM PROFESSOR p
WHERE Dept_ID = '컴공';

-- Course 테이블로부터 추가 수강료가 30000원 이상인 과목명을 출력하되, 추가 수강료를 내림차순으로 출력
SELECT Course_ID, Title, C_Number, Course_Fees
FROM COURSE c 
WHERE Course_Fees >= 30000
ORDER BY 4 DESC;

-- Student 테이블에서 '컴공'학과 2학년 학생의 학과, 학년, 성명을 출력
SELECT Dept_ID, YEAR, Name 
FROM STUDENT s 
WHERE Dept_ID = '컴공' AND YEAR = '2';

-- Student 테이블에서 '컴공'학과 2학년 학생을 다중 칼럼으로 검색하여 출력
SELECT Dept_ID, YEAR, Name
FROM Student 
WHERE (Dept_ID, YEAR) = (('컴공', '2'));

-- Professor 테이블로부터 소속학과, 교수명, 전화번호를 자연어로 출력하되, 학과코드순으로 출력
SELECT Dept_ID || '학과 '|| Name || ' ' || POSITION || '의 전화번호는 ' || Telephone || ' 이다.'
FROM PROFESSOR p
ORDER BY Dept_ID;

-- Student 테이블로부터 '이'씨 성의 학생 명단을 출력
SELECT Dept_ID, YEAR, Student_ID, Name
FROM STUDENT s 
WHERE Name LIKE '이%';

-- Student 테이블로부터 성명 칼럼의 중간 글자가 '정'자인 학생을 검색하여 출력
SELECT Dept_ID, YEAR, Student_ID, Name 
FROM STUDENT s 
WHERE Name LIKE '_정_';

-- Student 테이블로부터 '이'씨와 '김'씨 성을 제외한 학생 명단을 출력
SELECT Dept_ID, YEAR, Student_ID, Name 
FROM STUDENT s 
WHERE Name NOT LIKE '이' AND Name NOT LIKE '김';

-- Professor 테이블에서 학과 코드가 '컴공', '정통'학과에 재직 중인 교수의 명단을 학과코드순으로 출력
SELECT Dept_ID, Professor_ID, Name, POSITION 
FROM PROFESSOR p 
WHERE Dept_ID IN ('컴공','정통')
ORDER BY Dept_ID;

-- Professor 테이블에서 학과 코드가 '컴공', '정통'학과가 아닌 교수의 명단을 학과코드순으로 출력
SELECT Dept_ID, Professor_ID, Name, POSITION 
FROM PROFESSOR p 
WHERE Dept_ID NOT IN('컴공','정통')
ORDER BY Dept_ID;

-- SG_Scores 테이블에서 성적이 90점부터 94점까지 성적을 성적 내림차순으로 출력
SELECT Student_ID, Course_ID, Score
FROM SG_SCORES ss 
WHERE Score BETWEEN '90' AND '94'
ORDER BY 3 DESC;

-- SG_Scores 테이블에서 성적이 60점부터 100점까지 제외한 성적을 성적순으로 출력
SELECT Student_ID, Course_ID, Score
FROM SG_SCORES ss 
WHERE Score NOT BETWEEN '60' AND '100'
ORDER BY Score;

-- Course 테이블로부터 추가수강료가 NULL인 행을 검색하여 과목명순으로 출력
SELECT * 
FROM COURSE c 
WHERE Course_Fees IS NULL 
ORDER BY Title;

-- Course 테이블로부터 추가수강료가 NULL이 아닌 행을 검색하여 과목명순으로 출력 
SELECT * 
FROM COURSE c 
WHERE Course_Fees IS NOT NULL 
ORDER BY Title;

-- Department 테이블 출력 시 행 번호를 추가
SELECT ROWNUM, Dept_ID, Dept_Name, Dept_Tel
FROM DEPARTMENT d;

-- Department 테이블에서 상위 3행을 출력
SELECT ROWNUM, Dept_ID, Dept_Name, Dept_Tel
FROM DEPARTMENT d 
WHERE ROWNUM <= 3;


