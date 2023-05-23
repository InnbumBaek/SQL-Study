-- 회원관리 테이블의 주민등록번호를 이용하여 성별 추출하고,
-- 성별이 '1' 또는 '3'일떄 '남자', '2'또는 '4'일때 '여자'로 변환하여,
-- 성별순으로 출력
SELECT Name, Regist_No,
	   DECODE(SUBSTR(Regist_No, 8, 1), 1, '남자', 2, '여자', 3, '남자', 4, '여자') "성별"
FROM EC_MEMBER em 
ORDER BY 3;

-- 회원관리 테이블을 이용하여 각 회원의 [회원명, 주민등록번호, 나이, 기준년월일]을 출력
-- 단, 기준년월일은 SYSDATE로 한다
SELECT Name, Regist_No,
CASE
	WHEN SUBSTR(TO_CHAR(SYSDATE, 'yyyy'), 3, 4) - SUBSTR(REGIST_NO, 1, 2) > 0 
		THEN  SUBSTR(TO_CHAR(SYSDATE, 'yyyy'), 3, 4) - SUBSTR(REGIST_NO, 1, 2)
	ELSE SUBSTR(TO_CHAR(SYSDATE, 'yyyy'), 3, 4) - SUBSTR(REGIST_NO, 1, 2) + 100
END "나이", TO_CHAR(SYSDATE, 'yyyymmdd') "기준년월일"
FROM EC_MEMBER; 
