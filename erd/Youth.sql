/* ������ ��� */
DROP TABLE R_COMMENT 
	CASCADE CONSTRAINTS;

/* ��������� */
DROP TABLE REWARD_PAY 
	CASCADE CONSTRAINTS;

/* ȸ�� */
DROP TABLE MEMBERS 
	CASCADE CONSTRAINTS;

/* ������ ���丮 */
DROP TABLE R_STORY 
	CASCADE CONSTRAINTS;

/* ������ �Խù� */
DROP TABLE R_POST 
	CASCADE CONSTRAINTS;

/* �Խù� */
DROP TABLE POST 
	CASCADE CONSTRAINTS;

/* ������������Ʈ */
DROP TABLE R_PROJECT 
	CASCADE CONSTRAINTS;

/* ������ �⺻���� */
DROP TABLE R_META 
	CASCADE CONSTRAINTS;

/* ������ â������ */
DROP TABLE R_KEEPER 
	CASCADE CONSTRAINTS;

/* ������ �ɼ� */
DROP TABLE R_OPTION 
	CASCADE CONSTRAINTS;

/* ����(��ġ��) */
DROP TABLE DEPOSIT 
	CASCADE CONSTRAINTS;

/* �Խ��� */
DROP TABLE BOARD 
	CASCADE CONSTRAINTS;

/* ������ */
DROP TABLE ADMIN 
	CASCADE CONSTRAINTS;

/* ������ ��� */
CREATE TABLE R_COMMENT (
	RCMT_ID NUMBER(10) NOT NULL, /* �۹�ȣ */
	RCMT_PARENT VARCHAR2(100) NOT NULL, /* �θ�۹�ȣ */
	RPJT_ID NUMBER(10) NOT NULL, /* �������ȣ */
	RCMT_USERID VARCHAR2(50) NOT NULL, /* �������̵� */
	RCMT_CONTENT VARCHAR2(600), /* ��۳��� */
	RCMT_UPDATED_DATETIME DATE, /* ���������ð� */
	RCMT_NICKNAME VARCHAR2(50), /* �ۼ��ڴг��� */
	RCMT_DEL NUMBER(10) /* �Խù��������� */
);

/* ��������� */
CREATE TABLE REWARD_PAY (
	RPAY_ID NUMBER(10) NOT NULL, /* PAY_PK */
	MEM_ID NUMBER(10), /* MEM_ID */
    MEM_NAME VARCHAR2(20), /*�ֹ��� �̸�*/
	RPJT_ID NUMBER(10), /* �������ȣ */
    RPRODUCT_ID NUMBER(10), /* �����۹�ȣ */
	RPRODUCT_EA NUMBER(10), /* ���� */
	RADDPAY NUMBER(10), /* �߰��Ŀ��� */
	RPAY_ADDRESS VARCHAR2(50), /* ����� */
	RPAY_PHONE VARCHAR2(20), /* �޴�����ȣ */
	RPAY_REQUEST VARCHAR2(50), /* ��ۿ�û���� */
	RPAY_TOTAL NUMBER(10) /* �ѱݾ� */
);

ALTER TABLE REWARD_PAY
	ADD
		CONSTRAINT REWARD_PAY
		PRIMARY KEY (
			RPAY_ID
		);

/* ȸ�� */
CREATE TABLE MEMBERS (
	MEM_ID NUMBER(10) NOT NULL, /* MEM_ID */
	MEM_USERID VARCHAR2(50) NOT NULL, /* ȸ�����̵� */
	MEM_EMAIL VARCHAR2(50) NOT NULL, /* ȸ���̸��� */
	MEM_PASSWORD VARCHAR2(20) NOT NULL, /* ȸ���н����� */
	MEM_USERNAME VARCHAR2(10) NOT NULL, /* ȸ���Ǹ� */
	MEM_NICKNAME VARCHAR2(50) NOT NULL, /* ȸ���г��� */
	MEM_PHONE VARCHAR2(15), /* ����ó */
	MEM_SEX NUMBER(10) NOT NULL, /* ���� */
	MEM_REGISTER_DATETIME DATE, /* ȸ������� */
	MEM_LASTLOGIN_DATETIME DATE, /* �����α��νð� */
	MEM_TREASURER NUMBER(10), /* â�����⿩�� */
	MEM_PASSION NUMBER(10) /* �������� */
);

ALTER TABLE MEMBERS
	ADD
		CONSTRAINT MEMBER
		PRIMARY KEY (
			MEM_ID
		);

/* ������ ���丮 */
CREATE TABLE R_STORY (
	RPJT_ID NUMBER(10) NOT NULL, /* �������ȣ */
	RPJT_URL VARCHAR2(100), /* ����url */
	RPJT_PRICE VARCHAR2(20), /* �ݾ� */
	RPJT_THUMBNAIL VARCHAR2(50), /* ������̹��� */
	RPJT_STORY CLOB, /* ������Ʈ���丮 */
	RPJT_TAG VARCHAR2(50), /* �˻����±� */
	RPJT_PAPER CLOB /* ��ȯ/ȯ��/as��å */
);

ALTER TABLE R_STORY
	ADD
		CONSTRAINT R_STORY
		PRIMARY KEY (
			RPJT_ID
		);

/* ������ �Խù� */
CREATE TABLE R_POST (
	RPJT_ID NUMBER(10) NOT NULL, /* �������ȣ */
    RPOST_TITLE VARCHAR2(100), /* �Խñ����� */
	RPOST_CONTENT CLOB, /* �Խñ����� */
	RPOST_USERID VARCHAR2(50), /* �ۼ���ȸ�����̵� */
	RPOST_DATETIME DATE /* �Խù��ۼ����� */
);

ALTER TABLE R_POST
	ADD
		CONSTRAINT R_POST
		PRIMARY KEY (
			RPJT_ID
		);

/* �Խù� */
CREATE TABLE POST (
	POST_ID NUMBER(10) NOT NULL, /* POST_ID */
	BRD_ID NUMBER(10) NOT NULL, /* BRD_ID */
	MEM_ID NUMBER(10), /* MEM_ID */
	ADMIN_ID VARCHAR2(20), /* ADMIN_ID */
	MEM_NICKNAME VARCHAR2(20), /* �ۼ��ڴг��� */
	POST_TITLE VARCHAR2(50), /* �Խñ����� */
	POST_CONTENT CLOB, /* �Խñۺ������� */
	POST_DATETIME DATE, /* �Խù��ۼ����� */
	POST_VIEW_COUNT NUMBER(10), /* ��ȸ�� */
	POST_DEL NUMBER(10), /* �Խñۻ������� */
	POST_FILE VARCHAR2(100) /* �Խñ�÷������ */
);

ALTER TABLE POST
	ADD
		CONSTRAINT POST
		PRIMARY KEY (
			POST_ID,
			BRD_ID
		);

/* ������������Ʈ */
CREATE TABLE R_PROJECT (
	RPJT_ID NUMBER(10) NOT NULL, /* �������ȣ */
	MEM_ID NUMBER(10), /* MEM_ID */
	RPJT_STATE NUMBER(10), /* ������Ʈ���� */
	RPJT_PROGRESS NUMBER(10), /* (������/����) */
	RPJT_SUBMISSION DATE /* ������ */
);

ALTER TABLE R_PROJECT
	ADD
		CONSTRAINT R_PROJECT
		PRIMARY KEY (
			RPJT_ID
		);

/* ������ �⺻���� */
CREATE TABLE R_META (
	RPJT_ID NUMBER(10) NOT NULL, /* �������ȣ */
	RPJT_TITLE VARCHAR2(50), /* ������Ʈ���� */
	RPJT_SUBTITLE VARCHAR2(50), /* ������Ʈª������ */
	RINVESTING_AMOUNT NUMBER(10), /* ���ڱݾ� */
	RTARGET_AMOUNT NUMBER(10), /* ��ǥ�ݾ� */
	RPJT_IMAGE VARCHAR2(50), /* ������Ʈ��ǥ�̹��� */
	RPJT_CATEGORY VARCHAR2(20), /* ī�װ� */
	RPJT_PAPER VARCHAR2(50), /* �������� */
	RPJT_STARTDAY DATE, /* ������Ʈ������ */
	RPJT_ENDDAY DATE /* ������Ʈ������ */
);

ALTER TABLE R_META
	ADD
		CONSTRAINT R_META
		PRIMARY KEY (
			RPJT_ID
		);

/* ������ â������ */
CREATE TABLE R_KEEPER (
	RPJT_ID NUMBER(10) NOT NULL, /* �������ȣ */
	R_NAME VARCHAR2(50), /* â������ �̸� */
	R_PROFILE VARCHAR2(50), /* â������ ������ ���� */
	R_EMAIL VARCHAR2(100), /* â������ email */
	R_URL VARCHAR2(100), /* ������Ʈ �ּ� */
	R_TEL NUMBER(20) /* â������ ��ȭ��ȣ */
);

ALTER TABLE R_KEEPER
	ADD
		CONSTRAINT R_KEEPER
		PRIMARY KEY (
			RPJT_ID
		);

/* ������ �ɼ� */
CREATE TABLE R_OPTION (
	RPJT_ID NUMBER(10) NOT NULL, /* �������ȣ */
	REWARD_ID NUMBER(10), /* �����۹�ȣ */
	RPJT_PRICE NUMBER(10), /* �ݾ� */
	RPJT_NAME VARCHAR2(50), /* �������̸� */
	RPJT_DETAIL CLOB, /* �󼼼��� */
	RPJT_LIMIT NUMBER(10), /* ���Ѽ��� */
	RPJT_SEND DATE, /* �߼۽����� */
	RPJT_CHARGE NUMBER(10) /* ��ۺ� */
);

ALTER TABLE R_OPTION
	ADD
		CONSTRAINT R_OPTION
		PRIMARY KEY (
			RPJT_ID
		);

/* ����(��ġ��) */
CREATE TABLE DEPOSIT (
	DEP_ID NUMBER(10) NOT NULL, /* DEP_ID */
	MEM_ID NUMBER(10) NOT NULL, /* MEM_ID */
	DEP_TYPE NUMBER(10), /* ����/ȯ��/��� */
	DEP_REQUEST NUMBER(10), /* ��û�ݾ� */
	DEP_BALANCE NUMBER(10), /* �ܾ� */
	DEP_DATE DATE /* ������û�Ͻ� */
);

ALTER TABLE DEPOSIT
	ADD
		CONSTRAINT DEPOSIT
		PRIMARY KEY (
			DEP_ID
		);

/* �Խ��� */
CREATE TABLE BOARD (
	BRD_ID NUMBER(10) NOT NULL, /* BRD_ID */
	BRD_NAME VARCHAR2(20), /* �Խ��Ǹ� */
    BRD_TYPE VARCHAR2(10) NOT NULL /* �Խ��� �з� */
);

ALTER TABLE BOARD
	ADD
		CONSTRAINT BOARD
		PRIMARY KEY (
			BRD_ID
		);

/* ������ */
CREATE TABLE ADMIN (
	ADMIN_ID VARCHAR2(20) NOT NULL, /* ADMIN_ID */
	ADMIN_NAME VARCHAR2(20), /* �������̸� */
	ADMIN_PWD VARCHAR2(20) /* �����ں�� */
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
values (1,'id1','123@abc.de','p1','������','������','01012345678',1,to_date('18/05/20','RR/MM/DD'),to_date('18/05/25','RR/MM/DD'),1,10000);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (2,'id2','456@abc.de','p2','������','����94','010159647896',1,to_date('18/05/21','RR/MM/DD'),to_date('18/05/22','RR/MM/DD'),1,50000);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (3,'id3','789@abc.de','p3','������','�������','01075311563',0,to_date('18/05/23','RR/MM/DD'),to_date('18/05/23','RR/MM/DD'),1,0);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (4,'id4','159@abc.de','p4','����','����','01098745632',0,to_date('18/05/24','RR/MM/DD'),to_date('18/05/24','RR/MM/DD'),1,0);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (5,'id5','951@abc.de','p5','����ȯ','��������','01014782365',1,to_date('18/05/25','RR/MM/DD'),to_date('18/05/25','RR/MM/DD'),1,90000);
Insert into MEMBERS (MEM_ID,MEM_USERID,MEM_EMAIL,MEM_PASSWORD,MEM_USERNAME,MEM_NICKNAME,MEM_PHONE,MEM_SEX,MEM_REGISTER_DATETIME,MEM_LASTLOGIN_DATETIME,MEM_TREASURER,MEM_PASSION) 
values (6,'id6','951@abc.de','p6','������','����','01098999899',0,to_date('18/05/25','RR/MM/DD'),to_date('18/05/25','RR/MM/DD'),1,2000);


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



--����1 ������2 �ݷ�3--
--����1 ����2--



SELECT /*insert*/ *
FROM BOARD;
--board--
Insert into BOARD (BRD_ID,BRD_NAME,BRD_TYPE) 
values (10,'��������','�');
Insert into BOARD (BRD_ID,BRD_NAME,BRD_TYPE) 
values (20,'ť�ؿ���','�');
Insert into BOARD (BRD_ID,BRD_NAME,BRD_TYPE) 
values (30,'Ŀ�´�Ƽ','�Ϲ�');

SELECT /*insert*/ *
FROM ADMIN;
Insert into ADMIN (ADMIN_ID,ADMIN_NAME,ADMIN_PWD) values ('admin','admin','admin');

SELECT /*insert*/ *
FROM POST;
--POST--
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (1,10,1,'admin','������','�������μ��Ѹ���','�������ϼ���',to_date('18/05/25','RR/MM/DD'),1,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (1,20,2,'admin','����94','���������ϳ���','������',to_date('18/05/25','RR/MM/DD'),2,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (2,20,3,'admin','�������','�����尡����','���ڴ¾���ϳ���',to_date('18/05/25','RR/MM/DD'),3,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (1,30,2,'admin','����94','������94�Ӥ���','������',to_date('18/05/25','RR/MM/DD'),4,0,'FILE');
Insert into POST (POST_ID,BRD_ID,MEM_ID,ADMIN_ID,MEM_NICKNAME,POST_TITLE,POST_CONTENT,POST_DATETIME,POST_VIEW_COUNT,POST_DEL,POST_FILE) 
values (5,30,1,'admin','������','������ظ԰ڽ�','�ʹ������',to_date('18/05/25','RR/MM/DD'),5,1,'FILE');





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
values (1,1,'���1',1,1,1,10000,'��⵵ ������ �д籸 �Ǳ��� 242','01012332255','����� ���ǿ� �ð��ּ���',433600);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (2,2,'���2',2,2,2,20000,'��⵵ ������ �д籸 ������ 90','01099887744','����� ���ǿ� �ð��ּ���',189000);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (3,3,'���3',3,3,1,50000,'����Ư���� ���α� ���� 26','01054548787','����� ���ǿ� �ð��ּ���',227000);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (4,4,'���4',4,4,2,20000,'����Ư���� ������ ���Ϸ� 267 ','01022553377','����������ٶ��ϴ�',109000);
Insert into REWARD_PAY (RPAY_ID,MEM_ID,MEM_NAME,RPJT_ID,RPRODUCT_ID,RPRODUCT_EA,RADDPAY,RPAY_ADDRESS,RPAY_PHONE,RPAY_REQUEST,RPAY_TOTAL) 
values (5,5,'���5',5,5,1,30000,'����Ư���� ��õ�� �񵿼��� 161','01025663322','����������ٶ��ϴ�',79800);


SELECT /*insert*/ *
FROM R_META;
--R_META--
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (1,'�̴���� ��ǳ�� ������Ʈ','�ʼ����̴�����޴�뼱ǳ',16800,3000000,'1.jpg','��ũ����','18/05/09',to_date('18/05/27','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (2,'ĸ��Ƽ�ӽ�','�ǰ������ô� �޵������� �ӽ�',169000,3000000,'1.jpg','Ȩ����','18/04/25',to_date('18/05/27','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (3,'�˷����Һ�','18�ð� ���õǴ� �˷����Һ�',59000,5000000,'1.jpg','Ȩ����','18/04/24',to_date('18/05/26','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (4,'ũ�ڰ�����Ȱ�','ũ�ڰ�����Ȱ� ����',89000,1000000,'1.jpg','�����μ�ǰ','18/05/10',to_date('18/06/08','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));
Insert into R_META (RPJT_ID,RPJT_TITLE,RPJT_SUBTITLE,RINVESTING_AMOUNT,RTARGET_AMOUNT,RPJT_IMAGE,RPJT_CATEGORY,RPJT_PAPER,RPJT_STARTDAY,RPJT_ENDDAY) 
values (5,'������','�߰����θ���õ������ ������',24900,1000000,'1.jpg','Ǫ��','18/05/30',to_date('18/06/21','RR/MM/DD'),to_date('18/06/30','RR/MM/DD'));




SELECT /*insert*/ *
FROM r_story;
--r_story(�����彺�丮) �θ�Űr_project

REM INSERTING into R_STORY
SET DEFINE OFF;
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (1,'https://www.youtube.com/watch?v=GMMu8bgKwbc','10000000','1_thumbnail.jpg',
'�ȳ��ϼ���? �� ��� ȭ�п����� �ؿ��� �� �������� �������� �����ҿ� ��ŸƮ�� �Ľ����Դϴ�.
���� �ǻ�Ȱ�� ���� �����ִ� ������ ���� ���� ���е� �˰��� ��ġ�ϱ� ���� �ʽ��ϴ�. 
����ź�� ������ ��ġ�� �ǳ��� �ܷ����ִ� ����� ���� ���е��� �����ϰ� �����Ͽ� �ݴϴ�.
������ ���ؼ��� ���� �̾߱�� ����ź �̾߱⸦ �����ϵ��� �ϰڽ��ϴ�.','HomeLiving','��ȯ / ȯ�� / AS ��å

- ������ ���� 14�� �̳� ��ǰ ���ڷ� ���� ��ȯ ���Ǵ� kitri@kitri.com �� ��û �����մϴ�. 
- ��ȯ/ȯ��/AS ��û�� ������ ������ ������ ��ġ ���� Ȯ�� ��, ����˴ϴ�.

�ر�ȯ/ȯ��/AS �Ұ����� ���
- �������� å�� �ִ� ������ �����尡 ���/�Ѽյ� ��� (���� Ȯ���� ���� ������ �Ѽ� ����)
- �������� ���/�Һ� ���� �������� ��ġ�� ������ ���
- �ð� ����� ���� ���ǸŰ� ����� ������ �������� ��ġ�� ����� ���
- �������� �ܼ� ����
- ����Ŀ�� ���� ��ȯ/ȯ��/AS ���� ���� ���� ���Ƿ� �ݼ��� ���
- ������ ������ �������� ������ �Ѽ��� ���
- �ݵ�/�Ǹ�/������ Ư����, ��ȯ/��ǰ ��, ����Ŀ���� ȸ���� �� ���� ���ذ� �߻��� ��� (�ݵ����� ��, ���� ����, ���� ���� ��)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (2,'https://www.youtube.com/watch?v=-yKqurpmCRs','1000000','2_thumbnail.jpg','���� ���� ������ ȭ��ǰ ���ᰡ ������, �����ߴ� ��ŭ Ȯ���� ȿ���� �������� ������ ���ᰡ �ʿ��߽��ϴ�. �پ��� ���Ḧ �����ϰ� ����غ��� ������ "����"�� �̹� ������ �����ڷᰡ ���� ���� ���� �� �ִ� ���ῴ���ϴ�.
�Ǻ� ���� ������ �����ϴ� ���ȿ��, �ջ�� �Ǻθ� ȸ���� �� �ִ� �׿�(����) ȿ��, ���� �Ǻ� ģȭ������ ���� �������� ���� ������ �������� �˷��� ���� ���� ���ϴ� �κ��� ��� ä���־����ϴ�.','Beauty','��ȯ / ȯ�� / AS ��å

- ������ ���� 14�� �̳� ��ǰ ���ڷ� ���� ��ȯ ���Ǵ� kitri@kitri.com �� ��û �����մϴ�. 
- ��ȯ/ȯ��/AS ��û�� ������ ������ ������ ��ġ ���� Ȯ�� ��, ����˴ϴ�.

�ر�ȯ/ȯ��/AS �Ұ����� ���
- �������� å�� �ִ� ������ �����尡 ���/�Ѽյ� ��� (���� Ȯ���� ���� ������ �Ѽ� ����)
- �������� ���/�Һ� ���� �������� ��ġ�� ������ ���
- �ð� ����� ���� ���ǸŰ� ����� ������ �������� ��ġ�� ����� ���
- �������� �ܼ� ����
- ����Ŀ�� ���� ��ȯ/ȯ��/AS ���� ���� ���� ���Ƿ� �ݼ��� ���
- ������ ������ �������� ������ �Ѽ��� ���
- �ݵ�/�Ǹ�/������ Ư����, ��ȯ/��ǰ ��, ����Ŀ���� ȸ���� �� ���� ���ذ� �߻��� ��� (�ݵ����� ��, ���� ����, ���� ���� ��)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER)
values (3,'https://www.youtube.com/watch?v=-yKqurpmCRs','3000000','3_thumbnail.jpg','��ħ�� �� �߸� ���� ���� �ϴ� ��, ����Ʈ���� �Ѱ� �̼����� ���� üũ�ϴ� ���� ����� �ϻ��� �Ǿ����ϴ�. �� �� �̸�Ƽ���� �� �޿� ������ ���׸� ǥ���̰� �ʹ̼������� �̻�ȭ���� �� ���������� ���躸�Ǳⱸ ����ġ�� ���� �����ϴ�. �� ��, �츮 ��, �ڵ��� ��, ����ö ��. �� �ϻ��� �������� �����ϰ� ���� ���� �������?
������ ����û���� ����� ���� �ϻ��� �������� ����� ȣ���� �� �������� ��ο��� ����� ��ǰ�Դϴ�. ����� ���� ������ȭ����ũ, ���׶� ���� (��)���Ʈ�콺�� ���Ͽ찡 �̹����� ������ ����û���⿡ �����ϴ�.  ','Tech/Electronic','��ȯ / ȯ�� / AS ��å

- ������ ���� 14�� �̳� ��ǰ ���ڷ� ���� ��ȯ ���Ǵ� kitri@kitri.com �� ��û �����մϴ�. 
- ��ȯ/ȯ��/AS ��û�� ������ ������ ������ ��ġ ���� Ȯ�� ��, ����˴ϴ�.

�ر�ȯ/ȯ��/AS �Ұ����� ���
- �������� å�� �ִ� ������ �����尡 ���/�Ѽյ� ��� (���� Ȯ���� ���� ������ �Ѽ� ����)
- �������� ���/�Һ� ���� �������� ��ġ�� ������ ���
- �ð� ����� ���� ���ǸŰ� ����� ������ �������� ��ġ�� ����� ���
- �������� �ܼ� ����
- ����Ŀ�� ���� ��ȯ/ȯ��/AS ���� ���� ���� ���Ƿ� �ݼ��� ���
- ������ ������ �������� ������ �Ѽ��� ���
- �ݵ�/�Ǹ�/������ Ư����, ��ȯ/��ǰ ��, ����Ŀ���� ȸ���� �� ���� ���ذ� �߻��� ��� (�ݵ����� ��, ���� ����, ���� ���� ��)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (4,'https://www.youtube.com/watch?v=-yKqurpmCRs','1200000','4_thumbnail.jpg','�ȳ��ϼ���. ����� ���� �ֱ��� ��ȣ�ϴ� ������ ���� ���� ������ ������Ŵ�� �����Դϴ�. ��â������ ���� (�ѱ���)�� ���ؼ� �����ϰ�, ��̾���, �ʿ���� �����̶�� ������ �������� �����Ű���?  3.1��̳� 3.1� 100�ֳ⿡ ���ؼ� ��� �����Ͻó���? Ȥ�� 3.1��� ���ؼ� �����غ� �ܸ��� �����Ű���? ���� ��������� 3.1��� 4.19 �� ����� �츮 ���������� �ٰŷ� �Ѵٴ� ���� �˰� ��Ű���? �����ٰ� �ص� �������ϴ�. �������� �˸� �Ǵϱ��~ ���ݺ��� �˰� �ٸ�������� �����Ѵٸ� ��ŵ� �ֱ����簡 �� �� �ֽ��ϴ�.','Social/Campaign','��ȯ / ȯ�� / AS ��å

- ������ ���� 14�� �̳� ��ǰ ���ڷ� ���� ��ȯ ���Ǵ� kitri@kitri.com �� ��û �����մϴ�. 
- ��ȯ/ȯ��/AS ��û�� ������ ������ ������ ��ġ ���� Ȯ�� ��, ����˴ϴ�.

�ر�ȯ/ȯ��/AS �Ұ����� ���
- �������� å�� �ִ� ������ �����尡 ���/�Ѽյ� ��� (���� Ȯ���� ���� ������ �Ѽ� ����)
- �������� ���/�Һ� ���� �������� ��ġ�� ������ ���
- �ð� ����� ���� ���ǸŰ� ����� ������ �������� ��ġ�� ����� ���
- �������� �ܼ� ����
- ����Ŀ�� ���� ��ȯ/ȯ��/AS ���� ���� ���� ���Ƿ� �ݼ��� ���
- ������ ������ �������� ������ �Ѽ��� ���
- �ݵ�/�Ǹ�/������ Ư����, ��ȯ/��ǰ ��, ����Ŀ���� ȸ���� �� ���� ���ذ� �߻��� ��� (�ݵ����� ��, ���� ����, ���� ���� ��)');
Insert into R_STORY (RPJT_ID,RPJT_URL,RPJT_PRICE,RPJT_THUMBNAIL,RPJT_STORY,RPJT_TAG,RPJT_PAPER) 
values (5,'https://www.youtube.com/watch?v=-yKqurpmCRs','1000000','5_thumbnail.jpg','�λ� ��ġȸ�� �ְ�� ��ġ������ ȥ������(���ٶ���)�� �ְ�޺���(��������)�� ��������� ���ʿ��� ��ǰ�� �ٿ� ���� �Ĵ��� �ִ� 3����1�������� ������ ������ �̷�����ϴ�.','Food','��ȯ / ȯ�� / AS ��å

- ������ ���� 14�� �̳� ��ǰ ���ڷ� ���� ��ȯ ���Ǵ� kitri@kitri.com �� ��û �����մϴ�. 
- ��ȯ/ȯ��/AS ��û�� ������ ������ ������ ��ġ ���� Ȯ�� ��, ����˴ϴ�.

�ر�ȯ/ȯ��/AS �Ұ����� ���
- �������� å�� �ִ� ������ �����尡 ���/�Ѽյ� ��� (���� Ȯ���� ���� ������ �Ѽ� ����)
- �������� ���/�Һ� ���� �������� ��ġ�� ������ ���
- �ð� ����� ���� ���ǸŰ� ����� ������ �������� ��ġ�� ����� ���
- �������� �ܼ� ����
- ����Ŀ�� ���� ��ȯ/ȯ��/AS ���� ���� ���� ���Ƿ� �ݼ��� ���
- ������ ������ �������� ������ �Ѽ��� ���
- �ݵ�/�Ǹ�/������ Ư����, ��ȯ/��ǰ ��, ����Ŀ���� ȸ���� �� ���� ���ذ� �߻��� ��� (�ݵ����� ��, ���� ����, ���� ���� ��)');


SELECT /*insert*/ *
FROM r_option;
--r_option(������ �ɼ�) �θ�Űr_project

Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (1,10,30000,'����ź 3�� ��Ʈ','����ź 1SET(����/������/��� �� ��1)',50,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (2,20,16900,'���� �ɾ� ���α׷� ��Ʈ/��ŸƮ��','���� ����ũ��10��+2��<��12��>',100,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (3,30,118800,'����Ŀ�þ󸮹���','������A:����-198,000��/2��',30,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (4,40,5000,'�������','�Ŀ� ����帳�ϴ�!',1000,to_date('18/05/28','RR/MM/DD'),2500);
Insert into R_OPTION (RPJT_ID,REWARD_ID,RPJT_PRICE,RPJT_NAME,RPJT_DETAIL,RPJT_LIMIT,RPJT_SEND,RPJT_CHARGE) 
values (5,50,45900,'�λ���ġȸ 1~2�μ�Ʈ','������ġȸ250�׶�1��Ʈ+��ġ�ص������÷�+�ʵ���+����ͻ��',40,to_date('18/05/28','RR/MM/DD'),2500);



SELECT /*insert*/ *
FROM r_post;
--r_post(������ �Խù�)

Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (1,'������ ���� �ʰ� �ǳ� ����� ���� ���� ��õ ����, ����ź','������ ���� �ʰ� �ǳ� ����� ���� ���� ��õ ����, ����ź!! �ְ�!!!!','rid1',to_date('18/05/20','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (2,'Ʈ�� �������� �Ǻθ� ����! �ƺ��� ���� ���� 100% ���ָ��� ��ǰ','Ʈ�� �������� �Ǻθ� ����! �ƺ��� ���� ���� 100% ���ָ��� ��ǰ�� ¯��!!!','rid2',to_date('18/05/21','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (3,'�׸� �ñ׳��� ������ ����û����','�׸� �ñ׳��� ������ ����û���� �־Ȼ�?!??!','rid3',to_date('18/05/22','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (4,'3.1� 100�ֳ� ��� ����/�񺣰�/�漮�� �������� ����','3.1� 100�ֳ� ��� ����/�񺣰�/�漮�� �������� �����ض�!!!!!','rid4',to_date('18/05/23','RR/MM/DD'));
Insert into R_POST (RPJT_ID,RPOST_TITLE,RPOST_CONTENT,RPOST_USERID,RPOST_DATETIME) 
values (5,'���ݱ��� �����غ��� ���� �λ� ��ġȸ','���ݱ��� �����غ��� ���� �λ� ��ġȸ �� �Ծ��!!!','rid5',to_date('18/05/24','RR/MM/DD'));




SELECT /*insert*/ *
FROM r_comment;
--r_comment(������ ���)

Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'1',1,'rrid1','�������� �Ϸ��߾�� :)���� �̼����� ������ ȯ���Ű�� ���� �����ߴµ� ������ǰ�� ���Գ׿�~ �Ʊ�濡 �޾Ƴ��߰ھ��^^',to_date('18/05/28','RR/MM/DD'),'�����',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (2,'1',1,'rrid2','�������� �߽��ϴ�!�����鼭 ����� Ű��µ� ���� ���Ƴ����� ���� �������� ��ǻ���� ������ ���̰� Ż������ �׶� ���̴��󱸿� �Ф� ����ź ����غ��Կ�!',to_date('18/05/28','RR/MM/DD'),'keumddhj',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (3,'1',1,'rrid3','�ξ� �����뿡�� ���밡 �ö���µ� ����ź���� �� �ذ� �� �� �ֱ� ����մϴ�.:D',to_date('18/05/28','RR/MM/DD'),'�ҷ�',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'2',2,'rrid4','ȫ������ ȿ���� �������?',to_date('18/05/28','RR/MM/DD'),'�赵����',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (2,'2',2,'rrid5','���丮 �� ����ũ���� ������ �߸� �ԷµǾ����. ���۾󸮹��� ���ݰ� �󸮹��尡���� ���κ����� �ٸ��� ���ΰ��� ���� ����Ǿ� ������ �ʿ��� ���Դϴ�',to_date('18/05/28','RR/MM/DD'),'rossugosa',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'3',3,'rrid6','���� ���� �̵��� ���� ���� �ϴµ� Ư�� �� �� ���Ⱑ ������ �ڿ� ���� �ʹ� ������ ������ ���� �޺��� ��� �ٴϴ� �߿� �� ��ǰ�� ���� ��밡 �˴ϴ�. ������ ������ ȯǳ�⿡ �ž� ���� ��ǰ�� ���� ��밡 �ȵǾ����µ� ���� ��ǰ ����� �ֽñ� �ٶ��ϴ�. 
���� �迭�� ���� �� ������ �Ʒ��� �� ����� �޸� ����� �а� ���� �� ��븦 �غ��ϴ�.',to_date('18/05/28','RR/MM/DD'),'�͸�',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'4',4,'rrid7','�����մϴ�!!',to_date('18/05/28','RR/MM/DD'),'��¡��',0);
Insert into R_COMMENT (RCMT_ID,RCMT_PARENT,RPJT_ID,RCMT_USERID,RCMT_CONTENT,RCMT_UPDATED_DATETIME,RCMT_NICKNAME,RCMT_DEL) 
values (1,'5',5,'rrid8','���йи������ �йи������ �Ȱ�������?
ù�ݵ��Դϴ� ��밡�ǳ׿�',to_date('18/05/28','RR/MM/DD'),'���༺',0);


SELECT /*insert*/ *
FROM r_keeper;
--r_keeper(������ â������) �θ�Űr_project

insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (1, 'FASHARE(�Ľ���)', '1_keeper.jpg', 'FASHARE@daum.net', 
'youthdepot/reward/1', 01091008755);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (2, '��������', '2_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 07086487722);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (3, '(��)���Ʈ�콺', '3_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 01094891577);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (4, '������б� �������� ���Ƹ�', '4_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 01092723788);
insert into r_keeper(RPJT_ID, r_name, r_profile, r_email, r_url, r_tel)
values (5, '��帲(��δ�ø)', '5_keeper.jpg', 'saddo112@daum.net', 
'youthdepot/reward/1', 0113789922);


commit;


