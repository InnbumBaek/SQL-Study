-- 상품관리 테이블에서 단가가 100만원을 초과하는 상품 목록의 [상품코드, 상품명, 단가]를 출력
SELECT Product_Code, Product_Name, Unit, Unit_Price
FROM EC_PRODUCT ep 
WHERE Unit_Price > 1000000;

-- 회원관리 테이블로부터 서울에서 거주하는 회원의 [사용자아이디, 회원명, 주민등록번호, 주소]를 출력
SELECT UserId, Name, Regist_No, Address
FROM EC_MEMBER em 
WHERE address LIKE '서울특별시 %구';

-- 장바구니 테이블에서 2018년 07월 11일에 주문한 고객과 주문 내용 출력
SELECT *
FROM EC_Basket

-- 주문처리 테이블에서 결제한 회원 중에서 상품을 배달하지 않은 회원의 [주문번호, 상품코드, 주문수량, 결제방법, 결제금액, 결제일자, 구분]을 주문번호순으로 출력
SELECT Order_No, Product_Code, Order_Qty, CSel, CMoney, CDate, Gubun
FROM EC_ORDER eo 
WHERE (Gubun = '결제')
ORDER BY Order_No;

-- 회원관리 테이블에서 회원명에 '우'자가 들어간 회원의 [회원ID, 회원명, 주민등록번호]를 출력
SELECT UserID, Name, Regist_No
FROM EC_MEMBER em 
WHERE Name IN '우';

-- 주문처리 테이블에서 배달한 주문자 중에서 '신용카드'로 결제하지 않은 주문자의 [주문번호, 주문자ID, 상품코드, 결제방법, 구분]을 주문자ID순으로 출력
SELECT Order_No, ORDER_ID, Product_Code, CSel, Gubun
FROM EC_ORDER eo 
WHERE Gubun LIKE '배달' AND CSel NOT LIKE '신용카드'
ORDER BY Order_ID;

-- 상품관리 테이블에서 상품의 단가가 30만원에서 50만원 이내의 상품 목록의 [상품코드, 상품명, 단가, 재고수량, 생산처]를 단가 내림차순으로 정렬
SELECT Product_Code, Product_Name, Unit_Price, Left_Qty, Company
FROM EC_PRODUCT ep 
WHERE Unit_Price BETWEEN '300000' AND '500000'
ORDER BY 3 DESC;

-- 주문처리 테이블에서 '신용카드'로 결제한 행의 [주문번호, 주문자ID, 결제금액, 결제일자, 결제방법]을 출력
SELECT Order_No, Order_ID, CMoney, CDate, CSel
FROM EC_ORDER eo 
WHERE CSel LIKE '신용카드';

-- 주문처리 테이블에서 결제하지 않은 행의 [주문번호, 주문자ID, 상품코드, 주문수량, 결제할 금액, 구분]을 출력
SELECT Order_No, Order_ID, Product_Code, Order_Qty, CMoney, Gubun
FROM EC_ORDER eo 
WHERE Gubun IS NULL;

-- 주문처리 테이블에서 'usko' 회원이 거래한 상품의 [주문자ID, 상품코드, 주문수량, 결제방법, 결제금액, 구분]을 출력
SELECT Order_ID, Product_Code, Order_Qty, CSel, CMoney, Gubun
FROM EC_ORDER eo 
WHERE Order_ID LIKE 'usko';



