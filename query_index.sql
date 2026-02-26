-- 주문

-- 주문상세

-- 결제 -> 결제날짜, 결제상태, 결제수단

CREATE TABLE 결제 
    ( 
     결제ID     INTEGER  NOT NULL , 
     주문ID     INTEGER  NOT NULL , 
     결제상태     VARCHAR (20)  NOT NULL , 
     결제날짜     DATE  NOT NULL , 
     결제수단     VARCHAR (20)  NOT NULL , 
     총상품금액    INTEGER  NOT NULL , 
     배송비      INTEGER  NOT NULL , 
     사용가능쿠폰ID NUMERIC(10,2) , 
     적용쿠폰할인율  NUMERIC(10,2) , 
     적용쿠폰할인금액 NUMERIC(10,2) 
    ) 
;

-- 배송 
