-- 아래 표의 개설과목을 과목임시 테이블에 저장하고, 출력
-- 과목코드	과목명			학점수		담당교수번호		추가수강료
-- L3001	스프링 프로젝트		3			P11				50,000
-- L3002	모바일프로그래밍		3			P12				
-- L3003	데이터베이스튜닝		2			P13				50,000
-- L3004	빅데이터 개론		2			P14				30,000

SELECT *
FROM T_COURSE tc
ORDER BY COURSE_ID;

INSERT INTO T_COURSE tc 
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
('L3001', '스프링프로젝트', 3, 'P11', 50000);

INSERT INTO T_COURSE tc 
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
('L3002', '모바일프로그래밍', 3, 'P12', NULL);

INSERT INTO T_COURSE tc 
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
('L3003', '데이터베이스튜닝', 2, 'P13', 50000);

INSERT INTO T_COURSE tc 
(COURSE_ID, TITLE, C_NUMBER, PROFESSOR_ID, COURSE_FEES)
VALUES
('L3004', '빅데이터 개론', 2, 'P14', 30000);

-- 아래 표를 참고하여 학번별 수강신청 과목을 수강임시 테이블에 저장하고, 출력
-- 학번		성명		과목코드		과목명 			학점수	수강일자
-- C1801	김대현	L3001		스프링프로젝트		3		2018/02/23
--					L3002		모바일프로그래밍		3		2018/02/23
--					L3003		데이터베이스튜닝		2		2018/02/23
--					L4001		빅데이터 개론		2		2018/02/23
-- C1802	신지애	L3001		스프링프로젝트		3		2018/02/23
--					L3002		모바일프로그래밍		3		2018/02/23
--					L3003		데이터베이스튜닝		2		2018/02/23
--					L1051		웹서버 관리		2		2018/02/23
SELECT *
FROM T_SG_SCORES tss;

MERGE INTO T_SG_SCORES tss
	  USING SG_Scores ss
	  ON (tss.STUDENT_ID = ss.Student_ID)
WHEN MATCHED THEN 
	 UPDATE 
	 SET tss.Course_ID = ss.Course_ID, tss.Score = ss.Score, tss.Grade = ss.Grade, tss.Score_Assigned = ss.Score_Assigned
WHEN NOT MATCHED THEN 
	 INSERT 
	 (Student_ID, Course_ID, Score, Grade, Score_Assigned)
	 VALUES
	 (ss.Student_ID, ss.Course_ID, ss.Score, ss.Grade, ss.Score_Assigned);
	 
SELECT * FROM T_SG_SCORES tss;

-- 'C1802' 학번의 '신지애' 학생이 수강신청한 'L1051' 과목을 'L3004' '빅데이터 개론'으로 변경하고자 한다
-- T_SG_Scores 테이블에 변경
UPDATE T_SG_SCORES 
SET COURSE_ID = 'L3004'
WHERE STUDENT_ID = 'C1802';

-- 아래 표를 참고하여 성적을 수강임시 테이블에 저장하고, 출력
-- 교수번호	과목코드		과목명			학번		성적		성적취득일자
-- P11		L3001		스프링프로젝트		C1001	98		2018/06/28
--										C1002	88		2018/06/28
-- P12		L3002		모바일프로그래밍		C1001	87		2018/06/28
--										C1002	92		2018/06/28
-- P13		L3003		데이터베이스튜닝		C1001	92		2018/06/28
--										C1002	93		2018/06/28	
-- P14		L3004		빅데이터 개론		C1001	89		2018/06/28
--										C1002	97		2018/06/28

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1001', 'L3001', 98, NULL, '2018/06/28');

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1002', 'L3001', 88, NULL, '2018/06/28');

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1001', 'L3002', 87, NULL, '2018/06/28');

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1002', 'L3002', 92, NULL, '2018/06/28');

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1001', 'L3003', 92, NULL, '2018/06/28');

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1002', 'L3003', 93, NULL, '2018/06/28');

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1001', 'L3004', 89, NULL, '2018/06/28');

INSERT INTO T_SG_SCORES tss 
(STUDENT_ID, COURSE_ID, SCORE, GRADE, SCORE_ASSIGNED)
values('C1002', 'L3004', 97, NULL, '2018/06/28');

SELECT * FROM T_SG_SCORES tss 
ORDER BY STUDENT_ID, Course_ID;

-- 과목코드 'L2033'의 '게임프로그래밍' 개설과목이 폐강되었다
-- 수강임시 테이블에서 'L2033' 과목코드를 삭제
DELETE FROM T_SG_SCORES tss 
WHERE COURSE_ID = 'L2033';

