-- 상품관리 테이블에서 삼성 회사 제품의 [상품코드, 상품명, 단위, 단가, 재고수량, 생산처]를 상품명순으로 출력
SELECT Product_Code, Product_Name, Standard, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Company IN ('SAMSUNG', 'Samsung', 'samsung')
ORDER BY 2;

-- 상품관리 테이블에서 '프린터' 제품의 단가가 50만원을 초과하는 상품의 [상품코드, 상품명, 단위, 단가, 재고수량, 생산처]를 단가 내림차순으로 출력
SELECT Product_Code, Product_Name, Standard, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Product_Name LIKE '프린터' AND Unit_Price > 500000
ORDER BY 4 DESC;

-- 회원관리 테이블에서 '정'씨 회원의 [회원명, 주민등록번호, 전화번호, 가입일자]를 출력
SELECT Name, Regist_No, Telephone, TIMESTAMP
FROM EC_MEMBER em 
WHERE Name LIKE '정%';

-- 주문처리 테이블에서 '현금입금'과 '계좌이체'한 회원의 [주문번호, 상품코드, 결제방법, 결제일자]를 결제방법, 결제일자순으로 출력
SELECT Order_No, Product_Code, CSel, CMoney, CDate
FROM EC_ORDER eo 
WHERE CSel IN ('현금입금', '계좌이체')
ORDER BY 3, 5;

-- 상품관리 테이블에서 'HP' 회사의 '프린터' 제품에 대한 [상품코드, 상품명, 단위, 단가, 재고수량]을 단가순으로 출력
SELECT Product_Code, Product_Name, Unit, Unit_Price, Left_Qty
FROM EC_PRODUCT ep 
WHERE Company IN 'HP' and Product_Name IN '프린터'
ORDER BY 4;

-- 상품관리 테이블에서 생산처가 '삼성'과 'LG전자'가 아닌 상품의 [상품코드, 상품명, 단위, 단가, 재고수량, 생산처]를 생산처, 단가순으로 출력
SELECT Product_Code, Product_Name, Unit, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Company NOT IN ('SAMSUNG', 'Samsung','samsung', 'LG전자')
ORDER BY 6,4;

-- 회원관리 테이블에서 주소가 '서울'과 '대구'가 아닌 회원의 [회원명, 주민등록번호, 전화번호, 주소]를 주소순으로 출력
SELECT Name, Regist_No, Telephone, Address
FROM EC_MEMBER em 
WHERE Address NOT LIKE '서울%' AND Address NOT LIKE '대구%'
ORDER BY 4;

-- 상품관리 테이블에서 재고수량이 10 미만인 상품의 [상품코드, 상품명, 규격, 단가, 재고수량, 생산처]를 상품명순으로 출력
SELECT Product_Code, Product_Name, Standard, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Left_Qty < 10
ORDER BY Product_Name;

-- 회원관리 테이블에서 전화번호가 '666'이 포함된 회원의 [회원명, 주민등록번호, 전화번호, 주소]를 회원명순으로 출력
SELECT Name, Regist_No, Telephone, Address
FROM EC_MEMBER em 
WHERE Telephone LIKE '%666%'
ORDER BY 1;

-- 회원관리 테이블에서 2018년 5월 1일 이후에 가입한 회원의 [회원명, 주민등록번호, 전화번호, 주소, 가입일자]]를 회원 가입일자순으로 출력
SELECT Name, Regist_No, Telephone, Address, TIMESTAMP
FROM EC_MEMBER em 
WHERE TimeStamp > '2018-05-01'
ORDER BY 5;

-- 상품관리 테이블에서 상품명이 '노트'로 시작하는 상품의 [상품코드, 상품명, 단위, 단가, 재고수량, 생산처]를 생산처순으로 출력
SELECT Product_Code, Product_Name, Unit, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Product_Name LIKE '노트%'
ORDER BY 6;

-- 상품관리 테이블에서 'LG'로 시작하는 생산처의 상품이 80만원을 초과하는 [상품코드, 상품명, 단위, 단가, 재고수량, 생산처]를 상품코드순으로 출력
SELECT Product_Code, Product_Name, Unit, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Company LIKE 'LG%' AND Unit_Price > 800000
ORDER BY 1;

-- 상품관리 테이블에서 생산처가 입력되지 않은 행의 [상품코드, 상품명, 단위, 단가, 재고수량, 생산처]를 상품코드순으로 출력
SELECT Product_Code, Product_Name, Unit, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Company IS NULL 
ORDER BY 1;

-- 주문처리 테이블에서 상품코드가 'CM01'을 1개 초과 주문한 행의 [주문번호, 주문자ID, 상품코드, 주문수량, 결제금액]을 주문자ID순으로 출력
SELECT Order_No, Order_ID, Product_Code, Order_Qty, CMoney
FROM EC_ORDER eo 
WHERE Product_Code LIKE 'CM01' AND Order_Qty > 1
ORDER BY 1;

-- 회원관리 테이블에서 회원명이 '고'씨부터 '최'씨를 제외한 회원의 [회원명, 주민등록번호, 전화번호, 주소]를 회원명순으로 출력
SELECT Name, Regist_No, Telephone, Address
FROM EC_MEMBER em 
WHERE Name NOT like '고%' AND Name NOT LIKE '최%'
ORDER BY 1;

-- 수강 테이블에서 수강과목코드가 'L1011'과 'L1021' 과목의 학점을 취득한 학생의 [과목코드, 학번, 성적, 성적취득일자]를 과목코드, 학번순으로 출력
SELECT Course_ID, Student_ID, Score, Score_Assigned 
FROM SG_SCORES ss 
WHERE Course_ID IN ('L1011', 'L1021')
ORDER BY 1, 2;

-- 수강 테이블에서 성적이 80점 이상이 아닌 행의 [과목코드, 학번, 성적, 성적취득일자]를 출력
SELECT Course_ID, Student_ID, Score, Score_Assigned 
FROM SG_SCORES ss 
WHERE Score < 80;

-- 학생 테이블에서 학과코드가 '컴공'과 '경영'학과가 아닌 학생의 [학과코드, 학년, 학번, 성명, 전화번호]를 학과코드, 학번순으로 출력
SELECT Dept_ID, YEAR, Student_ID, Name, Telephone
FROM STUDENT s 
WHERE Dept_ID NOT IN ('컴공', '경영')
ORDER BY 1, 3;

