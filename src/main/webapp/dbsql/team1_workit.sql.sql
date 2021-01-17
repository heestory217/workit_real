-- ����ī�װ�
DROP TABLE WORKKIND CASCADE CONSTRAINT;
CREATE TABLE WORKKIND 
(
    WORKKIND_NO     NUMBER          PRIMARY KEY,    -- ������ȣ
    WORKKIND_NAME   VARCHAR2(80)    NULL            -- �����̸�
);

--����ī�װ� ���̺� ������
DROP SEQUENCE WORKKIND_SEQ;
CREATE SEQUENCE WORKKIND_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ȸ�� ����
DROP TABLE USERS CASCADE CONSTRAINT;
CREATE TABLE USERS 
(
    USER_NO         NUMBER        PRIMARY KEY,          -- ȸ�� ��ȣ
    USER_NAME       VARCHAR2(80)  NOT NULL,             -- �̸�
    USER_ID         VARCHAR2(80)  NOT NULL,             -- ���̵�
    USER_PASSWORD   VARCHAR2(80)  NOT NULL,             -- ��й�ȣ
    USER_EMAIL      VARCHAR2(50)  NULL,                 -- �̸���
    USER_ZIPCODE    VARCHAR2(80)  NULL,                 -- �����ȣ
    USER_ADDRESS    VARCHAR2(150) NULL,                 -- �ּ�
    USER_HP         VARCHAR2(120) NULL,                 -- ����ó
    WORKKIND_NO     NUMBER        NULL REFERENCES WORKKIND(WORKKIND_NO)
                              ON DELETE CASCADE,        -- ������ȣ
    USER_EXPERIENCE VARCHAR2(120) NULL,                 -- ���
    USER_REGDATE    DATE          DEFAULT SYSDATE,      -- ������
    USER_ENDDATE    DATE          NULL,                 -- Ż����
    USER_CORPCHECK  NUMBER        DEFAULT 1             -- ���ȸ������
);

--ȸ�� ���� ���̺� ������
DROP SEQUENCE USERS_SEQ;
CREATE SEQUENCE USERS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��� ����
DROP TABLE CORP CASCADE CONSTRAINT;
CREATE TABLE CORP 
(
    CORP_NO             NUMBER        PRIMARY KEY,                       -- ��� ���� ��ȣ
    USER_NO             NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                                  ON DELETE CASCADE,                          -- ȸ�� ��ȣ
    CORP_NAME           VARCHAR2(80)  NOT NULL ,                     -- ȸ�� �̸�
    CORP_INTRO          CLOB          NOT NULL,                          -- ȸ�� �Ұ�
    CORP_IMGURL         VARCHAR2(200) NOT NULL,                          -- �ΰ� �̹��� URL
    CORP_AVRPAY         NUMBER        NULL,                              -- ��� ����
    CORP_KIND           VARCHAR2(150) NULL,                              -- �������
    CORP_PNUMBER        NUMBER        NOT NULL CHECK(CORP_PNUMBER>=1),   -- ������
    CORP_HEADNAME       VARCHAR2(100) NOT NULL,                          -- ��ǥ�ڸ�
    CORP_ZIPCODE        VARCHAR2(20)  NOT NULL,                          -- �����ȣ
    CORP_ADDRESS1       VARCHAR2(150) NOT NULL,                          -- ��ǥ �ּ�1
    COL_ADDRESS2        VARCHAR2(150) NULL,                              -- ��ǥ �ּ�2
    CORP_CORPADDNUMBER  VARCHAR2(200) NOT NULL,                          -- ����� ��Ϲ�ȣ
    CORP_INDUSTRY       VARCHAR2(120) NOT NULL,                          -- �����
    CORP_STARTDATE      DATE          NOT NULL,                          -- ���� ����
    CORP_WEBADDRESS     VARCHAR2(200) NULL,                              -- ������Ʈ �ּ�
    CORP_TEL            VARCHAR2(60)  NOT NULL,                          -- ��ǥ��ȣ
    CORP_OKCHECK        NUMBER        DEFAULT 0                          -- ���ο���
);

--��� ���� ���̺� ������
DROP SEQUENCE CORP_SEQ;
CREATE SEQUENCE CORP_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ä�����
DROP TABLE RECRUITANNOUNCE CASCADE CONSTRAINT;
CREATE TABLE RECRUITANNOUNCE 
(
    RECRUITANNOUNCE_NO            NUMBER        PRIMARY KEY,            -- ��ü�����ȣ
    USER_NO                       NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                                            ON DELETE CASCADE,          -- ��� ȸ�� ��ȣ
    RECRUITANNOUNCE_TITLE         VARCHAR2(100) NULL,                   -- ä�� ���� ����
    RECRUITANNOUNCE_STARTDATE     DATE          DEFAULT SYSDATE,        -- ä�������
    RECRUITANNOUNCE_ENDDATE       DATE          NOT NULL,               -- ä�븶����
    RECRUITANNOUNCE_SCARRER       VARCHAR2(100) NULL,                   -- ���_���
    RECRUITANNOUNCE_SWORKKIND     VARCHAR2(100) NOT NULL,               -- ���_�������
    RECRUITANNOUNCE_SPAY          VARCHAR2(100) NULL,                   -- ���_�޿�
    RECRUITANNOUNCE_SKILL         VARCHAR2(100) NOT NULL,               -- ���_��ų
    RECRUITANNOUNCE_WORKKIND      CLOB          NOT NULL,               -- ä������
    RECRUITANNOUNCE_CORPINTRO     CLOB          NULL,                   -- ����Ұ�
    RECRUITANNOUNCE_WORK          CLOB          NULL,                   -- �ֿ����
    RECRUITANNOUNCE_WANTEDCARRER  CLOB          NOT NULL,               -- �ڰݿ��
    RECRUITANNOUNCE_UPCHECKCARRER CLOB          NULL,                   -- ������
    RECRUITANNOUNCE_HIRESTEP      CLOB          NULL,                   -- ä������
    RECRUITANNOUNCE_ELSE          CLOB          NULL,                   -- ��Ÿ
    RECRUITANNOUNCE_UPCHECK       NUMBER        DEFAULT 2 NOT NULL,     -- ������ο���
    RECRUITANNOUNCE_ENDCHECK      NUMBER        DEFAULT 2  NOT NULL,    -- ����������
    RECRUITANNOUNCE_LINK          VARCHAR2(200) NULL                    -- ȸ�縵ũ
);

--ä����� ���̺� ������
DROP SEQUENCE RECRUITANNOUNCE_SEQ;
CREATE SEQUENCE RECRUITANNOUNCE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �Ի���������
DROP TABLE PROHIBITJOIN CASCADE CONSTRAINT;
CREATE TABLE PROHIBITJOIN 
(
    PROHIBITJOIN_NO     NUMBER  PRIMARY KEY,             -- ������ ������
    USER_PESONAL_NO     NUMBER  NULL REFERENCES USERS(USER_NO)
                            ON DELETE CASCADE,           -- ���� ȸ�� ��ȣ
    USER_CORP_NO        NUMBER  NULL REFERENCES USERS(USER_NO)
                            ON DELETE CASCADE            -- ��� ȸ�� ��ȣ
);

--�Ի��������� ���̺� ������
DROP SEQUENCE PROHIBITJOIN_SEQ;
CREATE SEQUENCE PROHIBITJOIN_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ����
DROP TABLE AREALIST CASCADE CONSTRAINT;
CREATE TABLE AREALIST 
(
    AREA_NO      NUMBER         PRIMARY KEY,          -- �ٹ��� ��ȣ
    AREA_ADD1    VARCHAR2(120)  NULL,                 -- �ٹ����� ��/��
    AREA_ADD2    VARCHAR2(120)  NULL                  -- �ٹ����� ��/��
);

--���� ���̺� ������
DROP SEQUENCE AREALIST_SEQ;
CREATE SEQUENCE AREALIST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��� �䱸 �ٹ���
DROP TABLE CORPWANTEDAREA CASCADE CONSTRAINT;
CREATE TABLE CORPWANTEDAREA 
(
    CORPWANTEDAREA_NO  NUMBER  PRIMARY KEY,              -- ��� �䱸 �ٹ��� ������
    AREA_NO            NUMBER  NULL REFERENCES AREALIST(AREA_NO)
                           ON DELETE CASCADE,            -- �ٹ��� ��ȣ
    RECRUITANNOUNCE_NO NUMBER  NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                            ON DELETE CASCADE            -- ��ü�����ȣ
);

--��� �䱸 �ٹ��� ���̺� ������
DROP SEQUENCE CORPWANTEDAREA_SEQ;
CREATE SEQUENCE CORPWANTEDAREA_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��� �̹���
DROP TABLE CORPIMG CASCADE CONSTRAINT;
CREATE TABLE CORPIMG 
(
    CORPIMG_NO  NUMBER          PRIMARY KEY,                        -- �̹��� ��ȣ
    CORP_NO     NUMBER          NOT NULL REFERENCES CORP(CORP_NO)
                            ON DELETE CASCADE,                      -- ��� ���� ��ȣ
    CORPIMG_URL VARCHAR2(300)   NOT NULL                            -- �̹��� URL
);

--��� �̹��� ���̺� ������
DROP SEQUENCE CORPIMG_SEQ;
CREATE SEQUENCE CORPIMG_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �������
DROP TABLE CORPREVIEW CASCADE CONSTRAINT;
CREATE TABLE CORPREVIEW 
(
    CORPREVIEW_NO          NUMBER        PRIMARY KEY,                       -- ���� ��ȣ
    USER_NO                NUMBER        NOT NULL REFERENCES USERS(USER_NO), -- ȸ�� ��ȣ
    CORP_NO                NUMBER        NOT NULL REFERENCES CORP(CORP_NO)
                                     ON DELETE CASCADE,                     -- ��� ���� ��ȣ
    CORPREVIEW_DATE        DATE          DEFAULT SYSDATE,                   -- �ۼ���
    CORPREVIEW_ONELINE     VARCHAR2(100) NOT NULL,                          -- �� �� ��
    CORPREVIEW_GOOD        VARCHAR2(500) NOT NULL,                          -- ����
    CORPREVIEW_BAD         VARCHAR2(500) NOT NULL,                          -- ����
    CORPREVIEW_WANT        VARCHAR2(500) NOT NULL,                          -- �ٶ�� ��
    CORPREVIEW_RATE        NUMBER        NULL,                              -- ��� ����
    CORPREVIEW_DELETECHECK NUMBER        NULL                               -- ���� ����
);

--������� ���̺� ������
DROP SEQUENCE CORPREVIEW_SEQ;
CREATE SEQUENCE CORPREVIEW_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �̷¼�
DROP TABLE RESUMES CASCADE CONSTRAINT;
CREATE TABLE RESUMES 
(
    RESUME_NO               NUMBER         PRIMARY KEY,              -- �̷¼� ��ȣ
    USER_NO                 NUMBER        NULL REFERENCES USERS(USER_NO)
                                      ON DELETE CASCADE,            -- ȸ�� ��ȣ
    RESUME_TITLE            VARCHAR2(80)  NOT NULL,                 -- ����
    RESUME_FINALEDUCATION   VARCHAR2(120) NULL,                     -- �����з�
    RESUME_SELFINTRO        CLOB          NULL,                     -- �ڱ�Ұ�
    RESUME_DATE             DATE          DEFAULT SYSDATE,          -- �������
    RESUME_FILENAME         VARCHAR2(80)  NULL,                     -- �����̸�
    RESUME_FILESIZE         VARCHAR2(80)  NULL,                     -- ���ϻ�����
    RESUME_FILEORIGINALNAME VARCHAR2(120) NULL,                     -- ���� �������� �̸�
    RESUME_RESUMEOPENCHECK  NUMBER        DEFAULT 1                 -- �̷¼� ���� ����
);

--�̷¼� ���̺� ������
DROP SEQUENCE RESUMES_SEQ;
CREATE SEQUENCE RESUMES_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��� ���
DROP TABLE LANGUAGE CASCADE CONSTRAINT;
CREATE TABLE LANGUAGE 
(
    LANGUAGE_NO     NUMBER        PRIMARY KEY,  -- ��� ��ȣ
    LANGUAGE_NAME   VARCHAR2(150) NULL          -- ��� �̸�
);

--��� ��� ���̺� ������
DROP SEQUENCE LANGUAGE_SEQ;
CREATE SEQUENCE LANGUAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ȸ�� ��� ���
DROP TABLE CORPUSELANGUAGE CASCADE CONSTRAINT;
CREATE TABLE CORPUSELANGUAGE 
(
    CORPUSELANGUAGE_NO  NUMBER        PRIMARY KEY,              -- ȸ�� ��� ��� ������
    LANGUAGE_NO         NUMBER        NULL REFERENCES LANGUAGE(LANGUAGE_NO)
                                  ON DELETE CASCADE,            -- ��� ��ȣ
    RESUME_NO           NUMBER NULL REFERENCES RESUMES(RESUME_NO)
                                      ON DELETE CASCADE         -- �̷¼� ��ȣ
);

--ȸ�� ��� ��� ���̺� ������
DROP SEQUENCE CORPUSELANGUAGE_SEQ;
CREATE SEQUENCE CORPUSELANGUAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ȸ�� �ٹ� ��� ����
DROP TABLE USERWANTEDWORKAREA CASCADE CONSTRAINT;
CREATE TABLE USERWANTEDWORKAREA 
(
    USERWANTEDWORKAREA_NO  NUMBER        PRIMARY KEY,          -- ȸ�� �ٹ� ��� ���� ������
    RESUME_NO              NUMBER         NULL REFERENCES RESUMES(RESUME_NO)
                                     ON DELETE CASCADE,        -- �̷¼� ��ȣ
    AREA_NO                NUMBER        NULL REFERENCES AREALIST(AREA_NO)
                                         ON DELETE CASCADE     -- �ٹ��� ��ȣ
);

--ȸ�� �ٹ� ��� ���� ���̺� ������
DROP SEQUENCE USERWANTEDWORKAREA_SEQ;
CREATE SEQUENCE USERWANTEDWORKAREA_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ������ ���
DROP TABLE APPLICANTLIST CASCADE CONSTRAINT;
CREATE TABLE APPLICANTLIST 
(
    APPLICANTLIST_NO         NUMBER PRIMARY KEY,                                     -- ������ ��ȣ
    USER_NO                  NUMBER NULL REFERENCES USERS(USER_NO)
                                ON DELETE CASCADE,                                   -- ȸ�� ��ȣ
    RESUME_NO                NUMBER         NULL REFERENCES RESUMES(RESUME_NO)
                                ON DELETE CASCADE,                                   -- �̷¼� ��ȣ
    RECRUITANNOUNCE_NO       NUMBER NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                ON DELETE CASCADE,                                   -- ��ü�����ȣ
    APPLICANTLIST_DATE       DATE DEFAULT SYSDATE,                                   -- ���� ��¥
    APPLICANTLIST_PAPERCHECK NUMBER DEFAULT 2 CHECK(APPLICANTLIST_PAPERCHECK IN(1,2)) -- ���� ��� ����
);

--������ ��� ���̺� ������
DROP SEQUENCE APPLICANTLIST_SEQ;
CREATE SEQUENCE APPLICANTLIST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��� �䱸 ���
DROP TABLE CORPWANTEDLANGUAGE CASCADE CONSTRAINT;
CREATE TABLE CORPWANTEDLANGUAGE 
(
    CORPWANTEDLANGUAGE_NO NUMBER    PRIMARY KEY,                -- ��� �䱸 ��� ������
    LANGUAGE_NO           NUMBER    NULL REFERENCES LANGUAGE(LANGUAGE_NO)
                                ON DELETE CASCADE,              -- ��� ��ȣ
    RECRUITANNOUNCE_NO    NUMBER    NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                ON DELETE CASCADE               -- ��ü�����ȣ
);

--��� �䱸 ��� ���̺� ������
DROP SEQUENCE CORPWANTEDLANGUAGE_SEQ;
CREATE SEQUENCE CORPWANTEDLANGUAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ����,����,Ȱ������
DROP TABLE AWARD CASCADE CONSTRAINT;
CREATE TABLE AWARD 
(
    AWARD_NO     NUMBER          PRIMARY KEY,             -- ��ȣ
    RESUME_NO    NUMBER           NULL REFERENCES RESUMES(RESUME_NO)
                             ON DELETE CASCADE,           -- �̷¼� ��ȣ
    AWARD_ABOUT  VARCHAR2(120)   NULL,                    -- ����
    AWARD_DATE   VARCHAR2(120)   NULL                     -- �Ⱓ
);

--����,����,Ȱ������ ���̺� ������
DROP SEQUENCE AWARD_SEQ;
CREATE SEQUENCE AWARD_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��»���
DROP TABLE CARRER CASCADE CONSTRAINT;
CREATE TABLE CARRER 
(
    CARRER_NO       NUMBER          PRIMARY KEY,          -- �����ڵ�
    CARRER_CORP     VARCHAR2(80)    NOT NULL,             -- ȸ��
    CARRER_DATE     VARCHAR2(80)    NULL,                 -- �ٹ��Ⱓ
    CARRER_WORK     VARCHAR2(120)   NULL,                 -- ������
    RESUME_NO       NUMBER           NULL REFERENCES RESUMES(RESUME_NO)
                                ON DELETE CASCADE         -- �̷¼� ��ȣ
);

--��»��� ���̺� ������
DROP SEQUENCE CARRER_SEQ;
CREATE SEQUENCE CARRER_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �ڰ���
DROP TABLE LICENCSE CASCADE CONSTRAINT;
CREATE TABLE LICENCSE 
(
    LICENCSE_NO          NUMBER         PRIMARY KEY,           -- �����ڵ� 
    RESUME_NO            NUMBER          NULL REFERENCES RESUMES(RESUME_NO)
                                    ON DELETE CASCADE,         -- �̷¼� ��ȣ
    LICENCSE_NAME        VARCHAR2(80)   NULL,                  -- �ڰ���
    LICENCSE_ISSUEPLACE  VARCHAR2(100)  NULL                   -- ����ó
);

--�ڰ��� ���̺� ������
DROP SEQUENCE LICENCSE_SEQ;
CREATE SEQUENCE LICENCSE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ä�����ϸ�ũ
DROP TABLE RECRUITANNOUNCEBOOKMARK CASCADE CONSTRAINT;
CREATE TABLE RECRUITANNOUNCEBOOKMARK 
(
    RECRUITANNOUNCEBOOKMARK_NO  NUMBER   PRIMARY KEY,                     -- �ϸ�ũ ��ȣ
    USER_NO                     NUMBER   NOT NULL REFERENCES USERS(USER_NO)
                                     ON DELETE CASCADE,                   -- ȸ�� ��ȣ
    RECRUITANNOUNCE_NO          NUMBER   NOT NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                     ON DELETE CASCADE                    -- ��ü�����ȣ
);

--ä�����ϸ�ũ ���̺� ������
DROP SEQUENCE RECRUITANNOUNCEBOOKMARK_SEQ;
CREATE SEQUENCE RECRUITANNOUNCEBOOKMARK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �ܱ���ɷ�
DROP TABLE FOREIGNLANGUAGESKILL CASCADE CONSTRAINT;
CREATE TABLE FOREIGNLANGUAGESKILL 
(
    FOREIGNLANGUAGESKILL_NO      NUMBER         PRIMARY KEY,        -- �ܱ���ɷ¹�ȣ
    RESUME_NO                    NUMBER         NOT NULL REFERENCES RESUMES(RESUME_NO)
                                            ON DELETE CASCADE,      -- �̷¼� ��ȣ
    FOREIGNLANGUAGESKILL_LANG    VARCHAR2(100)  NULL,               -- ���
    FOREIGNLANGUAGESKILL_EXPERT  VARCHAR2(150)  NULL                -- ����
);

--�ܱ���ɷ� ���̺� ������
DROP SEQUENCE FOREIGNLANGUAGESKILL_SEQ;
CREATE SEQUENCE FOREIGNLANGUAGESKILL_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ȸ��䱸����
DROP TABLE CORPWANTWORK CASCADE CONSTRAINT;
CREATE TABLE CORPWANTWORK 
(
    CORPWANTWORK_NO      NUMBER     PRIMARY KEY,                -- ȸ��䱸������ȣ
    WORKKIND_NO          NUMBER     NULL REFERENCES WORKKIND(WORKKIND_NO)
                                ON DELETE CASCADE,              -- ������ȣ
    RECRUITANNOUNCE_NO   NUMBER     NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                ON DELETE CASCADE               -- ��ü�����ȣ
);

--ȸ��䱸���� ���̺� ������
DROP SEQUENCE CORPWANTWORK_SEQ;
CREATE SEQUENCE CORPWANTWORK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ����������
DROP TABLE POSITIONSUGGEST CASCADE CONSTRAINT;		
CREATE TABLE POSITIONSUGGEST 
(
    POSITIONSUGGEST_NO        NUMBER        PRIMARY KEY,                               -- ���ȹ�ȣ
    POSITIONSUGGEST_TITLE     VARCHAR2(100) NOT NULL,                                  -- ����
    POSITIONSUGGEST_POSITION  VARCHAR2(100) NOT NULL,                                  -- ����������
    POSITIONSUGGEST_PRICE     NUMBER        DEFAULT 0 CHECK(POSITIONSUGGEST_PRICE>=0), -- ���ȿ���
    POSITIONSUGGEST_CONTENTS  CLOB          NOT NULL,                                  -- ���ȳ���
    POSITIONSUGGEST_REGDATE   DATE          DEFAULT SYSDATE,                           -- ������¥
    SEND_DELFLAG              NUMBER        DEFAULT 2 CHECK(SEND_DELFLAG IN(1,2)),     -- ����ȸ����������
    USER_NO                   NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                                        ON DELETE CASCADE                              -- (���)ȸ����ȣ
);

--���������� ���̺� ������
DROP SEQUENCE POSITIONSUGGEST_SEQ;
CREATE SEQUENCE POSITIONSUGGEST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ���������� �޴»��
DROP TABLE GETPOSITIONSUGGEST CASCADE CONSTRAINT;	
CREATE TABLE GETPOSITIONSUGGEST 
(
    GETPOSITIONSUGGEST_NO           NUMBER      PRIMARY KEY,                                            -- �������� ������
    GETPOSITIONSUGGEST_READFLAG     NUMBER      DEFAULT 2 CHECK(GETPOSITIONSUGGEST_READFLAG IN(1,2)),   -- �б⿩��
    GETPOSITIONSUGGEST_DELFLAG      NUMBER      DEFAULT 2 CHECK(GETPOSITIONSUGGEST_DELFLAG IN(1,2)),    -- ��������
    GETPOSITIONSUGGEST_IMPFLAG      NUMBER      DEFAULT 2 CHECK(GETPOSITIONSUGGEST_IMPFLAG IN(1,2)),    -- �߿����ȿ���
    POSITIONSUGGEST_NO              NUMBER      NOT NULL REFERENCES POSITIONSUGGEST(POSITIONSUGGEST_NO)
                                        ON DELETE CASCADE,                                              -- ���������ȹ�ȣ
    USER_NO                         NUMBER      NOT NULL REFERENCES USERS(USER_NO)
                                        ON DELETE CASCADE                                               -- �޴� ȸ����ȣ(����)
);

--���������� �޴»�� ���̺� ������
DROP SEQUENCE GETPOSITIONSUGGEST_SEQ;
CREATE SEQUENCE GETPOSITIONSUGGEST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ������
DROP TABLE MANAGERS CASCADE CONSTRAINT;
CREATE TABLE MANAGERS 
(
    MANAGER_NO          NUMBER         PRIMARY KEY,     -- �����ڹ�ȣ
    MANAGER_NAME        VARCHAR2(80)   NULL,            -- �����ڸ�
    MANAGER_ID          VARCHAR2(100)  NOT NULL,        -- ���������̵�
    MANAGER_PASSWORD    VARCHAR2(100)  NOT NULL         -- �����ں�й�ȣ
);

--������ ���̺� ������
DROP SEQUENCE MANAGERS_SEQ;
CREATE SEQUENCE MANAGERS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ������Ʈ����
DROP TABLE WEBSITE_MANAGE CASCADE CONSTRAINT;
CREATE TABLE WEBSITE_MANAGE 
(
    WEBSITEMANAGE_NO        NUMBER       PRIMARY KEY,                                        -- ������Ʈ������ȣ,
    MANAGER_NO              NUMBER       NULL REFERENCES MANAGERS(MANAGER_NO)
                                     ON DELETE CASCADE,                                      -- �����ڹ�ȣ
    WEBSITEMANAGE_KIND      VARCHAR2(80) NULL CHECK(WEBSITEMANAGE_KIND IN('I','T','P','V')), -- ����������
    WEBSITEMANAGE_TITLE     VARCHAR2(80) NOT NULL,                                           -- ����
    WEBSITEMANAGE_ABOUT     CLOB         NOT NULL,                                           -- ����
    WEBSITEMANAGE_DATE      DATE         DEFAULT SYSDATE,                                    -- �ۼ���
    WEBSITEMANAGE_VISITOR   NUMBER       DEFAULT 0                                           -- �湮�ڼ�
);

--������Ʈ���� ���̺� ������
DROP SEQUENCE WEBSITEMANAGE_SEQ;
CREATE SEQUENCE WEBSITEMANAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- QNA
DROP TABLE QA CASCADE CONSTRAINT;
CREATE TABLE QA 
(
    QA_NO           NUMBER       PRIMARY KEY,             -- qna��ȣ
    QA_WRITENO      NUMBER       NOT NULL,                -- �ۼ��ڹ�ȣ
    QA_WRITEKIND    NUMBER       NOT NULL,                -- �з���ȣ
    QA_TITLE        VARCHAR2(80) NOT NULL,                -- ����
    QA_ABOUT        CLOB         NOT NULL,                -- ����
    QA_DATE         DATE         DEFAULT SYSDATE,         -- �ۼ���
    QA_VIEW         NUMBER       DEFAULT 0,               -- ��ȸ��
    QA_GROUPNO      NUMBER       NULL,                    -- �۹�����ȣ
    QA_ORDERNO      NUMBER       NULL,                    -- �ܰ�
    QA_SORTNO       NUMBER       NULL,                    -- ��Ʈ�ѹ�
    QA_DELETECHECK  NUMBER       NULL                     -- ��������
);

--QNA ���̺� ������
DROP SEQUENCE QA_SEQ;
CREATE SEQUENCE QA_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- FAQ
DROP TABLE FAQ CASCADE CONSTRAINT;
CREATE TABLE FAQ 
(
    FAQ_NO      NUMBER          PRIMARY KEY,                -- faq��ȣ,
    MANAGER_NO  NUMBER          NOT NULL REFERENCES MANAGERS(MANAGER_NO)
                            ON DELETE CASCADE,              -- �����ڹ�ȣ
    FAQ_TITLE   VARCHAR2(100)   NOT NULL,                   -- ����
    FAQ_ABOUT   CLOB            NOT NULL,                   -- ����
    FAQ_VIEW    NUMBER          DEFAULT 0,                  -- ��ȸ��
    FAQ_DATE    DATE            DEFAULT SYSDATE             -- �ۼ���
);

--FAQ ���̺� ������
DROP SEQUENCE FAQ_SEQ;
CREATE SEQUENCE FAQ_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �з� (������ �������� ī�װ� ���̺�)
DROP TABLE CLASSIFICATIONS CASCADE CONSTRAINT;
CREATE TABLE CLASSIFICATIONS 
(
    CLASSIFICATION_NO   NUMBER       PRIMARY KEY,   -- �з� ��ȣ
    CLASSIFICATION_NAME VARCHAR2(80) NOT NULL       -- �з���
);

--�з� ���̺� ������
DROP SEQUENCE CLASSIFICATIONS_SEQ;
CREATE SEQUENCE CLASSIFICATIONS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��������
DROP TABLE NOTICE CASCADE CONSTRAINT;
CREATE TABLE NOTICE 
(
    NOTICE_NO           NUMBER        PRIMARY KEY,                     -- �������� ��ȣ
    NOTICE_TITLE        VARCHAR2(150) NULL,                            -- ����
    NOTICE_ABOUT        CLOB          NULL,                            -- ����
    NOTICE_DATE         DATE          DEFAULT SYSDATE,                 -- �ۼ���
    NOTICE_VIEW         NUMBER        DEFAULT 0 CHECK(NOTICE_VIEW>=0), -- ��ȸ��
    NOTICE_FILENAME     VARCHAR2(80)  NULL,                            -- ���ϸ�
    NOTICE_FILESIZE     VARCHAR2(80)  DEFAULT 0,                       -- ���ϻ�����
    NOTICE_ORIGINALNAME VARCHAR2(80)  NULL,                            -- ���� ���ϸ�
    CLASSIFICATION_NO   NUMBER        NULL REFERENCES CLASSIFICATIONS(CLASSIFICATION_NO)
                                  ON DELETE CASCADE,                   -- �з� ��ȣ
    MANAGER_NO          NUMBER        NULL REFERENCES MANAGERS(MANAGER_NO)
                                  ON DELETE CASCADE                    -- �����ڹ�ȣ
);

--�������� ���̺� ������
DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ����
DROP TABLE QUESTION CASCADE CONSTRAINT;
CREATE TABLE QUESTION 
(
    QUESTION_NO       NUMBER       PRIMARY KEY,                                -- ������ ��ȣ
    USER_NO           NUMBER       NOT NULL REFERENCES USERS(USER_NO)
                               ON DELETE CASCADE,                              -- ȸ�� ��ȣ
    WORKKIND_NO       NUMBER       NULL REFERENCES WORKKIND(WORKKIND_NO)
                               ON DELETE CASCADE,                              -- ������ȣ
    QUESTION_TITLE    VARCHAR2(80) NULL,                                       -- ����
    QUESTION_ABOUT    CLOB         NULL,                                       -- ��������
    QUESTION_VIEW     NUMBER       DEFAULT 0 CHECK(QUESTION_VIEW>=0) NOT NULL, -- ��ȸ��
    QUESTION_DATE     DATE         DEFAULT SYSDATE NOT NULL,                   -- �ۼ���
    QUESTION_IMMSAVE  NUMBER       CHECK(QUESTION_IMMSAVE IN('Y','N')),        -- �ӽ����忩��
    QUESTION_BOOKMARK NUMBER       NULL,                                       -- �ϸ�ũ
    QUESTION_NICNAME  VARCHAR2(80) NULL                                        -- �г���
);

--���� ���̺� ������
DROP SEQUENCE QUESTION_SEQ;
CREATE SEQUENCE QUESTION_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �ϸ�ũ
DROP TABLE BOOKMARK CASCADE CONSTRAINT;
CREATE TABLE BOOKMARK 
(
    BOOKMARK_NO NUMBER  PRIMARY KEY,              -- �ϸ�ũ ��ȣ
    USER_NO     NUMBER  NOT NULL REFERENCES USERS(USER_NO)
                    ON DELETE CASCADE,            -- ȸ�� ��ȣ
    QUESTION_NO NUMBER  NOT NULL REFERENCES QUESTION(QUESTION_NO)
                    ON DELETE CASCADE             -- ������ ��ȣ
);

--�ϸ�ũ ���̺� ������
DROP SEQUENCE BOOKMARK_SEQ;
CREATE SEQUENCE BOOKMARK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �亯
DROP TABLE COMMENTRESPOND CASCADE CONSTRAINT;
CREATE TABLE COMMENTRESPOND 
(
    COMMENTRESPOND_NO      NUMBER       PRIMARY KEY,                                          -- �亯��ȣ
    COMMENTRESPOND_ABOUT   CLOB         NOT NULL,                                             -- �亯����
    COMMENTRESPOND_DATE    DATE         DEFAULT SYSDATE NOT NULL,                             -- �ۼ���
    COMMENTRESPOND_LIKENUM NUMBER       DEFAULT 0 CHECK(COMMENTRESPOND_LIKENUM>=0) NOT NULL,  -- ��õ��
    COMMENTRESPOND_NICNAME VARCHAR2(80) NULL,                                                 -- �г���
    QUESTION_NO            NUMBER       NOT NULL REFERENCES QUESTION(QUESTION_NO)
                                    ON DELETE CASCADE,                                        -- ������ ��ȣ
    USER_NO                NUMBER       NOT NULL REFERENCES USERS(USER_NO)
                                    ON DELETE CASCADE                                         -- ȸ�� ��ȣ
);

--�亯 ���̺� ������
DROP SEQUENCE COMMENTRESPOND_SEQ;
CREATE SEQUENCE COMMENTRESPOND_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ���
DROP TABLE COMMENTS CASCADE CONSTRAINT;
CREATE TABLE COMMENTS 
(
    COMMENT_NO          NUMBER       PRIMARY KEY,              -- ��� ��ȣ
    COMMENT_ABOUT       CLOB         NOT NULL,                 -- ��۳���
    COMMENT_DATE        DATE         DEFAULT SYSDATE NOT NULL, -- �ۼ���
    COMMENT_GROUPNO     NUMBER       DEFAULT 0,                -- �׷��ȣ
    COMMENT_SORTNO      NUMBER       DEFAULT 0,                -- ���Ĺ�ȣ
    COMMENT_STEPNO      NUMBER       DEFAULT 0,                -- �ܰ��ȣ
    COMMENT_DELETECHECK NUMBER       DEFAULT 2,              -- ��������
    COMMENT_NICNAME     VARCHAR2(80) NULL,                     -- �г���
    COMMENTRESPOND_NO   NUMBER       NOT NULL REFERENCES COMMENTRESPOND(COMMENTRESPOND_NO)
                                 ON DELETE CASCADE,            -- �亯��ȣ
    QUESTION_NO         NUMBER       NOT NULL REFERENCES QUESTION(QUESTION_NO)
                                 ON DELETE CASCADE,            -- ������ ��ȣ
    USER_NO             NUMBER       NOT NULL REFERENCES USERS(USER_NO)
                                 ON DELETE CASCADE             -- ȸ�� ��ȣ
);

--��� ���̺� ������
DROP SEQUENCE COMMENTS_SEQ;
CREATE SEQUENCE COMMENTS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ����ī�װ�
DROP TABLE SERVICECATEGORY CASCADE CONSTRAINT;
CREATE TABLE SERVICECATEGORY 
(
    SERVICECATEGORY_NO   NUMBER       PRIMARY KEY,           -- ���� ī�װ���ȣ
    SERVICECATEGORY_NAME VARCHAR2(80) NOT NULL 
            CHECK(SERVICECATEGORY_NAME IN('�̷¼�','�ı⿭��','�ı����'
                                        ,'����1��','����2��'))  -- ���� ī�װ���
);

--����ī�װ� ���̺� ������
DROP SEQUENCE SERVICECATEGORY_SEQ;
CREATE SEQUENCE SERVICECATEGORY_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ���Ἥ��
DROP TABLE PAIDSERVICE CASCADE CONSTRAINT;
CREATE TABLE PAIDSERVICE 
(
    PAIDSERVICE_NO        VARCHAR2(150) PRIMARY KEY,                                    -- ���񽺹�ȣ
    PAIDSERVICE_NAME      VARCHAR2(80)  NOT NULL,                                       -- ���񽺸�
    PAIDSERVICE_EXP       CLOB          NULL,                                           -- ���񽺼���
    PAIDSERVICE_STARTDATE DATE          NULL,                                           -- (����)���񽺽�����
    PAIDSERVICE_ENDDATE   DATE          NULL,                                           -- (����)����������
    PAIDSERVICE_PRICE     NUMBER        DEFAULT 0 CHECK(PAIDSERVICE_PRICE>=0),          -- ���񽺰���
    PAIDSERVICE_APPROVE   NUMBER        DEFAULT 3 CHECK(PAIDSERVICE_APPROVE IN(1,2,3)), -- (����)���ο���
    SERVICECATEGORY_NO    NUMBER        NOT NULL REFERENCES SERVICECATEGORY(SERVICECATEGORY_NO)
                                     ON DELETE CASCADE                                  -- ���� ī�װ���ȣ
);

--���Ἥ�� ���̺� ������
DROP SEQUENCE PAIDSERVICE_SEQ;
CREATE SEQUENCE PAIDSERVICE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ��ٱ���
DROP TABLE SHOPPINGCART CASCADE CONSTRAINT;
CREATE TABLE SHOPPINGCART 
(
    SHOPPINGCART_NO     NUMBER         PRIMARY KEY,                      -- ��ٱ��Ϲ�ȣ
    USER_NO             NUMBER         NOT NULL REFERENCES USERS(USER_NO)
                                   ON DELETE CASCADE,                    -- ��� ȸ�� ��ȣ
    RESUME_NO           NUMBER          NOT NULL REFERENCES RESUMES(RESUME_NO)
                                   ON DELETE CASCADE,                    -- �̷¼� ��ȣ
    SHOPPINGCART_DATE   DATE           DEFAULT SYSDATE                   -- ������
);

--��ٱ��� ���̺� ������
DROP SEQUENCE SHOPPINGCART_SEQ;
CREATE SEQUENCE SHOPPINGCART_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- ����
DROP TABLE COUPON CASCADE CONSTRAINT;
CREATE TABLE COUPON 
(
    COUPON_NO           NUMBER       PRIMARY KEY,                    -- ������ȣ
    COUPON_NAME         VARCHAR2(60) NOT NULL,                       -- �����̸�
    COUPON_RATE         NUMBER       NOT NULL CHECK(COUPON_RATE>=0), -- �������η�
    COUPON_STARTDATE    DATE         NOT NULL,                       -- ����������
    COUPON_ENDDATE      DATE         NOT NULL                        -- ����������
);

--���� ���̺� ������
DROP SEQUENCE COUPON_SEQ;
CREATE SEQUENCE COUPON_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �ֹ�/����
DROP TABLE ORDERS CASCADE CONSTRAINT;
CREATE TABLE ORDERS
(
    ORDER_NO        NUMBER        PRIMARY KEY,                          -- �ֹ���ȣ
    USER_NO         NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                              ON DELETE CASCADE,                        -- ȸ�� ��ȣ
    ORDER_PAYKIND   VARCHAR2(100) NOT NULL,                             -- ��������
    COUPON_NO       NUMBER        NULL REFERENCES COUPON(COUPON_NO)
                              ON DELETE CASCADE,                        -- ������ȣ
    ORDER_DISCOUNT  NUMBER        DEFAULT 0 CHECK(ORDER_DISCOUNT>=0),   -- ���αݾ�
    ORDER_PAY       NUMBER        NULL CHECK(ORDER_PAY>=0),             -- �����ݾ�
    ORDER_DATE      DATE          DEFAULT SYSDATE                       -- �ֹ�����
);

--�ֹ�/���� ���̺� ������
DROP SEQUENCE ORDERS_SEQ;
CREATE SEQUENCE ORDERS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- �ֹ���
DROP TABLE ORDERDETAIL CASCADE CONSTRAINT;
CREATE TABLE ORDERDETAIL 
(
    ORDERDETAIL_NO  NUMBER      NOT NULL,                           -- ��ǰ��ȣ
    ORDER_NO        NUMBER      NOT NULL REFERENCES ORDERS(ORDER_NO)
                            ON DELETE CASCADE,                      -- �ֹ���ȣ
    SERVICECATEGORY_NO   NUMBER      NOT NULL REFERENCES SERVICECATEGORY(SERVICECATEGORY_NO)
                            ON DELETE CASCADE,                      -- ���� ī�װ���ȣ
    CONSTRAINT PK_ORDERDETAIL PRIMARY KEY(ORDERDETAIL_NO,ORDER_NO)  --����Ű
);

--�ֹ��� ���̺� ������
DROP SEQUENCE ORDERDETAIL_SEQ;
CREATE SEQUENCE ORDERDETAIL_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;




-- ����
DROP TABLE MESSAGE CASCADE CONSTRAINT;
CREATE TABLE MESSAGE (
    MESSAGE_NO          NUMBER          PRIMARY KEY,                                -- ������ȣ
    MESSAGE_TITLE       VARCHAR2(80)    NOT NULL,                                   -- ��������
    MESSAGE_CONTENT     CLOB            NOT NULL,                                   -- ��������
    MESSAGE_REGDATE     DATE            DEFAULT SYSDATE,                            -- ��¥
    SEND_DELFLAG        NUMBER          DEFAULT 2   CHECK(SEND_DELFLAG IN(1,2)),    -- ����ȸ����������
    USER_NO             NUMBER          NULL REFERENCES USERS(USER_NO)
                                    ON DELETE CASCADE                               -- ����ȸ����ȣ
);

--�������̺� ������
DROP SEQUENCE MESSAGE_SEQ;
CREATE SEQUENCE MESSAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

-- ���� �޴»��
DROP TABLE GETMESSAGE CASCADE CONSTRAINT;
CREATE TABLE GETMESSAGE (
		GETMESSAGE_NO           NUMBER PRIMARY KEY,                                     -- ����������
		GETMESSAGE_READFLAG     NUMBER DEFAULT 2 CHECK(GETMESSAGE_READFLAG IN(1,2)),    -- �б⿩��
		USER_NO                 NUMBER NULL REFERENCES USERS(USER_NO)
                            ON DELETE CASCADE,                                          -- �޴�ȸ����ȣ
		GETMESSAGE_DELFLAG      NUMBER DEFAULT 2 CHECK(GETMESSAGE_DELFLAG  IN(1,2)),    -- ��������
		GETMESSAGE_IMPFLAG      NUMBER DEFAULT 2 CHECK(GETMESSAGE_IMPFLAG  IN(1,2)),    -- �߿���������
		MESSAGE_NO              NUMBER NULL REFERENCES MESSAGE(MESSAGE_NO)
                            ON DELETE CASCADE                                           -- ������ȣ
);


-- ���� �޴»�� ���̺� ������
DROP SEQUENCE GETMESSAGE_SEQ;
CREATE SEQUENCE GETMESSAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

