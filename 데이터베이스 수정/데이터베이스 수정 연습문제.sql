-- 상품관리 테이블에 아래 표를 참고하여 새로운 상품 추가
-- 상품코드			상품명			규격					단가			재고수량			생산처			이미지
-- SP01				아이폰			IPHONE8+64G			816,000		10				APPLE			sp01.jpg	
-- SP02				갤럭시노트			NOTE8+256G			829,000		15				SAMSUNG			sp02.jpg
-- SP03				G7 ThinQ		G7+128G				822,000		10				LG전자			sp03.jpg
INSERT INTO EC_PRODUCT ep 
(PRODUCT_CODE, PRODUCT_NAME, STANDARD, UNIT_PRICE, LEFT_QTY, COMPANY, IMAGENAME)
VALUES
('SP01', '아이폰', 'IPHONE8+64G', 816000, 10, 'APPLE', 'sp01.jpg');

INSERT INTO EC_PRODUCT ep 
(PRODUCT_CODE, PRODUCT_NAME, STANDARD, UNIT_PRICE, LEFT_QTY, COMPANY, IMAGENAME)
VALUES
('SP02', '갤럭시노트', 'NOTE8+256G', 829000, 15, 'SAMSUNG', 'sp02.jpg');

INSERT INTO EC_PRODUCT ep 
(PRODUCT_CODE, PRODUCT_NAME, STANDARD, UNIT_PRICE, LEFT_QTY, COMPANY, IMAGENAME)
VALUES
('SP03', 'G7 ThinQ', 'G7+128G', 822000, 10, 'LG전자', 'sp03.jpg');

SELECT  PRODUCT_CODE, PRODUCT_NAME, STANDARD, UNIT_PRICE, LEFT_QTY, COMPANY, IMAGENAME
FROM EC_PRODUCT ep;

-- 주문처리 테이블에 배달일자와 구분 칼럼 값을 아래 표를 참고하여 수정하고,
-- 2018년 5월 10일의 배달 내역을 출력
-- 주문번호		주문자ID		배달상품코드		배달수량		배달일자			구분
-- 180505002	kcchoi		DK01			1개			2018/05/10 		배달
-- 180505003    kcchoi		CH01			1개			2018/05/10		배달

SELECT ORDER_NO, ORDER_ID, PRODUCT_CODE, ORDER_QTY, MDATE, GUBUN 
FROM EC_ORDER eo;

UPDATE EC_ORDER 
SET MDATE = '2018/05/10', Gubun = '배달'
WHERE Order_No = '180505002';

UPDATE EC_ORDER 
SET MDATE = '2018/05/10', Gubun = '배달'
WHERE Order_No = '180505003';

-- 주문처리 테이블에 금일(2018/07/12) 입금된 내역이다.
-- 주문금액과 결제 금액이 동일한 경우 아래 표를 참고하여 [결제방법, 결제일자, 구분]의 결제항목을 입력
-- 주문번호		주문자ID		주문금액			결제방법		결제일자			구분
-- 180707001 	jupark		3,735,000		신용카드		2018/07/12		결제
-- 180707002	jupark		4,300,000		신용카드		2018/07/12		결제
-- 180707003 	cscho		  747,000		신용카드		2018/07/12		결제
SELECT ORDER_NO, ORDER_ID, CMONEY, CSEL, CDATE, GUBUN
FROM EC_ORDER eo;

UPDATE EC_ORDER 
SET CSEL = '신용카드', CDate = '2018/07/12', Gubun = '결제'
WHERE ORDER_NO = '180707001';

UPDATE EC_ORDER 
SET CSEL = '신용카드', CDate = '2018/07/12', Gubun = '결제'
WHERE ORDER_NO = '180707002';

UPDATE EC_ORDER 
SET CSEL = '신용카드', CDate = '2018/07/12', Gubun = '결제'
WHERE ORDER_NO = '180707003';

-- 주문처리 테이블로부터 금일(2018년 7월 12일) 결제한 [주문번호, 상품코드, 주문수량, 결제금액, 결제방법, 결제일자]를 주문번호순으로 출력
SELECT ORDER_NO, Product_Code, ORDER_Qty, CMoney, CSel, CDATE
FROM EC_ORDER eo 
WHERE CDate = '2018/07/12'
ORDER BY Order_No;

-- 회원관리 테이블의 구매실적 칼럼이 NULL인 행을 0으로 수정
SELECT * FROM EC_Member;

UPDATE EC_MEMBER 
SET BUYCASH = 0;



--
