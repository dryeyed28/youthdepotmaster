/* 리워드 댓글 */
DROP TABLE R_COMMENT 
	CASCADE CONSTRAINTS;

/* 리워드결제 */
DROP TABLE REWARD_PAY 
	CASCADE CONSTRAINTS;

/* 회원 */
DROP TABLE MEMBERS 
	CASCADE CONSTRAINTS;

/* 리워드 스토리 */
DROP TABLE R_STORY 
	CASCADE CONSTRAINTS;

/* 리워드 게시물 */
DROP TABLE R_POST 
	CASCADE CONSTRAINTS;

/* 게시물 */
DROP TABLE POST 
	CASCADE CONSTRAINTS;

/* 리워드프로젝트 */
DROP TABLE R_PROJECT 
	CASCADE CONSTRAINTS;

/* 리워드 기본정보 */
DROP TABLE R_META 
	CASCADE CONSTRAINTS;

/* 리워드 창고지기 */
DROP TABLE R_KEEPER 
	CASCADE CONSTRAINTS;

/* 리워드 옵션 */
DROP TABLE R_OPTION 
	CASCADE CONSTRAINTS;

/* 열정(예치금) */
DROP TABLE DEPOSIT 
	CASCADE CONSTRAINTS;

/* 게시판 */
DROP TABLE BOARD 
	CASCADE CONSTRAINTS;

/* 관리자 */
DROP TABLE ADMIN 
	CASCADE CONSTRAINTS;

/* 리워드 댓글 */
CREATE TABLE R_COMMENT (
	RCMT_ID NUMBER(10) NOT NULL, /* 글번호 */
	RCMT_PARENT VARCHAR2(100) NOT NULL, /* 부모글번호 */
	RPJT_ID NUMBER(10) NOT NULL, /* 리워드번호 */
	RCMT_USERID VARCHAR2(50) NOT NULL, /* 유저아이디 */
	RCMT_CONTENT VARCHAR2(600), /* 댓글내용 */
	RCMT_UPDATED_DATETIME DATE, /* 최종수정시간 */
	RCMT_NICKNAME VARCHAR2(50), /* 작성자닉네임 */
	RCMT_DEL NUMBER(10) /* 게시물삭제여부 */
);

/* 리워드결제 */
CREATE TABLE REWARD_PAY (
	RPAY_ID NUMBER(10) NOT NULL, /* PAY_PK */
	MEM_ID NUMBER(10), /* MEM_ID */
    MEM_NAME VARCHAR2(20), /*주문자 이름*/
	RPJT_ID NUMBER(10), /* 리워드번호 */
    RPRODUCT_ID NUMBER(10), /* 아이템번호 */
	RPRODUCT_EA NUMBER(10), /* 수량 */
	RADDPAY NUMBER(10), /* 추가후원금 */
	RPAY_ADDRESS VARCHAR2(50), /* 배송지 */
	RPAY_PHONE VARCHAR2(20), /* 휴대폰번호 */
	RPAY_REQUEST VARCHAR2(50), /* 배송요청사항 */
	RPAY_TOTAL NUMBER(10) /* 총금액 */
);

ALTER TABLE REWARD_PAY
	ADD
		CONSTRAINT REWARD_PAY
		PRIMARY KEY (
			RPAY_ID
		);

/* 회원 */
CREATE TABLE MEMBERS (
	MEM_ID NUMBER(10) NOT NULL, /* MEM_ID */
	MEM_USERID VARCHAR2(50) NOT NULL, /* 회원아이디 */
	MEM_EMAIL VARCHAR2(50) NOT NULL, /* 회원이메일 */
	MEM_PASSWORD VARCHAR2(20) NOT NULL, /* 회원패스워드 */
	MEM_USERNAME VARCHAR2(10) NOT NULL, /* 회원실명 */
	MEM_NICKNAME VARCHAR2(50) NOT NULL, /* 회원닉네임 */
	MEM_PHONE VARCHAR2(15), /* 연락처 */
	MEM_SEX NUMBER(10) NOT NULL, /* 성별 */
	MEM_REGISTER_DATETIME DATE, /* 회원등록일 */
	MEM_LASTLOGIN_DATETIME DATE, /* 최종로그인시간 */
	MEM_TREASURER NUMBER(10), /* 창고지기여부 */
	MEM_PASSION NUMBER(10) /* 보유열정 */
);

ALTER TABLE MEMBERS
	ADD
		CONSTRAINT MEMBER
		PRIMARY KEY (
			MEM_ID
		);

/* 리워드 스토리 */
CREATE TABLE R_STORY (
	RPJT_ID NUMBER(10) NOT NULL, /* 리워드번호 */
	RPJT_URL VARCHAR2(100), /* 영상url */
	RPJT_PRICE VARCHAR2(20), /* 금액 */
	RPJT_THUMBNAIL VARCHAR2(50), /* 썸네일이미지 */
	RPJT_STORY CLOB, /* 프로젝트스토리 */
	RPJT_TAG VARCHAR2(50), /* 검색용태그 */
	RPJT_PAPER CLOB /* 교환/환불/as정책 */
);

ALTER TABLE R_STORY
	ADD
		CONSTRAINT R_STORY
		PRIMARY KEY (
			RPJT_ID
		);

/* 리워드 게시물 */
CREATE TABLE R_POST (
	RPJT_ID NUMBER(10) NOT NULL, /* 리워드번호 */
    RPOST_TITLE VARCHAR2(100), /* 게시글제목 */
	RPOST_CONTENT CLOB, /* 게시글제목 */
	RPOST_USERID VARCHAR2(50), /* 작성자회원아이디 */
	RPOST_DATETIME DATE /* 게시물작성일자 */
);

ALTER TABLE R_POST
	ADD
		CONSTRAINT R_POST
		PRIMARY KEY (
			RPJT_ID
		);

/* 게시물 */
CREATE TABLE POST (
	POST_ID NUMBER(10) NOT NULL, /* POST_ID */
	BRD_ID NUMBER(10) NOT NULL, /* BRD_ID */
	MEM_ID NUMBER(10), /* MEM_ID */
	ADMIN_ID VARCHAR2(20), /* ADMIN_ID */
	MEM_NICKNAME VARCHAR2(20), /* 작성자닉네임 */
	POST_TITLE VARCHAR2(50), /* 게시글제목 */
	POST_CONTENT CLOB, /* 게시글본문내용 */
	POST_DATETIME DATE, /* 게시물작성일자 */
	POST_VIEW_COUNT NUMBER(10), /* 조회수 */
	POST_DEL NUMBER(10), /* 게시글삭제여부 */
	POST_FILE VARCHAR2(100) /* 게시글첨부파일 */
);

ALTER TABLE POST
	ADD
		CONSTRAINT POST
		PRIMARY KEY (
			POST_ID,
			BRD_ID
		);

/* 리워드프로젝트 */
CREATE TABLE R_PROJECT (
	RPJT_ID NUMBER(10) NOT NULL, /* 리워드번호 */
	MEM_ID NUMBER(10), /* MEM_ID */
	RPJT_STATE NUMBER(10), /* 프로젝트상태 */
	RPJT_PROGRESS NUMBER(10), /* (진행중/마감) */
	RPJT_SUBMISSION DATE /* 제출일 */
);

ALTER TABLE R_PROJECT
	ADD
		CONSTRAINT R_PROJECT
		PRIMARY KEY (
			RPJT_ID
		);

/* 리워드 기본정보 */
CREATE TABLE R_META (
	RPJT_ID NUMBER(10) NOT NULL, /* 리워드번호 */
	RPJT_TITLE VARCHAR2(50), /* 프로젝트제목 */
	RPJT_SUBTITLE VARCHAR2(50), /* 프로젝트짧은제목 */
	RINVESTING_AMOUNT NUMBER(10), /* 투자금액 */
	RTARGET_AMOUNT NUMBER(10), /* 목표금액 */
	RPJT_IMAGE VARCHAR2(50), /* 프로젝트대표이미지 */
	RPJT_CATEGORY VARCHAR2(20), /* 카테고리 */
	RPJT_PAPER VARCHAR2(50), /* 인증서류 */
	RPJT_STARTDAY DATE, /* 프로젝트시작일 */
	RPJT_ENDDAY DATE /* 프로젝트종료일 */
);

ALTER TABLE R_META
	ADD
		CONSTRAINT R_META
		PRIMARY KEY (
			RPJT_ID
		);

/* 리워드 창고지기 */
CREATE TABLE R_KEEPER (
	RPJT_ID NUMBER(10) NOT NULL, /* 리워드번호 */
	R_NAME VARCHAR2(50), /* 창고지기 이름 */
	R_PROFILE VARCHAR2(50), /* 창고지기 프로필 사진 */
	R_EMAIL VARCHAR2(100), /* 창고지기 email */
	R_URL VARCHAR2(100), /* 웹사이트 주소 */
	R_TEL NUMBER(20) /* 창고지기 전화번호 */
);

ALTER TABLE R_KEEPER
	ADD
		CONSTRAINT R_KEEPER
		PRIMARY KEY (
			RPJT_ID
		);

/* 리워드 옵션 */
CREATE TABLE R_OPTION (
	RPJT_ID NUMBER(10) NOT NULL, /* 리워드번호 */
	REWARD_ID NUMBER(10), /* 아이템번호 */
	RPJT_PRICE NUMBER(10), /* 금액 */
	RPJT_NAME VARCHAR2(50), /* 아이템이름 */
	RPJT_DETAIL CLOB, /* 상세설명 */
	RPJT_LIMIT NUMBER(10), /* 제한수량 */
	RPJT_SEND DATE, /* 발송시작일 */
	RPJT_CHARGE NUMBER(10) /* 배송비 */
);

ALTER TABLE R_OPTION
	ADD
		CONSTRAINT R_OPTION
		PRIMARY KEY (
			RPJT_ID
		);

/* 열정(예치금) */
CREATE TABLE DEPOSIT (
	DEP_ID NUMBER(10) NOT NULL, /* DEP_ID */
	MEM_ID NUMBER(10) NOT NULL, /* MEM_ID */
	DEP_TYPE NUMBER(10), /* 충전/환급/사용 */
	DEP_REQUEST NUMBER(10), /* 요청금액 */
	DEP_BALANCE NUMBER(10), /* 잔액 */
	DEP_DATE DATE /* 열정요청일시 */
);

ALTER TABLE DEPOSIT
	ADD
		CONSTRAINT DEPOSIT
		PRIMARY KEY (
			DEP_ID
		);

/* 게시판 */
CREATE TABLE BOARD (
	BRD_ID NUMBER(10) NOT NULL, /* BRD_ID */
	BRD_NAME VARCHAR2(20), /* 게시판명 */
    BRD_TYPE VARCHAR2(10) NOT NULL /* 게시판 분류 */
);

ALTER TABLE BOARD
	ADD
		CONSTRAINT BOARD
		PRIMARY KEY (
			BRD_ID
		);

/* 관리자 */
CREATE TABLE ADMIN (
	ADMIN_ID VARCHAR2(20) NOT NULL, /* ADMIN_ID */
	ADMIN_NAME VARCHAR2(20), /* 관리자이름 */
	ADMIN_PWD VARCHAR2(20) /* 관리자비번 */
);

ALTER TABLE ADMIN
	ADD
		CONSTRAINT PK_ADMIN
		PRIMARY KEY (
			ADMIN_ID
		);

ALTER TABLE R_COMMENT
	ADD
		CONSTRAINT FK_R_PROJECT_TO_R_COMMENT
		FOREIGN KEY (
			RPJT_ID
		)
		REFERENCES R_PROJECT (
			RPJT_ID
		);

ALTER TABLE R_STORY
	ADD
		CONSTRAINT FK_R_PROJECT_TO_R_STORY
		FOREIGN KEY (
			RPJT_ID
		)
		REFERENCES R_PROJECT (
			RPJT_ID
		);

ALTER TABLE R_POST
	ADD
		CONSTRAINT FK_R_PROJECT_TO_R_POST
		FOREIGN KEY (
			RPJT_ID
		)
		REFERENCES R_PROJECT (
			RPJT_ID
		);

ALTER TABLE POST
	ADD
		CONSTRAINT FK_MEBER_TO_POST
		FOREIGN KEY (
			MEM_ID
		)
		REFERENCES MEMBERS (
			MEM_ID
		);

ALTER TABLE POST
	ADD
		CONSTRAINT FK_BOARD_TO_POST
		FOREIGN KEY (
			BRD_ID
		)
		REFERENCES BOARD (
			BRD_ID
		);

ALTER TABLE POST
	ADD
		CONSTRAINT FK_ADMIN_TO_POST
		FOREIGN KEY (
			ADMIN_ID
		)
		REFERENCES ADMIN (
			ADMIN_ID
		);

ALTER TABLE R_PROJECT
	ADD
		CONSTRAINT FK_MEMBERS_TO_R_PROJECT
		FOREIGN KEY (
			MEM_ID
		)
		REFERENCES MEMBERS (
			MEM_ID
		);

ALTER TABLE R_META
	ADD
		CONSTRAINT FK_R_PROJECT_TO_R_META
		FOREIGN KEY (
			RPJT_ID
		)
		REFERENCES R_PROJECT (
			RPJT_ID
		);

ALTER TABLE R_KEEPER
	ADD
		CONSTRAINT FK_R_PROJECT_TO_R_KEEPER
		FOREIGN KEY (
			RPJT_ID
		)
		REFERENCES R_PROJECT (
			RPJT_ID
		);

ALTER TABLE R_OPTION
	ADD
		CONSTRAINT FK_R_PROJECT_TO_R_OPTION
		FOREIGN KEY (
			RPJT_ID
		)
		REFERENCES R_PROJECT (
			RPJT_ID
		);

ALTER TABLE DEPOSIT
	ADD
		CONSTRAINT FK_MEBER_TO_DEPOSIT
		FOREIGN KEY (
			MEM_ID
		)
		REFERENCES MEMBERS (
			MEM_ID
		);
        
        
SELECT /*insert*/ *
FROM MEMBERS;

--MEMBERS--
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (1,'id1','123@abc.de','p1','주현우','에인젤','01012345678',1,to_date('18/05/20','RR/MM/DD'),to_date('18/05/25','RR/MM/DD'),1,10000);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (2,'id2','456@abc.de','p2','김조운','빠른94','010159647896',1,to_date('18/05/21','RR/MM/DD'),to_date('18/05/22','RR/MM/DD'),1,50000);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (3,'id3','789@abc.de','p3','최은정','별명없음','01075311563',0,to_date('18/05/23','RR/MM/DD'),to_date('18/05/23','RR/MM/DD'),1,0);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (4,'id4','159@abc.de','p4','명선형','센세','01098745632',0,to_date('18/05/24','RR/MM/DD'),to_date('18/05/24','RR/MM/DD'),1,0);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (5,'id5','951@abc.de','p5','서동환','동동동동','01014782365',1,to_date('18/05/25','RR/MM/DD'),to_date('18/05/25','RR/MM/DD'),1,90000);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (6,'id6','951@abc.de','p6','강전욱','강고래','01098999899',0,to_date('18/05/25','RR/MM/DD'),to_date('18/05/25','RR/MM/DD'),1,2000);


SELECT /*insert*/ *
FROM R_PROJECT;


--R_PROJECT--
Insert into R_PROJECT (RPJT_ID,MEM_ID,RPJT_STATE,RPJT_PROGRESS,RPJT_SUBMISSION) 
values (1,1,1,1,to_date('18/05/25','RR/MM/DD'));
Insert into R_PROJECT (RPJT_ID,MEM_ID,RPJT_STATE,RPJT_PROGRESS,RPJT_SUBMISSION) 
values (2,2,2,1,to_date('18/05/25','RR/MM/DD'));
Insert into R_PROJECT (RPJT_ID,MEM_ID,RPJT_STATE,RPJT_PROGRESS,RPJT_SUBMISSION) 
values (3,3,3,1,to_date('18/05/25','RR/MM/DD'));
Insert into R_PROJECT (RPJT_ID,MEM_ID,RPJT_STATE,RPJT_PROGRESS,RPJT_SUBMISSION) 
values (4,4,1,1,to_date('18/05/25','RR/MM/DD'));
Insert into R_PROJECT (RPJT_ID,MEM_ID,RPJT_STATE,RPJT_PROGRESS,RPJT_SUBMISSION) 
values (5,5,1,1,to_date('18/05/25','RR/MM/DD'));



--승인1 검토중2 반려3--
--진행1 마감2--



SELECT /*insert*/ *
FROM BOARD;
--board--
Insert into BOARD (BRD_ID,BRD_NAME,BRD_TYPE) 
values (10,'공지사항','운영');
Insert into BOARD (BRD_ID,BRD_NAME,BRD_TYPE) 
values (20,'큐앤에이','운영');
Insert into BOARD (BRD_ID,BRD_NAME,BRD_TYPE) 
values (30,'커뮤니티','일반');

SELECT /*insert*/ *
FROM ADMIN;
Insert into ADMIN (ADMIN_ID,ADMIN_NAME,ADMIN_PWD) values ('admin','admin','admin');

SELECT /*insert*/ *
FROM POST;
--POST--
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (1,10,1,'admin','에인젤','조장으로서한마디','열심히하세요',to_date('18/05/25','RR/MM/DD'),1,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (1,20,2,'admin','빠른94','리워드어떻게하나요','ㅈㄱㄴ',to_date('18/05/25','RR/MM/DD'),2,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (2,20,3,'admin','별명없음','리워드가뭐여','투자는어떻게하나요',to_date('18/05/25','RR/MM/DD'),3,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (1,30,2,'admin','빠른94','나빠른94임ㅋㅋ','ㅈㄱㄴ',to_date('18/05/25','RR/MM/DD'),4,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (5,30,1,'admin','에인젤','조장못해먹겠슴','너무힘들어',to_date('18/05/25','RR/MM/DD'),5,1,'FILE');





SELECT /*insert*/ *
FROM DEPOSIT;
--DEPOSIT--
Insert into DEPOSIT (DEP_ID,MEM_ID,DEP_TYPE,DEP_REQUEST,DEP_BALANCE,DEP_DATE) 
values (1,1,1,1000,9000,to_date('18/05/25','RR/MM/DD'));
Insert into DEPOSIT (DEP_ID,MEM_ID,DEP_TYPE,DEP_REQUEST,DEP_BALANCE,DEP_DATE) 
values (2,2,2,10000,50000,to_date('18/05/25','RR/MM/DD'));
Insert into DEPOSIT (DEP_ID,MEM_ID,DEP_TYPE,DEP_REQUEST,DEP_BALANCE,DEP_DATE) 
values (3,3,3,10000,0,to_date('18/05/25','RR/MM/DD'));
Insert into DEPOSIT (DEP_ID,MEM_ID,DEP_TYPE,DEP_REQUEST,DEP_BALANCE,DEP_DATE) 
values (4,4,1,10000,0,to_date('18/05/25','RR/MM/DD'));
Insert into DEPOSIT (DEP_ID,MEM_ID,DEP_TYPE,DEP_REQUEST,DEP_BALANCE,DEP_DATE) 
values (5,5,2,10000,90000,to_date('18/05/25','RR/MM/DD'));



SELECT /*insert*/ *
FROM REWARD_PAY;
--REWARD_PAY--

Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (1,1,'사람1',1,1,1,10000,'경기도 성남시 분당구 판교로 242','01012332255','부재시 경비실에 맡겨주세요',433600);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (2,2,'사람2',2,2,2,20000,'경기도 성남시 분당구 불정로 90','01099887744','부재시 경비실에 맡겨주세요',189000);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (3,3,'사람3',3,3,1,50000,'서울특별시 종로구 종로 26','01054548787','부재시 경비실에 맡겨주세요',227000);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (4,4,'사람4',4,4,2,20000,'서울특별시 마포구 성암로 267 ','01022553377','배송전연락바랍니다',109000);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (5,5,'사람5',5,5,1,30000,'서울특별시 양천구 목동서로 161','01025663322','배송전연락바랍니다',79800);


SELECT /*insert*/ *
FROM R_META;
--R_META--
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (1,'미니헤드 선풍기 프로젝트','초소형미니헤드휴대용선풍',16800,3000000,'1.jpg','테크가전','18/05/09',to_date('18/05/27','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (2,'캡슐티머신','건강을마시는 메디프레소 머신',169000,3000000,'1.jpg','홈리빙','18/04/25',to_date('18/05/27','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (3,'알렉스텀블러','18시간 보냉되는 알렉스텀블러',59000,5000000,'1.jpg','홈리빙','18/04/24',to_date('18/05/26','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (4,'크코가벼운안경','크코가벼운안경 휴즈',89000,1000000,'1.jpg','디자인소품','18/05/10',to_date('18/06/08','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (5,'디어넛츠','견과류로만든천사의잼 디어너츠',24900,1000000,'1.jpg','푸드','18/05/30',to_date('18/06/21','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));




SELECT /*insert*/ *
FROM r_story;
--r_story(리워드스토리) 부모키r_project

REM INSERTING into R_STORY
SET DEFINE OFF;
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (1,'https://www.youtube.com/watch?v=GMMu8bgKwbc','10000000','1_thumbnail.jpg',
'안녕하세요? 한 평생 화학연구를 해오신 진 교수님의 닥터진랩 연구소와 스타트업 파쉐어입니다.
실제 실생활에 쉽게 퍼져있는 냄새와 관련 유해 성분들 알고나면 방치하기 쉽지 않습니다. 
스멜탄은 가벼운 비치로 실내에 잔류해있는 악취와 유해 성분들을 강력하게 제거하여 줍니다.
악취의 유해성에 관한 이야기로 스멜탄 이야기를 시작하도록 하겠습니다.','HomeLiving','교환 / 환불 / AS 정책

- 리워드 수령 14일 이내 제품 하자로 인한 교환 문의는 kitri@kitri.com 로 신청 가능합니다. 
- 교환/환불/AS 요청자 정보와 서포터 정보의 일치 여부 확인 후, 진행됩니다.

※교환/환불/AS 불가능한 경우
- 서포터의 책임 있는 사유로 리워드가 멸실/훼손된 경우 (단지 확인을 위한 겉포장 훼손 제외)
- 서포터의 사용/소비에 의해 리워드의 가치가 감소한 경우
- 시간 경과로 인해 재판매가 곤란할 정도로 리워드의 가치가 상실한 경우
- 서포터의 단순 변심
- 메이커를 통한 교환/환불/AS 접수 절차 없이 임의로 반송한 경우
- 복제가 가능한 리워드의 포장을 훼손한 경우
- 펀딩/판매/생산방식 특성상, 교환/반품 시, 메이커에게 회복할 수 없는 손해가 발생한 경우 (펀딩마감 후, 개별 생산, 맞춤 제작 등)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (2,'https://www.youtube.com/watch?v=-yKqurpmCRs','1000000','2_thumbnail.jpg','세상엔 정말 수많은 화장품 원료가 있지만, 절실했던 만큼 확실한 효과와 안전성이 입증된 원료가 필요했습니다. 다양한 원료를 연구하고 사용해보며 선택한 "마유"는 이미 연구된 입증자료가 많은 가장 믿을 수 있는 원료였습니다.
피부 세포 성장을 촉진하는 재생효과, 손상된 피부를 회복할 수 있는 항염(진정) 효과, 높은 피부 친화력으로 세포 생존력이 높은 안전한 성분으로 알려져 딸을 위해 원하던 부분을 모두 채워주었습니다.','Beauty','교환 / 환불 / AS 정책

- 리워드 수령 14일 이내 제품 하자로 인한 교환 문의는 kitri@kitri.com 로 신청 가능합니다. 
- 교환/환불/AS 요청자 정보와 서포터 정보의 일치 여부 확인 후, 진행됩니다.

※교환/환불/AS 불가능한 경우
- 서포터의 책임 있는 사유로 리워드가 멸실/훼손된 경우 (단지 확인을 위한 겉포장 훼손 제외)
- 서포터의 사용/소비에 의해 리워드의 가치가 감소한 경우
- 시간 경과로 인해 재판매가 곤란할 정도로 리워드의 가치가 상실한 경우
- 서포터의 단순 변심
- 메이커를 통한 교환/환불/AS 접수 절차 없이 임의로 반송한 경우
- 복제가 가능한 리워드의 포장을 훼손한 경우
- 펀딩/판매/생산방식 특성상, 교환/반품 시, 메이커에게 회복할 수 없는 손해가 발생한 경우 (펀딩마감 후, 개별 생산, 맞춤 제작 등)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER)
values (3,'https://www.youtube.com/watch?v=-yKqurpmCRs','3000000','3_thumbnail.jpg','아침에 눈 뜨면 제일 먼저 하는 일, 스마트폰을 켜고 미세먼지 앱을 체크하는 것이 어느새 일상이 되었습니다. 앱 속 이모티콘은 한 달에 절반은 찡그린 표정이고 초미세먼지와 이산화질소 등 오염물질은 세계보건기구 기준치를 한참 웃돕니다. 내 방, 우리 집, 자동차 안, 지하철 안. 내 일상의 공간들을 쾌적하게 만들 수는 없을까요?
차량용 공기청정기 에어링은 ‘내 일상의 공간에서 제대로 호흡할 수 없을까’라는 고민에서 출발한 제품입니다. 세라믹 필터 공기정화마스크, 오테라를 만든 (주)골드트룹스의 노하우가 이번에는 차량용 공기청정기에 담겼습니다.  ','Tech/Electronic','교환 / 환불 / AS 정책

- 리워드 수령 14일 이내 제품 하자로 인한 교환 문의는 kitri@kitri.com 로 신청 가능합니다. 
- 교환/환불/AS 요청자 정보와 서포터 정보의 일치 여부 확인 후, 진행됩니다.

※교환/환불/AS 불가능한 경우
- 서포터의 책임 있는 사유로 리워드가 멸실/훼손된 경우 (단지 확인을 위한 겉포장 훼손 제외)
- 서포터의 사용/소비에 의해 리워드의 가치가 감소한 경우
- 시간 경과로 인해 재판매가 곤란할 정도로 리워드의 가치가 상실한 경우
- 서포터의 단순 변심
- 메이커를 통한 교환/환불/AS 접수 절차 없이 임의로 반송한 경우
- 복제가 가능한 리워드의 포장을 훼손한 경우
- 펀딩/판매/생산방식 특성상, 교환/반품 시, 메이커에게 회복할 수 없는 손해가 발생한 경우 (펀딩마감 후, 개별 생산, 맞춤 제작 등)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (4,'https://www.youtube.com/watch?v=-yKqurpmCRs','1200000','4_thumbnail.jpg','안녕하세요. 저희는 역사 주권을 수호하는 마음을 갖고 모인 양명고의 역사지킴이 모임입니다. 학창시절에 역사 (한국사)에 대해서 루즈하고, 흥미없고, 필요없는 과목이라고 생각해 보신적이 있으신가요?  3.1운동이나 3.1운동 100주년에 대해서 어떻게 생각하시나요? 혹시 3.1운동에 대해서 생각해볼 겨를도 없으신가요? 현재 헌법에서는 3.1운동과 4.19 두 사건을 우리 민족정신의 근거로 한다는 것을 알고 계신가요? 몰랐다고 해도 괜찮습니다. 이제부터 알면 되니까요~ 지금부터 알고 다른사람에게 전달한다면 당신도 애국지사가 될 수 있습니다.','Social/Campaign','교환 / 환불 / AS 정책

- 리워드 수령 14일 이내 제품 하자로 인한 교환 문의는 kitri@kitri.com 로 신청 가능합니다. 
- 교환/환불/AS 요청자 정보와 서포터 정보의 일치 여부 확인 후, 진행됩니다.

※교환/환불/AS 불가능한 경우
- 서포터의 책임 있는 사유로 리워드가 멸실/훼손된 경우 (단지 확인을 위한 겉포장 훼손 제외)
- 서포터의 사용/소비에 의해 리워드의 가치가 감소한 경우
- 시간 경과로 인해 재판매가 곤란할 정도로 리워드의 가치가 상실한 경우
- 서포터의 단순 변심
- 메이커를 통한 교환/환불/AS 접수 절차 없이 임의로 반송한 경우
- 복제가 가능한 리워드의 포장을 훼손한 경우
- 펀딩/판매/생산방식 특성상, 교환/반품 시, 메이커에게 회복할 수 없는 손해가 발생한 경우 (펀딩마감 후, 개별 생산, 맞춤 제작 등)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (5,'https://www.youtube.com/watch?v=-yKqurpmCRs','1000000','5_thumbnail.jpg','인생 참치회는 최고급 참치어종인 혼마구로(참다랑어)의 최고급부위(가마도로)를 유통과정과 불필요한 상품들 줄여 기존 식당대비 최대 3분의1가격으로 만들어내는 혁신을 이루었습니다.','Food','교환 / 환불 / AS 정책

- 리워드 수령 14일 이내 제품 하자로 인한 교환 문의는 kitri@kitri.com 로 신청 가능합니다. 
- 교환/환불/AS 요청자 정보와 서포터 정보의 일치 여부 확인 후, 진행됩니다.

※교환/환불/AS 불가능한 경우
- 서포터의 책임 있는 사유로 리워드가 멸실/훼손된 경우 (단지 확인을 위한 겉포장 훼손 제외)
- 서포터의 사용/소비에 의해 리워드의 가치가 감소한 경우
- 시간 경과로 인해 재판매가 곤란할 정도로 리워드의 가치가 상실한 경우
- 서포터의 단순 변심
- 메이커를 통한 교환/환불/AS 접수 절차 없이 임의로 반송한 경우
- 복제가 가능한 리워드의 포장을 훼손한 경우
- 펀딩/판매/생산방식 특성상, 교환/반품 시, 메이커에게 회복할 수 없는 손해가 발생한 경우 (펀딩마감 후, 개별 생산, 맞춤 제작 등)');


SELECT /*insert*/ *
FROM r_option;
--r_option(리워드 옵션) 부모키r_project

Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (1,10,30000,'스멜탄 3개 세트','스멜탄 1SET(검정/베이지/흰색 중 택1)',50,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (2,20,16900,'마유 케어 프로그램 세트/스타트팩','마유 마스크팩10개+2개<총12개>',100,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (3,30,118800,'수퍼커플얼리버드','리워드A:가격-198,000원/2개',30,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (4,40,5000,'감사메일','후원 감사드립니다!',1000,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (5,50,45900,'인생참치회 1~2인세트','손질참치회250그람1세트+참치해동법팜플렛+초데리+간장와사비',40,to_date('18/05/28','RR/MM/DD'),2500);



SELECT /*insert*/ *
FROM r_post;
--r_post(리워드 게시물)

Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (1,'향으로 덮지 않고 실내 악취와 유해 성분 원천 제거, 스멜탄','향으로 덮지 않고 실내 악취와 유해 성분 원천 제거, 스멜탄!! 최고!!!!','rid1',to_date('18/05/20','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (2,'트고 진물나는 피부를 구한! 아빠가 만든 순도 100% 제주마유 제품','트고 진물나는 피부를 구한! 아빠가 만든 순도 100% 제주마유 제품이 짱임!!!','rid2',to_date('18/05/21','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (3,'그린 시그널을 보내는 공기청정기','그린 시그널을 보내는 공기청정기 왜안삼?!??!','rid3',to_date('18/05/22','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (4,'3.1운동 100주년 기념 베개/목베개/방석과 부조액자 제작','3.1운동 100주년 기념 베개/목베개/방석과 부조액자 제작해뜸!!!!!','rid4',to_date('18/05/23','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (5,'지금까지 경험해보지 못한 인생 참치회','지금까지 경험해보지 못한 인생 참치회 좀 먹어봐!!!','rid5',to_date('18/05/24','RR/MM/DD'));




SELECT /*insert*/ *
FROM r_comment;
--r_comment(리워드 댓글)

Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'1',1,'rrid1','지지서명 완료했어요 :)요즘 미세먼지 때문에 환기시키기 힘들어서 걱정했는데 좋은제품이 나왔네요~ 아기방에 달아놔야겠어요^^',to_date('18/05/28','RR/MM/DD'),'노숙형',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (2,'1',1,'rrid2','지지서명 했습니다!원룸살면서 고양이 키우는데 워낙 응아냄새가 집안 가득차서 디퓨저는 냄새가 섞이고 탈취제는 그때 뿐이더라구요 ㅠㅠ 스멜탄 기대해볼게요!',to_date('18/05/28','RR/MM/DD'),'keumddhj',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (3,'1',1,'rrid3','부엌 개수대에서 악취가 올라오는데 스멜탄으류 잘 해결 할 수 있길 기대합니다.:D',to_date('18/05/28','RR/MM/DD'),'소룡',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'2',2,'rrid4','홍조에도 효과가 있을까요?',to_date('18/05/28','RR/MM/DD'),'김도라지',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (2,'2',2,'rrid5','스토리 내 마스크팩의 가격이 잘못 입력되었어요. 슈퍼얼리버드 가격과 얼리버드가격의 할인비율이 다른데 할인가는 같게 기재되어 수정이 필요해 보입니다',to_date('18/05/28','RR/MM/DD'),'rossugosa',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'3',3,'rrid6','매일 차량 이동이 많은 일을 하는데 특히 올 해 공기가 안좋아 코와 목이 너무 안좋아 병원을 지난 달부터 계속 다니는 중에 이 제품을 보니 기대가 됩니다. 기존에 차량용 환풍기에 꼽아 쓰는 제품에 대핸 기대가 안되었었는데 좋은 제품 만들어 주시길 바랍니다. 
이쪽 계열에 대해 잘 모르지만 아래의 글 내용과 달린 댓글을 읽고 조금 더 기대를 해봅니다.',to_date('18/05/28','RR/MM/DD'),'익명',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'4',4,'rrid7','응원합니다!!',to_date('18/05/28','RR/MM/DD'),'윤징수',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'5',5,'rrid8','얼리패밀리버드랑 패밀리버드랑 똑같은거죠?
첫펀딩입니다 기대가되네요',to_date('18/05/28','RR/MM/DD'),'권행성',0);


SELECT /*insert*/ *
FROM r_keeper;
--r_keeper(리워드 창고지기) 부모키r_project

insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (1, 'FASHARE(파쉐어)', '1_keeper.jpg', 'FASHARE@daum.net', 
'youthdepot/reward/1', 01091008755);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (2, '엠이케이', '2_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 07086487722);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (3, '(주)골드트룹스', '3_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 01094891577);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (4, '양명고등학교 역사지기 동아리', '4_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 01092723788);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (5, '김드림(농부대첩)', '5_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 0113789922);


commit;


