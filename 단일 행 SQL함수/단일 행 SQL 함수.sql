------------------------------------------
-- 문자형 함수
 
-- 문자 변환
-- LOWER(str): 소문자로 변환
-- UPPER(str): 대문자로 변환
 
-- 길이 계산
-- LENGTH(str): 문자열 길이 계산
-- LENGTHB(str): 문자열 길이를 바이트 단위로 계산
 
-- 문자 추출
-- SUBSTR(str, 위치, 문자수): 문자형 칼럼이나 문자 리터럴에 대하여 시작 위치에서 추출 문자수만큼 추출하여 반환
-- INSTR(str, 특정문자): 특정 문자의 위치 반환
 
-- 문자 제거
-- LTRIM(str, [제거할 문자집합]): 왼쪽부터 문자집합을 제거
-- RTRIM(str, [제거할 문자집합]): 오른쪽부터 문자집합을 제거

-- 문자 추가 및 결합
-- LPAD(str, 전체자릿수, [추가문자집합]): 왼쪽에 문자집합 추가
-- RPAD(str, 전체자릿수, [추가문자집합]): 오른쪽에 문자집합 추가
-- CONCAT(str1, str2): 두 문자열 결합

-- 기존문자 변환
-- REPLACE(str, 기존문자, [대체문자열]): 기존문자를 대체문자열로 변환
-- TRANSLATE(str, 기존문자, [대체문자]): 기존문자를 대체문자로 변환


-- 숫자형 함수

-- 실수형 처리 
-- ROUND(m,n): 실수 m을 소수점 n 자릿수로 반올림하여 실수로 반환
-- TRUNC(m,n): 실수 m을 소수점 n 자릿수로 내림하여 실수로 반환

-- 정수형 처리
-- CEIL(m): m을 올림하여 정수로 반환
-- FLOOR(m): m을 내림하여 정수로 반환

-- 나머지 계산
-- MOD(m1, m2): m1/m2에 대한 나머지 반환


-- 날짜형 함수

-- 함수명						의미
-- ADD_MONTHS(d,n)			날짜(d)에 n개월 수를 더하여 반환
-- MONTHS_BETWEEN(d2,d2)	두 날짜 d1, d2의 월차를 계산하여 반환
-- LAST_DAY(d)				그 달(d)의 마지막 날짜를 반환
-- NEXT_DAY(d, '요일')		날짜(d)로부터 다음 주의 요일에 대한 날짜 반환
-- ROUND(d)					날짜(d)를 반올림
-- TRUNC(d)					날짜(d)를 내림
-- EXTRACT(D, '형식')			날짜형 데이터에서 연월일 추출

-- 날짜형 출력
-- SYSDATE: 시스템의 현재 날짜와 시간 반환
-- CURRENT_DATE: 지역시간대의 현재 날짜 반환
-- CURRENT_TIMESTAMP: 지역시간대의 현재 날짜와 시간 반환
-- EXTRACT(YEAR FROM d): 날짜형 데이터 d로부터 년도 추출
-- EXTRACT(MONTH FROM d): 날짜형 데이터 d로부터 월 추출
-- EXTRACT(DAY FROM d): 날짜형 데이터 d로부터 일 추출
-- DBTIMEZONE: 데이터베이스의 시간대 반환
-- SESSIONTIMEZONE: 현재 세션의 표준 시간대 반환
-- ALTER SESSION SET NLS_DATE_FORMAT문: 날짜 형식을 'YYYY/MM/DD HH24:MI:SS'로 지정

-- 날짜형 연산
-- TO_YMINTERVAL('년-월'): 날짜형 데이터에 '년-월'을 더함
-- NUMTODSINTERVAL(n, '단위'): '단위'에 'DAY', 'HOUR', 'MINUTE', 'SECOND'를 기술하며,
-- 날짜형 데이터 n에 더한 값 반환
-- NUMTOYMINTERVAL(n, '단위'): '단위'에 'YEAR', 'MONTH'를 기술하여
-- 날짜형 데이터 n에 더한 값 반환


-- 데이터형 변환 함수

-- 날짜형 변환 함수 

-- 날짜형 데이터 변환 함수에 필요한 형식 요소
-- 날짜형 '연/월/일' 표기의 기본 형식: 'YY/MM/DD'
-- 기본 형식은 NLS_DATABASE_PARAMETERS의 설정 값에 따라 결정되며,
-- 설정값 조회: SELECT * FROM NLS_DATABASE_PARAMETERS;
-- 'NLS_LANG'에 지정된 값은 SQL문 실행시 메시지, 화폐 단위, 날짜 형식의 기본값을 지정하고 한글 사용을 가능하게 함
-- 날짜 표현에 사용하는 형식요소
-- 구분		형식요소				내용							범위
-- 			YY, RR				연도(숫자 2자리 표기) 			예: 18
--			YYYY, RRRR			연도(숫자 4자리 표기) 			예: 2018
--			SYYYY				연도 4자리 표기, BC는 -			예: 2018
--			YYY, YY, Y			연도 3, 2, 1자리 표기			예: 018, 18, 8
--			YEAR, SYEAR			연도(문자 표기)					예: TWENTY ELEVEN
--	날짜		MM					월(숫자)						1 ~ 12
--			MON					3문자 단축형 월					JAN ~ DEC 혹은 '월'
--			MONTH				월(문자)						예: JANUARY
--			DD					일(숫자)						1 ~ 31(달에 따라 다름)
--			DAY					요일 							일요일 ~ 토요일
--			D 					그 주의 몇 번째 날				1 ~ 7
--			DDD					그 해의 몇 번째 날				1 ~ 366(해에 따라)
-- 시간 및 기타 표현의 형식요소
-- 구분		형식요소				내용							범위
-- 			HH, HH12			시각							0 ~ 12
--			HH24				군대식 시각					0 ~ 23
--			MI					분							0 ~ 59
--	시간		SS					초							0 ~ 59
--			SSSSS				자정이후 초 단위 시간				0 ~ 86399
--			FF[1..9]			두 번째 초단위 표시				최대 9자리까지, SS.FF3	
--			AM, PM				오전, 오후 표기					

--			CC, SCC				세기 2자리 표기					예: 21
--			Q					4분기							1 ~ 4
--			W					그 달의 주						1 ~ 5
--			WW, IW				그 해의 주						1 ~ 52
--			DL					년월일 표기					예: 2018년 3월 18
--	기타		DS					년월일 표기					예: 2018/03/18
--			DY					요일 표기						예: 월 또는 수 
--			TZH					표준시간대 시간					예: 'HH:MI:SS:TZH'	
--			TZM					표준시간대 분					예: 'HH:MI:SS:TZM'	
--			TZR					표준시간대 지역					예: 'US/PAcific'


-- TO_DATE() 변환 함수로 문자형 데이터를 날짜형 데이터로 변환
-- TO_DATE(문자형 데이터, '날짜형 변환형식')
-- 'YY/RR'은 Y2K와 관련있는 연도의 형식요소로,
-- 아래 표와 같이 날짜형으로 변환할 문자형 데이터 범위에 따라 현재 세기 또는 이전 세기를 변환
-- YY/YYYY와 RR/RRRR 형식의 문자형 데이터 범위
-- 문자형 데이터 범위		YY		RR
-- 0 ~ 49			  현재 세기   현재 세기  
-- 50 ~ 99			  현재 세기	이전 세기
-- TO_DATE()의 'YYMMDD'과 'RRMMDD' 형식으로 변환
-- 문자데이터			변환 형식				날짜형 데이터			출력 형식			출력결과
--					'YYMMDD'			97/05/05							2097-05-05
-- '970505'	
-- 					'RRMMDD'			97/05/05		  'RRRR-MM-DD'		1997-05-05
--
--					'YYMMDD'			18/02/15		  'YYYY-MM-DD'		2018-02-15
-- '180215'					
--					'RRMMDD'			18/02/15							2018-02-15
-- 위 표와 같이 문자형 데이터를 TO_DATE() 함수에 변환형식을 각각 적용하여 날짜형 데이터로 변환

-- TO_DSINTERVAL('sql 형식' 또는 'ds_iso형식')변환 함수
-- 문자형을 '형식'을 참고하여 INTERVAL DAY TO SECOND형으로 변환
-- sql형식은 'dd hh:mm:ss'이며,
-- ds_iso 형식은 'pddDThhHmmMssS'이다
-- dd(일), hh(시), mm(분), ss(초)로 숫자로 표기

-- TO_YMINTERVAL('yy_mm 형식' 또는 'ym_iso형식')변환 함수
-- 문자형을 '형식'을 참고하여 INTERVAL YEAR TO MONTH형으로 변환
-- 'ym_iso 형식'은 'PyyYmmMddDThhHmmM ssS', 'yy_mm'형식이다.
-- yy(년), mm(월), dd(일), hh(시), mm(분), ss(초)를 숫자로 표기

-- 문자형 변환 함수

-- TO_CHAR() 변환 함수로 날짜형 데이터를 문자형으로 변환
-- TO_CHAR(날짜형 데이터, '날짜형 변환형식')

-- TO_CHAR() 변환 함수로 숫자형 데이터를 문자형으로 변환
-- TO_CHAR(숫자형 데이터, '숫자형 변환형식')
-- 숫자 변환에 사용하는 형식 요소
-- 구분			형식요소		내용							예시
--				9			자릿수 지정					'9999'
--	자리 지정 		0			0으로 채움						'0999'
--				B			공백으로 채움					'B9999'
--				.			소수점 추가					'9999.99'
-- 구분 			,			천 단위마다 콤마 추가				'99,999,999.99'
-- 기호			D			특정자릿수 구분자. 기본값은 .		'999D99'
--				G			그룹구분						'99G999'
--				$			화폐단위 표시					'$99,999.99'
-- 화폐			L			국가별 화폐단위 표시				'L99,999.99'
-- 기호			C			ISO 화폐기호 반환, 한화는 KRW		'C9999'
--				U			화폐단위 표시					'U999.99'
-- 지수			EEEE		지수형태로 표시					'9.99EEEE'
-- 				S			부호표시						'S999.99'
-- 부호			MI			-값일 떄 - 부호 표시			'9999MI'
--				PR			음수일 때 < > 표시				'9999PR'
-- 기타			RN, rn		로마자의 대소문자로 변환			'RN' 혹은 'rn'

-- 숫자형 변환함수

-- TO_NUMBER() 변환 함수로 문자형을 숫자형으로 변환
-- TO_NUMBER('문자형 데이터', '숫자형 변환형식')


-- NULL 관련 함수
-- 함수명							설명
-- NVL(표현식, '값')				표현식이 NULL이면 '값' 반환
-- NVL2(표현식, '값1', '값2')		표현식이 NULL이 아니면 '값1'을, NULL이면 '값2' 반환
-- NULLIF(표현식1, 표현식2)			표현식1과 표현식2가 동일한 값이면 NULL을 반환, 그렇지 않으면 표현식1 반환
-- LNNVL(표현식)					표현식의 조건식에 대한 부정의 '참' 또는 '거짓' 반환
-- COALESCE(표현식1, 표현식2,...)	표현식1이 NULL이 아니면 표현식1 반환. NULL이면, 
--							    표현식2가 NULL인지 확인후 NULL이 아니면 표현식2 반환, 
--								NULL이면 표현식3와 비교


-- 기타 함수

-- DECODE() 함수
-- DECODE(표현식, 비교값1, 반환값1,  비교값1, 반환값2, ..... , 비교값n, 반환값n, [기본값[)
-- 표현식이 비교값이면 반환값을 반환하고,
-- 비교값이 없을 경우에는 기본값 반환

-- CASE 함수
-- CASE 표현식 WHEN 비교값1 THEN 반환값1
--			 WHEN 비교값2 THEN 반환값2
--			 .... 		ELSE 기본값
-- END
-- 표현식이 WHEN절에 기술한 비교값과 동일하면 반환값 반환,
-- 비교값이 없을 경우에는 기본값 반환

-- REGEXP_LIKE() 함수
-- WHERE REGEXP_LIKE(표현식, '값1 | 값2 | ...')
-- 패턴 검색에 사용하는 LIKE 연산자를 대체할 수 있는 함수로,
-- 검색할 키워드를 파이프라인기호(|)로 복수 개를 기술 가능
 



------------------------------------------
 -- 'HELLO' 문자열을 소문자로 변환하고,
 -- 'welcome' 문자열을 대문자로 변환
SELECT LOWER('HELLO'), 
		UPPER('welcome') 
FROM Dual;
 -- Dual 테이블: 단일 행의 단일 칼럼을 가지는 오라클 데이터베이스의 더미 테이블로,
 -- 일시적인 산술 연산을 위한 FROM절의 테이블명으로 사용

-- Course 테이블의 Title과 Title 칼럼의 문자열 길이와 바이트 단위로 계산하여 문자열 길이 내림차순으로 출력
SELECT Title, LENGTH(Title), LENGTHB(Title)
FROM COURSE c 
ORDER BY 2 DESC;

-- Professor 테이블의 교수명에서 교수의 성을 추출하고, Email 주소에서 '@'문자가 나타나는 위치를 교수명순으로 출력
SELECT Name, SUBSTR(Name, 1, 1), Email, INSTR(Email, '@')
FROM PROFESSOR p 
ORDER BY 1;

-- 'xyxyxHello' 문자열에서 'x'나 'y' 문자를 제거
SELECT LTRIM('xyxyxHello', 'xy') 
FROM Dual;

-- 'Oracle Serverkkkkk' 문자열의 'k' 문자 제거
SELECT RTRIM('Oracle Serverkkkkk', 'k')
FROM Dual;

-- Professor 테이블의 전화번호에 지역번호 '053-'를 추가하여 교수번호순으로 출력
SELECT Professor_ID, Name, POSITION, Telephone, LPAD(Telephone, 12, '053-')
FROM PROFESSOR p 
ORDER BY 1;

-- Professor 테이블의 교수명, 직위, 교수명과 직위를 결합하여 교수번호순으로 출력
SELECT Professor_ID, Name, POSITION, CONCAT(Name, POSITION)
FROM PROFESSOR p 
ORDER BY 1; 

-- 교수용 Email 서버의 도메인명이 'cyber'에서 'dream'으로 변경되었다
-- 이를 변경하여 교수명순으로 출력
UPDATE PROFESSOR 
SET Email = REPLACE(Email, 'cyber', 'dream');

SELECT Professor_ID, Name, Email
FROM PROFESSOR p 
ORDER BY 2;

-- 12.345의 값을 ROUND()와 TRUNC() 함수 사용하여 출력
SELECT ROUND(12.345, 2), TRUNC(12.345, 2)
FROM Dual;

-- 12.345의 값을 CEIL() 함수와 FLOOR()함수로 변환
SELECT CEIL(12.345), FLOOR(12.345)
FROM Dual;

-- 100을 3으로 나누어 몫과 나머지를 계산하여 출력
SELECT FLOOR(100/3) "몫", MOD(100, 3) "나머지" 
FROM Dual;

-- SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP 함수를 이용하여 현재 날짜와 시간 출력
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP 
FROM Dual;

-- 데이터베이스 서버에 설정된 시간대와 클라이언트의 시간대, 지역시간대의 날짜와 시간 출력
SELECT DBTIMEZONE, SESSIONTIMEZONE, CURRENT_TIMESTAMP
FROM Dual;

-- 날짜형 형식을 'YYYY/MM/DD HH24:MI:SS'로 지정하여 시스템 날짜와 지역시간대의 날짜와 시간 출력
ALTER SESSION 
SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

SELECT SYSDATE, CURRENT_TIMESTAMP 
FROM Dual;

-- 학생 테이블의 연도별 입학일자를 이용하여 입학년도, 입학월, 입학일을 추출하여 출력
ALTER SESSION 
SET NLS_DATE_FORMAT = 'YYYY/MM/DD';
SELECT UNIQUE CURRENT_DATE "현재일자", I_Date "입학일자",
	   EXTRACT(YEAR FROM I_Date) "입학년도",
	   EXTRACT(MONTH FROM I_Date) "입학월",
	   EXTRACT(DAY FROM I_Date) "입학일"
FROM STUDENT s 
WHERE I_Date IS NOT NULL 
ORDER BY 2;

-- 현재 날짜를 반올림과 내림하여 출력
SELECT CURRENT_TIMESTAMP, ROUND(CURRENT_DATE), TRUNC(CURRENT_DATE)
FROM Dual; 

-- 현재 날짜에 10개월을 더하여 출력
SELECT CURRENT_DATE, ADD_MONTHS(CURRENT_DATE, 10)
FROM Dual;

-- Student 테이블의 '컴공'학과 학생들에 대한 재적월수를 계산하여 출력
-- 기준일은 CURRENT_DATE임
SELECT Dept_ID, Name, I_Date, CURRENT_DATE "기준일",
		TRUNC(MONTHS_BETWEEN(CURRENT_DATE, I_Date)) "재적월수"
FROM STUDENT s 
WHERE DEPT_ID = '컴공'
ORDER BY 4;

-- 현재시간에 4시간을 더하여 출력
SELECT CURRENT_TIMESTAMP "현재시간",
	   CURRENT_TIMESTAMP + NUMTODSINTERVAL(4, 'HOUR') "4시간 후"
FROM Dual;

-- 'C1802' 학번의 '신지애' 학생이 2018년 7월 15일부로 1년간 휴학하였다. 
-- 복학 예정일을 계산하여 출력
SELECT Dept_ID, Student_ID, Name, '2018년 7월 15일' "휴학일자",
	TO_DATE('180715', 'YYMMDD') + NUMTOYMINTERVAL(1, 'YEAR') "복학예정일"
FROM STUDENT s 
WHERE STUDENT_ID = 'C1802';

-- Student 테이블의 주민등록번호를 이용하여 생년월일을 추출하고,
-- 날짜형 데이터로 'RRMMDD', 'YYMMDD'로 각각 변환하여 'YYYY/MM/DD' 형식으로 출력
ALTER SESSION
SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

SELECT Student_ID, Name, ID_Number,
	   TO_DATE(SUBSTR(ID_Number, 1, 6), 'RRMMDD') "RRMMDD 변환",
	   TO_DATE(SUBSTR(ID_Number, 1, 6), 'YYMMDD') "YYMMDD 변환"
FROM STUDENT s;

-- 현재 시간에서 100일 5시간 이후의 날짜와 시간을 출력
SELECT CURRENT_TIMESTAMP "현재시간",
	   TO_CHAR(CURRENT_TIMESTAMP + TO_DSINTERVAL('P100DT05H'),
	   'YYYY-MM-DD HH24:MI:SS') "100일 5시간후"
FROM Dual;

-- '컴공'학과 1학년에 재학중인 학생들의 졸업예정연도를 입학년도를 기준으로 출력
-- 단, 재학년도는 4년으로 한다
SELECT Dept_ID, YEAR, Student_ID, Name, I_Date "입학년도",
	   I_Date + TO_YMINTERVAL('4-0') "졸업예정연도"
FROM STUDENT s 
WHERE DEPT_ID = '컴공' AND YEAR = 1;

-- 현재 날짜와 시간을 'YYYY-MM-DD HH24:MI:SS FF3' 형식으로 변환하여 출력
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS FF3')
FROM Dual;

-- Student 테이블의 입학날짜 칼럼을 참고하여 'RRRR/MM/DD(DAY)' 형식으로 변환하여 입학일자순으로 출력
SELECT Student_ID, Name, I_Date,
	   TO_CHAR(I_Date, 'RRRR/MM/DD(DAY)') "입학일자"
FROM STUDENT s 
ORDER BY 3;

-- SG_Scores 테이블의 성적이 98점 이상자에 대하여 성적 취득일자를 'YYYY/MM/DD' 형식의 문자형으로 변환하여 출력
SELECT Student_ID, Course_ID, Score, Score_Assigned,
	   TO_CHAR(Score_Assigned, 'YYYY/MM/DD')
FROM SG_SCORES ss 
WHERE Score >= 98
ORDER BY 3 DESC;

-- SG_Scores 테이블로부터 점수가 98점 이상의 점수를 문자형으로 변환하여 출력
SELECT Student_ID, Course_ID, Score, 
	   TO_CHAR(Score)
FROM SG_SCORES ss 
WHERE Score >= 98
ORDER BY 3 DESC;

-- SG_Scores 테이블의 성적이 98점 이상인 행에 대하여 성적을 'S999', 'B999', '099.99' 형식으로 변환하여 출력
SELECT Score, 
		TO_CHAR(Score, 'S999'), TO_CHAR(-Score, 'S999'),
		TO_CHAR(Score, 'B999.9'), TO_CHAR(Score, '099.99')
FROM SG_SCORES ss 
WHERE Score >= 98
ORDER BY 1 DESC;

-- Course 테이블의 추가 수강료가 4만원 과목에 대하여 문자열로 변환하여,
-- '999,999', 'L999,999', 'C999G999' 형식으로 출력
SELECT Course_Fees,
	   TO_CHAR(Course_Fees, '999,999') "천단위 콤마 추가",
	   TO_CHAR(Course_Fees, 'L999,999') "국가별 화폐단위",
	   TO_CHAR(Course_Fees, 'C999G999') "ISO 화폐기호"
FROM COURSE c 
WHERE COURSE_FEES = 40000;

-- Course 테이블의 추가 수강료가 4만원(4*10^4)인 과목에 대하여,
-- 문자열로 변환하여 '9.99EEEE' 지수형식으로 변환하여 출력
SELECT Course_Fees,
	   TO_CHAR(Course_Fees, '9.99EEEE')
FROM COURSE c 
WHERE COURSE_FEES = 40000;

-- '$123.45' 문자열을 숫자형으로 변환
SELECT '$123.45',
		TO_NUMBER('$123.45', '$999.99')
FROM Dual;

-- Course 테이블을 출력
-- Course_Fees가 NULL일 때 0으로 변환하여 출력
SELECT Course_ID, Title, NVL(Course_Fees, 0)
FROM COURSE c;

-- Course 테이블에서 추가 수강료가 NULL이 아닌 과목중에서 4만원 미만인 행 출력
SELECT Course_ID, Title, Course_Fees
FROM COURSE c 
WHERE COURSE_FEES IS NOT NULL 
	  AND LNNVL(COURSE_FEES >= 40000);
	 
-- Course 테이블의 추가 수강료의 5% 인상 금액 출력
SELECT Course_ID, Title, 
	   NVL(Course_Fees, 0) "추가 수강료",
	   NVL2(Course_Fees, Course_Fees*0.05, 0) "추가 수강료 5% 인상분"
FROM COURSE c;

-- Student 테이블에서 학생의 전화번호, 이메일주소, 주소 순으로 대표 연락처 출력
SELECT Name, Telephone, Email,
	   Coalesce(Telephone, Email, Address) "대표연락처"
FROM STUDENT s
ORDER BY 2, 3;

-- '컴퓨터공학과' 학생의 주민등록번호를 이용하여,
-- 성별코드가 '1'과 '3'일 때 '남', '2'와 '4'일 때 '여'로 변환하여 출력
SELECT Dept_ID, Name, ID_Number,
	   Decode(SUBSTR(ID_Number, 8, 1), 1, '남', 2, '여', 3, '남', 4, '여')
FROM STUDENT s 
WHERE Dept_ID = '컴공'
ORDER BY 3;

-- 'C1601'학번에 대하여 SG_Scores 테이블의 성적을 'A'(90 ~ 100), 'B'(80 ~ 89), 'C'(70 ~ 79), 'D'(60 ~ 69), 'F'(0 ~ 59)로 변환하여 
-- 과목코드순으로 출력
SELECT Student_ID, Course_ID, Score,
	   CASE WHEN Score BETWEEN 90 AND 100 THEN 'A'
	   	    WHEN Score BETWEEN 80 AND 89 THEN 'B'
	   	    WHEN Score BETWEEN 70 AND 79 THEN 'C'
	   	    WHEN Score BETWEEN 60 AND 69 THEN 'D'
	   	    							 ELSE 'F'
	   END "등급"
FROM SG_SCORES ss 
WHERE STUDENT_ID = 'C1601'
ORDER BY 2;

-- Professor 테이블에서 직위를 '총장', '교수', '부교수', '조교수', '초빙교수'의 직위별,
-- 학과코드순으로 출력
SELECT Dept_ID, POSITION, Name, Duty
FROM PROFESSOR p 
ORDER BY CASE POSITION WHEN '총장' THEN 1
					   WHEN '교수' THEN 2
					   WHEN '부교수'THEN 3
					   WHEN '조교수'THEN 4
END, Dept_ID;

-- Student 테이블에서 주소가 '송파구'와 '수성구'인 학생의 소속학과, 학년, 학번, 이름, 주소 출력
SELECT Dept_ID, YEAR, Student_ID, Name, Address
FROM STUDENT s 
WHERE REGEXP_LIKE(Address, '송파구 | 수성구');

-- SG_Scores 테이블의 성적을 이용하여 'A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'의 등급을 산출하는 사용자 정의 함수 생성
-- 단, 형식인자는 Score 숫자형임
CREATE OR REPLACE FUNCTION Grade_Cal(Score NUMBER)
RETURN CHAR IS
   v_Grade CHAR(2);
BEGIN
   CASE
      WHEN Score >= 95 THEN v_Grade := 'A+';
      WHEN Score >= 90 THEN v_Grade := 'A';
      WHEN Score >= 85 THEN v_Grade := 'B+';
      WHEN Score >= 80 THEN v_Grade := 'B';
      WHEN Score >= 75 THEN v_Grade := 'C+';
      WHEN Score >= 70 THEN v_Grade := 'C';
      WHEN Score >= 65 THEN v_Grade := 'D+';
      WHEN Score >= 60 THEN v_Grade := 'D';
      ELSE v_Grade := 'F';
   END CASE;
   
   RETURN v_Grade;
END;

-- Grade_Cal() 함수를 이용해서 SG_Scores 테이블의 성적에 대한 등급을 계산하고,
-- 'C1601' 학번의 성적 출력
UPDATE SG_SCORES 
SET Grade = Grade_Cal(Score);

SELECT Student_ID, Course_ID, Score, Grade
FROM SG_SCORES ss 
WHERE STUDENT_ID = 'C1601';




