CREATE TABLE 개인문의 
    ( 
     문의ID    INTEGER  NOT NULL , 
     회원ID    INTEGER , 
     문의제목    VARCHAR (200)  NOT NULL , 
     작성일     DATE  NOT NULL , 
     문의내용    VARCHAR (500) , 
     답변상태    VARCHAR (15)  NOT NULL , 
     관리자ID   INTEGER , 
     관리자답변내용 VARCHAR (600) 
    ) 
;

ALTER TABLE 개인문의 
    ADD CONSTRAINT "개인문의_PK" PRIMARY KEY ( 문의ID ) ;

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

ALTER TABLE 결제 
    ADD CONSTRAINT 결제_PK PRIMARY KEY ( 결제ID ) ;

ALTER TABLE 결제 
    ADD CONSTRAINT 결제__UN UNIQUE ( 주문ID ) ;

CREATE TABLE 관리자 
    ( 
     관리자ID   INTEGER  NOT NULL , 
     관리자이름   VARCHAR (20)  NOT NULL , 
     이메일     VARCHAR (100)  NOT NULL , 
     비밀번호    VARCHAR (50)  NOT NULL , 
     권한      VARCHAR (100)  NOT NULL , 
     계정생성일   DATE  NOT NULL , 
     계정상태    VARCHAR (20)  NOT NULL , 
     최근로그인시간 DATE  NOT NULL 
    ) 
;

ALTER TABLE 관리자 
    ADD CONSTRAINT 관리자_PK PRIMARY KEY ( 관리자ID ) ;

CREATE TABLE 리뷰 
    ( 
     리뷰ID   INTEGER  NOT NULL , 
     상품ID   INTEGER , 
     회원ID   INTEGER , 
     별점     INTEGER  NOT NULL , 
     리뷰내용   VARCHAR (500)  NOT NULL , 
     작성날짜   DATE  NOT NULL , 
     리뷰삭제여부 CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE 리뷰 
    ADD CONSTRAINT 리뷰_PK PRIMARY KEY ( 리뷰ID ) ;

CREATE TABLE 배송 
    ( 
     배송ID   INTEGER  NOT NULL , 
     주문ID   INTEGER  NOT NULL , 
     송장번호   VARCHAR (15)  NOT NULL , 
     택배사명   VARCHAR (20)  NOT NULL , 
     우편번호   VARCHAR (5)  NOT NULL , 
     배송주소   VARCHAR (200)  NOT NULL , 
     배송상세주소 VARCHAR (100)  NOT NULL , 
     수취인명   VARCHAR (20)  NOT NULL , 
     수취인연락처 VARCHAR (13)  NOT NULL , 
     배송메모   VARCHAR (200) 
    ) 
;

ALTER TABLE 배송 
    ADD CONSTRAINT delivery_PK PRIMARY KEY ( 배송ID ) ;

ALTER TABLE 배송 
    ADD CONSTRAINT 배송_주문ID_UNIQUE UNIQUE ( 주문ID ) ;

CREATE TABLE 상품 
    ( 
     상품ID    INTEGER  NOT NULL , 
     상품분류    VARCHAR (100)  NOT NULL , 
     상품명     VARCHAR (200)  NOT NULL , 
     원가      INTEGER  NOT NULL , 
     할인율     NUMERIC(10,2)  NOT NULL , 
     상품설명    VARCHAR (800)  NOT NULL , 
     원산지     VARCHAR (30)  NOT NULL , 
     구매혜택포인트 INTEGER  NOT NULL , 
     배송방법    VARCHAR (30)  NOT NULL , 
     배송비     INTEGER  NOT NULL 
    ) 
;

ALTER TABLE 상품 
    ADD CONSTRAINT 상품_PK PRIMARY KEY ( 상품ID ) ;

CREATE TABLE 상품문의 
    ( 
     상품문의ID  INTEGER  NOT NULL , 
     상품ID    INTEGER , 
     회원ID    INTEGER , 
     제목      VARCHAR (200)  NOT NULL , 
     공개여부    CHAR (1)  NOT NULL , 
     문의내용    VARCHAR (500) , 
     답변상태    VARCHAR (15)  NOT NULL , 
     관리자ID   NUMERIC(10,2) , 
     관리자답변내용 VARCHAR (500) 
    ) 
;

ALTER TABLE 상품문의 
    ADD CONSTRAINT 상품문의_PK PRIMARY KEY ( 상품문의ID ) ;

CREATE TABLE 이벤트 
    ( 
     이벤트ID  INTEGER  NOT NULL , 
     관리자ID  INTEGER  NOT NULL , 
     이벤트명   VARCHAR (200)  NOT NULL , 
     이벤트시작일 DATE  NOT NULL , 
     이벤트종료일 DATE  NOT NULL , 
     이벤트내용  VARCHAR (500)  NOT NULL 
    ) 
;

ALTER TABLE 이벤트 
    ADD CONSTRAINT 이벤트_PK PRIMARY KEY ( 이벤트ID ) ;

CREATE TABLE 장바구니 
    ( 
     장바구니ID INTEGER  NOT NULL , 
     회원ID   INTEGER , 
     상품ID   INTEGER , 
     상품수량   INTEGER  NOT NULL , 
     추가날짜   DATE  NOT NULL 
    ) 
;

ALTER TABLE 장바구니 
    ADD CONSTRAINT 장바구니_PK PRIMARY KEY ( 장바구니ID ) ;

CREATE TABLE 재고 
    ( 
     상품ID   INTEGER  NOT NULL , 
     잔여수량   INTEGER  NOT NULL , 
     마지막입고일 DATE  NOT NULL , 
     입고예상일  DATE  NOT NULL 
    ) 
;

ALTER TABLE 재고 
    ADD CONSTRAINT 재고_PK PRIMARY KEY ( 상품ID ) ;

CREATE TABLE 주문 
    ( 
     주문ID  INTEGER  NOT NULL , 
     회원ID  INTEGER , 
     결제ID  INTEGER  NOT NULL , 
     주문상태  VARCHAR (15)  NOT NULL , 
     사용포인트 INTEGER  NOT NULL , 
     주문날짜  DATE  NOT NULL 
    ) 
;

COMMENT ON COLUMN 주문.주문상태 IS '주문완료/주문취소/환불?' 
;

ALTER TABLE 주문 
    ADD CONSTRAINT 주문_PK PRIMARY KEY ( 주문ID ) ;

CREATE TABLE 주문상세 
    ( 
     주문상세ID  INTEGER  NOT NULL , 
     상품ID    INTEGER  NOT NULL , 
     주문ID    INTEGER  NOT NULL , 
     주문수량    INTEGER  NOT NULL , 
     쇼핑백선택여부 CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE 주문상세 
    ADD CONSTRAINT order_detail_PK PRIMARY KEY ( 주문상세ID, 상품ID ) ;

CREATE TABLE 최근본상품 
    ( 
     최근본상품ID INTEGER  NOT NULL , 
     회원ID    INTEGER , 
     상품ID    INTEGER , 
     조회일자    DATE  NOT NULL 
    ) 
;

ALTER TABLE 최근본상품 
    ADD CONSTRAINT "최근 본 상품_PK" PRIMARY KEY ( 최근본상품ID ) ;

CREATE TABLE 쿠폰 
    ( 
     쿠폰ID  INTEGER  NOT NULL , 
     관리자ID INTEGER  NOT NULL , 
     쿠폰이름  VARCHAR (100)  NOT NULL , 
     시작날짜  DATE  NOT NULL , 
     만료날짜  DATE  NOT NULL , 
     할인율   NUMERIC(10,2) , 
     할인금액  NUMERIC(10,2) 
    ) 
;

ALTER TABLE 쿠폰 
    ADD CONSTRAINT 쿠폰_PK PRIMARY KEY ( 쿠폰ID ) ;

CREATE TABLE 쿠폰이력 
    ( 
     쿠폰이력ID INTEGER  NOT NULL , 
     쿠폰ID   INTEGER , 
     회원ID   INTEGER , 
     사용여부   CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE 쿠폰이력 
    ADD CONSTRAINT 쿠폰이력_PK PRIMARY KEY ( 쿠폰이력ID ) ;

CREATE TABLE 포인트 
    ( 
     포인트ID INTEGER  NOT NULL , 
     회원ID  INTEGER , 
     주문ID  INTEGER  NOT NULL , 
     변동포인트 INTEGER  NOT NULL , 
     변동날짜  DATE  NOT NULL , 
     변동사유  VARCHAR (10)  NOT NULL 
    ) 
;

ALTER TABLE 포인트 
    ADD CONSTRAINT 포인트_PK PRIMARY KEY ( 포인트ID ) ;

CREATE TABLE 회원 
    ( 
     회원ID INTEGER  NOT NULL , 
     회원명  VARCHAR (30)  NOT NULL , 
     전화번호 VARCHAR (13)  NOT NULL , 
     주소   VARCHAR (400)  NOT NULL , 
     상세주소 VARCHAR (200)  NOT NULL , 
     회원등급 VARCHAR (20)  NOT NULL , 
     포인트  INTEGER  NOT NULL , 
     이메일  VARCHAR (200)  NOT NULL , 
     비밀번호 VARCHAR (100)  NOT NULL , 
     생년월일 DATE , 
     성별   CHAR (1) , 
     탈퇴여부 CHAR (1) , 
     탈퇴날짜 DATE 
    ) 
;

ALTER TABLE 회원 
    ADD CONSTRAINT 회원_PK PRIMARY KEY ( 회원ID ) ;

ALTER TABLE 회원 
    ADD CONSTRAINT 회원__UN UNIQUE ( 전화번호 , 이메일 , 비밀번호 ) ;

ALTER TABLE 개인문의 
    ADD CONSTRAINT "1:1문의_회원_FK" FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;

ALTER TABLE 결제 
    ADD CONSTRAINT 결제_주문_FK FOREIGN KEY 
    ( 
     주문ID
    ) 
    REFERENCES 주문 
    ( 
     주문ID
    ) 
;

ALTER TABLE 리뷰 
    ADD CONSTRAINT 리뷰_상품_FK FOREIGN KEY 
    ( 
     상품ID
    ) 
    REFERENCES 상품 
    ( 
     상품ID
    ) 
;

ALTER TABLE 리뷰 
    ADD CONSTRAINT 리뷰_회원_FK FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;

ALTER TABLE 배송 
    ADD CONSTRAINT 배송_주문_FK FOREIGN KEY 
    ( 
     주문ID
    ) 
    REFERENCES 주문 
    ( 
     주문ID
    ) 
;

ALTER TABLE 상품문의 
    ADD CONSTRAINT 상품문의_상품_FK FOREIGN KEY 
    ( 
     상품ID
    ) 
    REFERENCES 상품 
    ( 
     상품ID
    ) 
;

ALTER TABLE 상품문의 
    ADD CONSTRAINT 상품문의_회원_FK FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;

ALTER TABLE 이벤트 
    ADD CONSTRAINT 이벤트_관리자_FK FOREIGN KEY 
    ( 
     관리자ID
    ) 
    REFERENCES 관리자 
    ( 
     관리자ID
    ) 
;

ALTER TABLE 장바구니 
    ADD CONSTRAINT 장바구니_상품_FK FOREIGN KEY 
    ( 
     상품ID
    ) 
    REFERENCES 상품 
    ( 
     상품ID
    ) 
;

ALTER TABLE 장바구니 
    ADD CONSTRAINT 장바구니_회원_FK FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;

ALTER TABLE 재고 
    ADD CONSTRAINT 재고_상품_FK FOREIGN KEY 
    ( 
     상품ID
    ) 
    REFERENCES 상품 
    ( 
     상품ID
    ) 
;

ALTER TABLE 주문 
    ADD CONSTRAINT 주문_회원_FK FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;

ALTER TABLE 주문상세 
    ADD CONSTRAINT 주문상세_주문_FK FOREIGN KEY 
    ( 
     주문ID
    ) 
    REFERENCES 주문 
    ( 
     주문ID
    ) 
;

ALTER TABLE 최근본상품 
    ADD CONSTRAINT "최근 본 상품_상품_FK" FOREIGN KEY 
    ( 
     상품ID
    ) 
    REFERENCES 상품 
    ( 
     상품ID
    ) 
;

ALTER TABLE 쿠폰 
    ADD CONSTRAINT 쿠폰_관리자_FK FOREIGN KEY 
    ( 
     관리자ID
    ) 
    REFERENCES 관리자 
    ( 
     관리자ID
    ) 
;

ALTER TABLE 쿠폰이력 
    ADD CONSTRAINT 쿠폰이력_쿠폰_FK FOREIGN KEY 
    ( 
     쿠폰ID
    ) 
    REFERENCES 쿠폰 
    ( 
     쿠폰ID
    ) 
;

ALTER TABLE 쿠폰이력 
    ADD CONSTRAINT 쿠폰이력_회원_FK FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;

ALTER TABLE 포인트 
    ADD CONSTRAINT 포인트_회원_FK FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;

ALTER TABLE 최근본상품 
    ADD CONSTRAINT 회원_최근본상품1N FOREIGN KEY 
    ( 
     회원ID
    ) 
    REFERENCES 회원 
    ( 
     회원ID
    ) 
;



ALTER TABLE 쿠폰
ADD CONSTRAINT ck_coupon_discount
CHECK (
    (할인율 IS NOT NULL AND 할인금액 IS NULL)
 OR (할인율 IS NULL AND 할인금액 IS NOT NULL)
);

ALTER TABLE 쿠폰이력
ADD CONSTRAINT uq_coupon_member UNIQUE (쿠폰ID, 회원ID);
