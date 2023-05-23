/**********************************************************
*  연습문제용 테이블 삭제
***********************************************************/
DROP TABLE EC_Order	purge;
DROP TABLE EC_Basket	purge;
DROP TABLE EC_Member	purge;
DROP TABLE EC_Product	purge;

/**********************************************************
*  EC_Product 테이블 생성
***********************************************************/
CREATE TABLE EC_Product (
Product_Code    VARCHAR2(10),
Product_Name    VARCHAR2(20)  NOT NULL,
Standard        VARCHAR2(20),
Unit            VARCHAR2(10),
Unit_Price      NUMBER(7)     NOT NULL,
Left_Qty        NUMBER(5),
Company         VARCHAR2(20),
ImageName       VARCHAR2(20),
Info            VARCHAR2(80),
Detail_Info     VARCHAR2(255),
CONSTRAINT      EC_Product_pk PRIMARY KEY (Product_Code));

/**********************************************************
*  EC_Member 테이블 생성
***********************************************************/
CREATE TABLE EC_Member (
UserID         VARCHAR2(10)  CONSTRAINT EC_Member_ck
               CHECK (UserID BETWEEN 'a' AND 'z'),
Passwd         VARCHAR2(10)  NOT NULL,
Name           VARCHAR2(10)  NOT NULL,
Regist_No      VARCHAR2(14)  NOT NULL CONSTRAINT EC_Member_uk UNIQUE,
Email          VARCHAR2(20),
Telephone      VARCHAR2(13)  NOT NULL,
Address        VARCHAR2(40),
BuyCash        NUMBER(9)     DEFAULT  0,
Timestamp      DATE          DEFAULT  SYSDATE,
CONSTRAINT     EC_Member_pk  PRIMARY KEY (UserID) );

/**********************************************************
*  EC_Basket 테이블 생성
***********************************************************/
CREATE TABLE EC_Basket (
Order_No      VARCHAR2(10),
Order_ID      VARCHAR2(10)   NOT NULL,
Product_Code  VARCHAR2(10)   NOT NULL,
Order_Qty     NUMBER(3)      NOT NULL,
Order_date    Date           Default    SYSDATE,
CONSTRAINT    EC_Basket_pk   PRIMARY KEY (Order_NO),
CONSTRAINT    EC_Basket_fk1  FOREIGN KEY (Order_ID)
                             REFERENCES   EC_Member,
CONSTRAINT    EC_Basket_fk2  FOREIGN KEY (Product_Code)
                             REFERENCES   EC_Product);

/**********************************************************
*  EC_Order 테이블 생성
***********************************************************/
CREATE TABLE EC_Order (
Order_No      VARCHAR2(10),
Order_ID      VARCHAR2(10)   NOT NULL,
Product_Code  VARCHAR2(10)   NOT NULL,
Order_Qty     NUMBER(3)      NOT NULL,
CSel          VARCHAR2(10),
CMoney        NUMBER(9),
CDate         DATE,
MDate         DATE,
Gubun         VARCHAR2(10),
CONSTRAINT    EC_Order_pk    PRIMARY KEY (Order_NO) );

ALTER TABLE EC_ORDER 
MODIFY (Order_No VARCHAR2(20), Order_ID VARCHAR2(20), Product_Code VARCHAR2(20), CSel VARCHAR2(20));
/**********************************************************
*  테이블명 조회
***********************************************************/
SELECT * FROM USER_CATALOG;
-- 테이블명 모두 출
SELECT * 
FROM TAB;

-- 장바구니 테이블의 구조 출력

-- 상품관리 테이블의 상세소개 칼럼을 삭제
ALTER TABLE EC_PRODUCT 
DROP COLUMN Detail_Info;

-- 상품관리 테이블의 상품정보 칼럼을 40자로 줄이시오
ALTER TABLE EC_PRODUCT 
MODIFY (Info VARCHAR2(40));

-- 주문처리 테이블의 구분 칼럼을 20자로 늘리시오
ALTER TABLE EC_ORDER 
MODIFY (Gubun VARCHAR2(20));

-- 주문처리 테이블의 상품코드 칼럼을 상품관리 테이블을 참조하여 외부 키를 추가하시오
ALTER TABLE EC_ORDER 
ADD CONSTRAINT ProdCode_fk FOREIGN KEY(Product_Code)
REFERENCES EC_Product;

-- 주문처리 테이블에 지정된 제약조건 조회
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EC_Order';

-- 주문처리 테이블에 지정한 제약조건명, 칼럼명, 복합칼럼명 유무 조회
SELECT CONSTRAINT_NAME, COLUMN_NAME, POSITION 
FROM USER_CONS_COLuMNS
WHERE TABle_Name = 'EC_Order';

