-- 직무카테고리
DROP TABLE WORKKIND CASCADE CONSTRAINT;
CREATE TABLE WORKKIND 
(
    WORKKIND_NO     NUMBER          PRIMARY KEY,    -- 직무번호
    WORKKIND_NAME   VARCHAR2(80)    NULL            -- 직무이름
);

--직무카테고리 테이블 시퀀스
DROP SEQUENCE WORKKIND_SEQ;
CREATE SEQUENCE WORKKIND_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 회원 정보
DROP TABLE USERS CASCADE CONSTRAINT;
CREATE TABLE USERS 
(
    USER_NO         NUMBER        PRIMARY KEY,          -- 회원 번호
    USER_NAME       VARCHAR2(80)  NOT NULL,             -- 이름
    USER_ID         VARCHAR2(80)  NOT NULL,             -- 아이디
    USER_PASSWORD   VARCHAR2(80)  NOT NULL,             -- 비밀번호
    USER_EMAIL      VARCHAR2(50)  NULL,                 -- 이메일
    USER_ZIPCODE    VARCHAR2(80)  NULL,                 -- 우편번호
    USER_ADDRESS    VARCHAR2(150) NULL,                 -- 주소
    USER_HP         VARCHAR2(120) NULL,                 -- 연락처
    WORKKIND_NO     NUMBER        NULL REFERENCES WORKKIND(WORKKIND_NO)
                              ON DELETE CASCADE,        -- 직무번호
    USER_EXPERIENCE VARCHAR2(120) NULL,                 -- 경력
    USER_REGDATE    DATE          DEFAULT SYSDATE,      -- 가입일
    USER_ENDDATE    DATE          NULL,                 -- 탈퇴일
    USER_CORPCHECK  NUMBER        DEFAULT 1             -- 기업회원여부
);

--회원 정보 테이블 시퀀스
DROP SEQUENCE USERS_SEQ;
CREATE SEQUENCE USERS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 기업 정보
DROP TABLE CORP CASCADE CONSTRAINT;
CREATE TABLE CORP 
(
    CORP_NO             NUMBER        PRIMARY KEY,                       -- 기업 정보 번호
    USER_NO             NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                                  ON DELETE CASCADE,                          -- 회원 번호
    CORP_NAME           VARCHAR2(80)  NOT NULL ,                     -- 회사 이름
    CORP_INTRO          CLOB          NOT NULL,                          -- 회사 소개
    CORP_IMGURL         VARCHAR2(200) NOT NULL,                          -- 로고 이미지 URL
    CORP_AVRPAY         NUMBER        NULL,                              -- 평균 연봉
    CORP_KIND           VARCHAR2(150) NULL,                              -- 기업형태
    CORP_PNUMBER        NUMBER        NOT NULL CHECK(CORP_PNUMBER>=1),   -- 직원수
    CORP_HEADNAME       VARCHAR2(100) NOT NULL,                          -- 대표자명
    CORP_ZIPCODE        VARCHAR2(20)  NOT NULL,                          -- 우편번호
    CORP_ADDRESS1       VARCHAR2(150) NOT NULL,                          -- 대표 주소1
    COL_ADDRESS2        VARCHAR2(150) NULL,                              -- 대표 주소2
    CORP_CORPADDNUMBER  VARCHAR2(200) NOT NULL,                          -- 사업자 등록번호
    CORP_INDUSTRY       VARCHAR2(120) NOT NULL,                          -- 산업군
    CORP_STARTDATE      DATE          NOT NULL,                          -- 설립 연도
    CORP_WEBADDRESS     VARCHAR2(200) NULL,                              -- 웹사이트 주소
    CORP_TEL            VARCHAR2(60)  NOT NULL,                          -- 대표번호
    CORP_OKCHECK        NUMBER        DEFAULT 0                          -- 승인여부
);

--기업 정보 테이블 시퀀스
DROP SEQUENCE CORP_SEQ;
CREATE SEQUENCE CORP_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 채용공고
DROP TABLE RECRUITANNOUNCE CASCADE CONSTRAINT;
CREATE TABLE RECRUITANNOUNCE 
(
    RECRUITANNOUNCE_NO            NUMBER        PRIMARY KEY,            -- 전체공고번호
    USER_NO                       NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                                            ON DELETE CASCADE,          -- 기업 회원 번호
    RECRUITANNOUNCE_TITLE         VARCHAR2(100) NULL,                   -- 채용 공고 제목
    RECRUITANNOUNCE_STARTDATE     DATE          DEFAULT SYSDATE,        -- 채용시작일
    RECRUITANNOUNCE_ENDDATE       DATE          NOT NULL,               -- 채용마감일
    RECRUITANNOUNCE_SCARRER       VARCHAR2(100) NULL,                   -- 요약_경력
    RECRUITANNOUNCE_SWORKKIND     VARCHAR2(100) NOT NULL,               -- 요약_고용형태
    RECRUITANNOUNCE_SPAY          VARCHAR2(100) NULL,                   -- 요약_급여
    RECRUITANNOUNCE_SKILL         VARCHAR2(100) NOT NULL,               -- 요약_스킬
    RECRUITANNOUNCE_WORKKIND      CLOB          NOT NULL,               -- 채용형태
    RECRUITANNOUNCE_CORPINTRO     CLOB          NULL,                   -- 기업소개
    RECRUITANNOUNCE_WORK          CLOB          NULL,                   -- 주요업무
    RECRUITANNOUNCE_WANTEDCARRER  CLOB          NOT NULL,               -- 자격요건
    RECRUITANNOUNCE_UPCHECKCARRER CLOB          NULL,                   -- 우대사항
    RECRUITANNOUNCE_HIRESTEP      CLOB          NULL,                   -- 채용절차
    RECRUITANNOUNCE_ELSE          CLOB          NULL,                   -- 기타
    RECRUITANNOUNCE_UPCHECK       NUMBER        DEFAULT 2 NOT NULL,     -- 공고승인여부
    RECRUITANNOUNCE_ENDCHECK      NUMBER        DEFAULT 2  NOT NULL,    -- 공고마감여부
    RECRUITANNOUNCE_LINK          VARCHAR2(200) NULL                    -- 회사링크
);

--채용공고 테이블 시퀀스
DROP SEQUENCE RECRUITANNOUNCE_SEQ;
CREATE SEQUENCE RECRUITANNOUNCE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 입사지원제한
DROP TABLE PROHIBITJOIN CASCADE CONSTRAINT;
CREATE TABLE PROHIBITJOIN 
(
    PROHIBITJOIN_NO     NUMBER  PRIMARY KEY,             -- 제한자 시퀀스
    USER_PESONAL_NO     NUMBER  NULL REFERENCES USERS(USER_NO)
                            ON DELETE CASCADE,           -- 개인 회원 번호
    USER_CORP_NO        NUMBER  NULL REFERENCES USERS(USER_NO)
                            ON DELETE CASCADE            -- 기업 회원 번호
);

--입사지원제한 테이블 시퀀스
DROP SEQUENCE PROHIBITJOIN_SEQ;
CREATE SEQUENCE PROHIBITJOIN_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 지역
DROP TABLE AREALIST CASCADE CONSTRAINT;
CREATE TABLE AREALIST 
(
    AREA_NO      NUMBER         PRIMARY KEY,          -- 근무지 번호
    AREA_ADD1    VARCHAR2(120)  NULL,                 -- 근무지역 시/도
    AREA_ADD2    VARCHAR2(120)  NULL                  -- 근무지역 구/군
);

--지역 테이블 시퀀스
DROP SEQUENCE AREALIST_SEQ;
CREATE SEQUENCE AREALIST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 기업 요구 근무지
DROP TABLE CORPWANTEDAREA CASCADE CONSTRAINT;
CREATE TABLE CORPWANTEDAREA 
(
    CORPWANTEDAREA_NO  NUMBER  PRIMARY KEY,              -- 기업 요구 근무지 시퀀스
    AREA_NO            NUMBER  NULL REFERENCES AREALIST(AREA_NO)
                           ON DELETE CASCADE,            -- 근무지 번호
    RECRUITANNOUNCE_NO NUMBER  NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                            ON DELETE CASCADE            -- 전체공고번호
);

--기업 요구 근무지 테이블 시퀀스
DROP SEQUENCE CORPWANTEDAREA_SEQ;
CREATE SEQUENCE CORPWANTEDAREA_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 기업 이미지
DROP TABLE CORPIMG CASCADE CONSTRAINT;
CREATE TABLE CORPIMG 
(
    CORPIMG_NO  NUMBER          PRIMARY KEY,                        -- 이미지 번호
    CORP_NO     NUMBER          NOT NULL REFERENCES CORP(CORP_NO)
                            ON DELETE CASCADE,                      -- 기업 정보 번호
    CORPIMG_URL VARCHAR2(300)   NOT NULL                            -- 이미지 URL
);

--기업 이미지 테이블 시퀀스
DROP SEQUENCE CORPIMG_SEQ;
CREATE SEQUENCE CORPIMG_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 기업리뷰
DROP TABLE CORPREVIEW CASCADE CONSTRAINT;
CREATE TABLE CORPREVIEW 
(
    CORPREVIEW_NO          NUMBER        PRIMARY KEY,                       -- 리뷰 번호
    USER_NO                NUMBER        NOT NULL REFERENCES USERS(USER_NO), -- 회원 번호
    CORP_NO                NUMBER        NOT NULL REFERENCES CORP(CORP_NO)
                                     ON DELETE CASCADE,                     -- 기업 정보 번호
    CORPREVIEW_DATE        DATE          DEFAULT SYSDATE,                   -- 작성일
    CORPREVIEW_ONELINE     VARCHAR2(100) NOT NULL,                          -- 한 줄 평가
    CORPREVIEW_GOOD        VARCHAR2(500) NOT NULL,                          -- 장점
    CORPREVIEW_BAD         VARCHAR2(500) NOT NULL,                          -- 단점
    CORPREVIEW_WANT        VARCHAR2(500) NOT NULL,                          -- 바라는 점
    CORPREVIEW_RATE        NUMBER        NULL,                              -- 기업 점수
    CORPREVIEW_DELETECHECK NUMBER        NULL                               -- 삭제 여부
);

--기업리뷰 테이블 시퀀스
DROP SEQUENCE CORPREVIEW_SEQ;
CREATE SEQUENCE CORPREVIEW_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 이력서
DROP TABLE RESUMES CASCADE CONSTRAINT;
CREATE TABLE RESUMES 
(
    RESUME_NO               NUMBER         PRIMARY KEY,              -- 이력서 번호
    USER_NO                 NUMBER        NULL REFERENCES USERS(USER_NO)
                                      ON DELETE CASCADE,            -- 회원 번호
    RESUME_TITLE            VARCHAR2(80)  NOT NULL,                 -- 제목
    RESUME_FINALEDUCATION   VARCHAR2(120) NULL,                     -- 최종학력
    RESUME_SELFINTRO        CLOB          NULL,                     -- 자기소개
    RESUME_DATE             DATE          DEFAULT SYSDATE,          -- 등록일자
    RESUME_FILENAME         VARCHAR2(80)  NULL,                     -- 파일이름
    RESUME_FILESIZE         VARCHAR2(80)  NULL,                     -- 파일사이즈
    RESUME_FILEORIGINALNAME VARCHAR2(120) NULL,                     -- 파일 오리지날 이름
    RESUME_RESUMEOPENCHECK  NUMBER        DEFAULT 1                 -- 이력서 승인 여부
);

--이력서 테이블 시퀀스
DROP SEQUENCE RESUMES_SEQ;
CREATE SEQUENCE RESUMES_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 언어 목록
DROP TABLE LANGUAGE CASCADE CONSTRAINT;
CREATE TABLE LANGUAGE 
(
    LANGUAGE_NO     NUMBER        PRIMARY KEY,  -- 언어 번호
    LANGUAGE_NAME   VARCHAR2(150) NULL          -- 언어 이름
);

--언어 목록 테이블 시퀀스
DROP SEQUENCE LANGUAGE_SEQ;
CREATE SEQUENCE LANGUAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 회원 사용 언어
DROP TABLE CORPUSELANGUAGE CASCADE CONSTRAINT;
CREATE TABLE CORPUSELANGUAGE 
(
    CORPUSELANGUAGE_NO  NUMBER        PRIMARY KEY,              -- 회원 사용 언어 시퀀스
    LANGUAGE_NO         NUMBER        NULL REFERENCES LANGUAGE(LANGUAGE_NO)
                                  ON DELETE CASCADE,            -- 언어 번호
    RESUME_NO           NUMBER NULL REFERENCES RESUMES(RESUME_NO)
                                      ON DELETE CASCADE         -- 이력서 번호
);

--회원 사용 언어 테이블 시퀀스
DROP SEQUENCE CORPUSELANGUAGE_SEQ;
CREATE SEQUENCE CORPUSELANGUAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 회원 근무 희망 지역
DROP TABLE USERWANTEDWORKAREA CASCADE CONSTRAINT;
CREATE TABLE USERWANTEDWORKAREA 
(
    USERWANTEDWORKAREA_NO  NUMBER        PRIMARY KEY,          -- 회원 근무 희망 지역 시퀀스
    RESUME_NO              NUMBER         NULL REFERENCES RESUMES(RESUME_NO)
                                     ON DELETE CASCADE,        -- 이력서 번호
    AREA_NO                NUMBER        NULL REFERENCES AREALIST(AREA_NO)
                                         ON DELETE CASCADE     -- 근무지 번호
);

--회원 근무 희망 지역 테이블 시퀀스
DROP SEQUENCE USERWANTEDWORKAREA_SEQ;
CREATE SEQUENCE USERWANTEDWORKAREA_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 지원자 목록
DROP TABLE APPLICANTLIST CASCADE CONSTRAINT;
CREATE TABLE APPLICANTLIST 
(
    APPLICANTLIST_NO         NUMBER PRIMARY KEY,                                     -- 지원자 번호
    USER_NO                  NUMBER NULL REFERENCES USERS(USER_NO)
                                ON DELETE CASCADE,                                   -- 회원 번호
    RESUME_NO                NUMBER         NULL REFERENCES RESUMES(RESUME_NO)
                                ON DELETE CASCADE,                                   -- 이력서 번호
    RECRUITANNOUNCE_NO       NUMBER NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                ON DELETE CASCADE,                                   -- 전체공고번호
    APPLICANTLIST_DATE       DATE DEFAULT SYSDATE,                                   -- 지원 날짜
    APPLICANTLIST_PAPERCHECK NUMBER DEFAULT 2 CHECK(APPLICANTLIST_PAPERCHECK IN(1,2)) -- 서류 통과 여부
);

--지원자 목록 테이블 시퀀스
DROP SEQUENCE APPLICANTLIST_SEQ;
CREATE SEQUENCE APPLICANTLIST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 기업 요구 언어
DROP TABLE CORPWANTEDLANGUAGE CASCADE CONSTRAINT;
CREATE TABLE CORPWANTEDLANGUAGE 
(
    CORPWANTEDLANGUAGE_NO NUMBER    PRIMARY KEY,                -- 기업 요구 언어 시퀀스
    LANGUAGE_NO           NUMBER    NULL REFERENCES LANGUAGE(LANGUAGE_NO)
                                ON DELETE CASCADE,              -- 언어 번호
    RECRUITANNOUNCE_NO    NUMBER    NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                ON DELETE CASCADE               -- 전체공고번호
);

--기업 요구 언어 테이블 시퀀스
DROP SEQUENCE CORPWANTEDLANGUAGE_SEQ;
CREATE SEQUENCE CORPWANTEDLANGUAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 수상,수료,활동내역
DROP TABLE AWARD CASCADE CONSTRAINT;
CREATE TABLE AWARD 
(
    AWARD_NO     NUMBER          PRIMARY KEY,             -- 번호
    RESUME_NO    NUMBER           NULL REFERENCES RESUMES(RESUME_NO)
                             ON DELETE CASCADE,           -- 이력서 번호
    AWARD_ABOUT  VARCHAR2(120)   NULL,                    -- 내역
    AWARD_DATE   VARCHAR2(120)   NULL                     -- 기간
);

--수상,수료,활동내역 테이블 시퀀스
DROP SEQUENCE AWARD_SEQ;
CREATE SEQUENCE AWARD_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 경력사항
DROP TABLE CARRER CASCADE CONSTRAINT;
CREATE TABLE CARRER 
(
    CARRER_NO       NUMBER          PRIMARY KEY,          -- 구분코드
    CARRER_CORP     VARCHAR2(80)    NOT NULL,             -- 회사
    CARRER_DATE     VARCHAR2(80)    NULL,                 -- 근무기간
    CARRER_WORK     VARCHAR2(120)   NULL,                 -- 담당업무
    RESUME_NO       NUMBER           NULL REFERENCES RESUMES(RESUME_NO)
                                ON DELETE CASCADE         -- 이력서 번호
);

--경력사항 테이블 시퀀스
DROP SEQUENCE CARRER_SEQ;
CREATE SEQUENCE CARRER_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 자격증
DROP TABLE LICENCSE CASCADE CONSTRAINT;
CREATE TABLE LICENCSE 
(
    LICENCSE_NO          NUMBER         PRIMARY KEY,           -- 구분코드 
    RESUME_NO            NUMBER          NULL REFERENCES RESUMES(RESUME_NO)
                                    ON DELETE CASCADE,         -- 이력서 번호
    LICENCSE_NAME        VARCHAR2(80)   NULL,                  -- 자격증
    LICENCSE_ISSUEPLACE  VARCHAR2(100)  NULL                   -- 발행처
);

--자격증 테이블 시퀀스
DROP SEQUENCE LICENCSE_SEQ;
CREATE SEQUENCE LICENCSE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 채용공고북마크
DROP TABLE RECRUITANNOUNCEBOOKMARK CASCADE CONSTRAINT;
CREATE TABLE RECRUITANNOUNCEBOOKMARK 
(
    RECRUITANNOUNCEBOOKMARK_NO  NUMBER   PRIMARY KEY,                     -- 북마크 번호
    USER_NO                     NUMBER   NOT NULL REFERENCES USERS(USER_NO)
                                     ON DELETE CASCADE,                   -- 회원 번호
    RECRUITANNOUNCE_NO          NUMBER   NOT NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                     ON DELETE CASCADE                    -- 전체공고번호
);

--채용공고북마크 테이블 시퀀스
DROP SEQUENCE RECRUITANNOUNCEBOOKMARK_SEQ;
CREATE SEQUENCE RECRUITANNOUNCEBOOKMARK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 외국어능력
DROP TABLE FOREIGNLANGUAGESKILL CASCADE CONSTRAINT;
CREATE TABLE FOREIGNLANGUAGESKILL 
(
    FOREIGNLANGUAGESKILL_NO      NUMBER         PRIMARY KEY,        -- 외국어능력번호
    RESUME_NO                    NUMBER         NOT NULL REFERENCES RESUMES(RESUME_NO)
                                            ON DELETE CASCADE,      -- 이력서 번호
    FOREIGNLANGUAGESKILL_LANG    VARCHAR2(100)  NULL,               -- 언어
    FOREIGNLANGUAGESKILL_EXPERT  VARCHAR2(150)  NULL                -- 수준
);

--외국어능력 테이블 시퀀스
DROP SEQUENCE FOREIGNLANGUAGESKILL_SEQ;
CREATE SEQUENCE FOREIGNLANGUAGESKILL_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 회사요구직무
DROP TABLE CORPWANTWORK CASCADE CONSTRAINT;
CREATE TABLE CORPWANTWORK 
(
    CORPWANTWORK_NO      NUMBER     PRIMARY KEY,                -- 회사요구직무번호
    WORKKIND_NO          NUMBER     NULL REFERENCES WORKKIND(WORKKIND_NO)
                                ON DELETE CASCADE,              -- 직무번호
    RECRUITANNOUNCE_NO   NUMBER     NULL REFERENCES RECRUITANNOUNCE(RECRUITANNOUNCE_NO)
                                ON DELETE CASCADE               -- 전체공고번호
);

--회사요구직무 테이블 시퀀스
DROP SEQUENCE CORPWANTWORK_SEQ;
CREATE SEQUENCE CORPWANTWORK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 포지션제안
DROP TABLE POSITIONSUGGEST CASCADE CONSTRAINT;		
CREATE TABLE POSITIONSUGGEST 
(
    POSITIONSUGGEST_NO        NUMBER        PRIMARY KEY,                               -- 제안번호
    POSITIONSUGGEST_TITLE     VARCHAR2(100) NOT NULL,                                  -- 제목
    POSITIONSUGGEST_POSITION  VARCHAR2(100) NOT NULL,                                  -- 제안포지션
    POSITIONSUGGEST_PRICE     NUMBER        DEFAULT 0 CHECK(POSITIONSUGGEST_PRICE>=0), -- 제안연봉
    POSITIONSUGGEST_CONTENTS  CLOB          NOT NULL,                                  -- 제안내용
    POSITIONSUGGEST_REGDATE   DATE          DEFAULT SYSDATE,                           -- 보낸날짜
    SEND_DELFLAG              NUMBER        DEFAULT 2 CHECK(SEND_DELFLAG IN(1,2)),     -- 보낸회원삭제여부
    USER_NO                   NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                                        ON DELETE CASCADE                              -- (기업)회원번호
);

--포지션제안 테이블 시퀀스
DROP SEQUENCE POSITIONSUGGEST_SEQ;
CREATE SEQUENCE POSITIONSUGGEST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 포지션제안 받는사람
DROP TABLE GETPOSITIONSUGGEST CASCADE CONSTRAINT;	
CREATE TABLE GETPOSITIONSUGGEST 
(
    GETPOSITIONSUGGEST_NO           NUMBER      PRIMARY KEY,                                            -- 받은제안 시퀀스
    GETPOSITIONSUGGEST_READFLAG     NUMBER      DEFAULT 2 CHECK(GETPOSITIONSUGGEST_READFLAG IN(1,2)),   -- 읽기여부
    GETPOSITIONSUGGEST_DELFLAG      NUMBER      DEFAULT 2 CHECK(GETPOSITIONSUGGEST_DELFLAG IN(1,2)),    -- 삭제여부
    GETPOSITIONSUGGEST_IMPFLAG      NUMBER      DEFAULT 2 CHECK(GETPOSITIONSUGGEST_IMPFLAG IN(1,2)),    -- 중요제안여부
    POSITIONSUGGEST_NO              NUMBER      NOT NULL REFERENCES POSITIONSUGGEST(POSITIONSUGGEST_NO)
                                        ON DELETE CASCADE,                                              -- 포지션제안번호
    USER_NO                         NUMBER      NOT NULL REFERENCES USERS(USER_NO)
                                        ON DELETE CASCADE                                               -- 받는 회원번호(개인)
);

--포지션제안 받는사람 테이블 시퀀스
DROP SEQUENCE GETPOSITIONSUGGEST_SEQ;
CREATE SEQUENCE GETPOSITIONSUGGEST_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 관리자
DROP TABLE MANAGERS CASCADE CONSTRAINT;
CREATE TABLE MANAGERS 
(
    MANAGER_NO          NUMBER         PRIMARY KEY,     -- 관리자번호
    MANAGER_NAME        VARCHAR2(80)   NULL,            -- 관리자명
    MANAGER_ID          VARCHAR2(100)  NOT NULL,        -- 관리자이이디
    MANAGER_PASSWORD    VARCHAR2(100)  NOT NULL         -- 관리자비밀번호
);

--관리자 테이블 시퀀스
DROP SEQUENCE MANAGERS_SEQ;
CREATE SEQUENCE MANAGERS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 웹사이트관리
DROP TABLE WEBSITE_MANAGE CASCADE CONSTRAINT;
CREATE TABLE WEBSITE_MANAGE 
(
    WEBSITEMANAGE_NO        NUMBER       PRIMARY KEY,                                        -- 웹사이트관리번호,
    MANAGER_NO              NUMBER       NULL REFERENCES MANAGERS(MANAGER_NO)
                                     ON DELETE CASCADE,                                      -- 관리자번호
    WEBSITEMANAGE_KIND      VARCHAR2(80) NULL CHECK(WEBSITEMANAGE_KIND IN('I','T','P','V')), -- 패이지종류
    WEBSITEMANAGE_TITLE     VARCHAR2(80) NOT NULL,                                           -- 제목
    WEBSITEMANAGE_ABOUT     CLOB         NOT NULL,                                           -- 내용
    WEBSITEMANAGE_DATE      DATE         DEFAULT SYSDATE,                                    -- 작성일
    WEBSITEMANAGE_VISITOR   NUMBER       DEFAULT 0                                           -- 방문자수
);

--웹사이트관리 테이블 시퀀스
DROP SEQUENCE WEBSITEMANAGE_SEQ;
CREATE SEQUENCE WEBSITEMANAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- QNA
DROP TABLE QA CASCADE CONSTRAINT;
CREATE TABLE QA 
(
    QA_NO           NUMBER       PRIMARY KEY,             -- qna번호
    QA_WRITENO      NUMBER       NOT NULL,                -- 작성자번호
    QA_WRITEKIND    NUMBER       NOT NULL,                -- 분류번호
    QA_TITLE        VARCHAR2(80) NOT NULL,                -- 제목
    QA_ABOUT        CLOB         NOT NULL,                -- 내용
    QA_DATE         DATE         DEFAULT SYSDATE,         -- 작성일
    QA_VIEW         NUMBER       DEFAULT 0,               -- 조회수
    QA_GROUPNO      NUMBER       NULL,                    -- 글묶음번호
    QA_ORDERNO      NUMBER       NULL,                    -- 단계
    QA_SORTNO       NUMBER       NULL,                    -- 소트넘버
    QA_DELETECHECK  NUMBER       NULL                     -- 삭제여부
);

--QNA 테이블 시퀀스
DROP SEQUENCE QA_SEQ;
CREATE SEQUENCE QA_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- FAQ
DROP TABLE FAQ CASCADE CONSTRAINT;
CREATE TABLE FAQ 
(
    FAQ_NO      NUMBER          PRIMARY KEY,                -- faq번호,
    MANAGER_NO  NUMBER          NOT NULL REFERENCES MANAGERS(MANAGER_NO)
                            ON DELETE CASCADE,              -- 관리자번호
    FAQ_TITLE   VARCHAR2(100)   NOT NULL,                   -- 제목
    FAQ_ABOUT   CLOB            NOT NULL,                   -- 내용
    FAQ_VIEW    NUMBER          DEFAULT 0,                  -- 조회수
    FAQ_DATE    DATE            DEFAULT SYSDATE             -- 작성일
);

--FAQ 테이블 시퀀스
DROP SEQUENCE FAQ_SEQ;
CREATE SEQUENCE FAQ_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 분류 (관리자 공지사항 카테고리 테이블)
DROP TABLE CLASSIFICATIONS CASCADE CONSTRAINT;
CREATE TABLE CLASSIFICATIONS 
(
    CLASSIFICATION_NO   NUMBER       PRIMARY KEY,   -- 분류 번호
    CLASSIFICATION_NAME VARCHAR2(80) NOT NULL       -- 분류명
);

--분류 테이블 시퀀스
DROP SEQUENCE CLASSIFICATIONS_SEQ;
CREATE SEQUENCE CLASSIFICATIONS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 공지사항
DROP TABLE NOTICE CASCADE CONSTRAINT;
CREATE TABLE NOTICE 
(
    NOTICE_NO           NUMBER        PRIMARY KEY,                     -- 공지사항 번호
    NOTICE_TITLE        VARCHAR2(150) NULL,                            -- 제목
    NOTICE_ABOUT        CLOB          NULL,                            -- 내용
    NOTICE_DATE         DATE          DEFAULT SYSDATE,                 -- 작성일
    NOTICE_VIEW         NUMBER        DEFAULT 0 CHECK(NOTICE_VIEW>=0), -- 조회수
    NOTICE_FILENAME     VARCHAR2(80)  NULL,                            -- 파일명
    NOTICE_FILESIZE     VARCHAR2(80)  DEFAULT 0,                       -- 파일사이즈
    NOTICE_ORIGINALNAME VARCHAR2(80)  NULL,                            -- 기존 파일명
    CLASSIFICATION_NO   NUMBER        NULL REFERENCES CLASSIFICATIONS(CLASSIFICATION_NO)
                                  ON DELETE CASCADE,                   -- 분류 번호
    MANAGER_NO          NUMBER        NULL REFERENCES MANAGERS(MANAGER_NO)
                                  ON DELETE CASCADE                    -- 관리자번호
);

--공지사항 테이블 시퀀스
DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 질문
DROP TABLE QUESTION CASCADE CONSTRAINT;
CREATE TABLE QUESTION 
(
    QUESTION_NO       NUMBER       PRIMARY KEY,                                -- 질문글 번호
    USER_NO           NUMBER       NOT NULL REFERENCES USERS(USER_NO)
                               ON DELETE CASCADE,                              -- 회원 번호
    WORKKIND_NO       NUMBER       NULL REFERENCES WORKKIND(WORKKIND_NO)
                               ON DELETE CASCADE,                              -- 직무번호
    QUESTION_TITLE    VARCHAR2(80) NULL,                                       -- 제목
    QUESTION_ABOUT    CLOB         NULL,                                       -- 질문내용
    QUESTION_VIEW     NUMBER       DEFAULT 0 CHECK(QUESTION_VIEW>=0) NOT NULL, -- 조회수
    QUESTION_DATE     DATE         DEFAULT SYSDATE NOT NULL,                   -- 작성일
    QUESTION_IMMSAVE  NUMBER       CHECK(QUESTION_IMMSAVE IN('Y','N')),        -- 임시저장여부
    QUESTION_BOOKMARK NUMBER       NULL,                                       -- 북마크
    QUESTION_NICNAME  VARCHAR2(80) NULL                                        -- 닉네임
);

--질문 테이블 시퀀스
DROP SEQUENCE QUESTION_SEQ;
CREATE SEQUENCE QUESTION_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 북마크
DROP TABLE BOOKMARK CASCADE CONSTRAINT;
CREATE TABLE BOOKMARK 
(
    BOOKMARK_NO NUMBER  PRIMARY KEY,              -- 북마크 번호
    USER_NO     NUMBER  NOT NULL REFERENCES USERS(USER_NO)
                    ON DELETE CASCADE,            -- 회원 번호
    QUESTION_NO NUMBER  NOT NULL REFERENCES QUESTION(QUESTION_NO)
                    ON DELETE CASCADE             -- 질문글 번호
);

--북마크 테이블 시퀀스
DROP SEQUENCE BOOKMARK_SEQ;
CREATE SEQUENCE BOOKMARK_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 답변
DROP TABLE COMMENTRESPOND CASCADE CONSTRAINT;
CREATE TABLE COMMENTRESPOND 
(
    COMMENTRESPOND_NO      NUMBER       PRIMARY KEY,                                          -- 답변번호
    COMMENTRESPOND_ABOUT   CLOB         NOT NULL,                                             -- 답변내용
    COMMENTRESPOND_DATE    DATE         DEFAULT SYSDATE NOT NULL,                             -- 작성일
    COMMENTRESPOND_LIKENUM NUMBER       DEFAULT 0 CHECK(COMMENTRESPOND_LIKENUM>=0) NOT NULL,  -- 추천수
    COMMENTRESPOND_NICNAME VARCHAR2(80) NULL,                                                 -- 닉네임
    QUESTION_NO            NUMBER       NOT NULL REFERENCES QUESTION(QUESTION_NO)
                                    ON DELETE CASCADE,                                        -- 질문글 번호
    USER_NO                NUMBER       NOT NULL REFERENCES USERS(USER_NO)
                                    ON DELETE CASCADE                                         -- 회원 번호
);

--답변 테이블 시퀀스
DROP SEQUENCE COMMENTRESPOND_SEQ;
CREATE SEQUENCE COMMENTRESPOND_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 댓글
DROP TABLE COMMENTS CASCADE CONSTRAINT;
CREATE TABLE COMMENTS 
(
    COMMENT_NO          NUMBER       PRIMARY KEY,              -- 댓글 번호
    COMMENT_ABOUT       CLOB         NOT NULL,                 -- 댓글내용
    COMMENT_DATE        DATE         DEFAULT SYSDATE NOT NULL, -- 작성일
    COMMENT_GROUPNO     NUMBER       DEFAULT 0,                -- 그룹번호
    COMMENT_SORTNO      NUMBER       DEFAULT 0,                -- 정렬번호
    COMMENT_STEPNO      NUMBER       DEFAULT 0,                -- 단계번호
    COMMENT_DELETECHECK NUMBER       DEFAULT 2,              -- 삭제여부
    COMMENT_NICNAME     VARCHAR2(80) NULL,                     -- 닉네임
    COMMENTRESPOND_NO   NUMBER       NOT NULL REFERENCES COMMENTRESPOND(COMMENTRESPOND_NO)
                                 ON DELETE CASCADE,            -- 답변번호
    QUESTION_NO         NUMBER       NOT NULL REFERENCES QUESTION(QUESTION_NO)
                                 ON DELETE CASCADE,            -- 질문글 번호
    USER_NO             NUMBER       NOT NULL REFERENCES USERS(USER_NO)
                                 ON DELETE CASCADE             -- 회원 번호
);

--댓글 테이블 시퀀스
DROP SEQUENCE COMMENTS_SEQ;
CREATE SEQUENCE COMMENTS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 서비스카테고리
DROP TABLE SERVICECATEGORY CASCADE CONSTRAINT;
CREATE TABLE SERVICECATEGORY 
(
    SERVICECATEGORY_NO   NUMBER       PRIMARY KEY,           -- 서비스 카테고리번호
    SERVICECATEGORY_NAME VARCHAR2(80) NOT NULL 
            CHECK(SERVICECATEGORY_NAME IN('이력서','후기열람','후기삭제'
                                        ,'광고1급','광고2급'))  -- 서비스 카테고리명
);

--서비스카테고리 테이블 시퀀스
DROP SEQUENCE SERVICECATEGORY_SEQ;
CREATE SEQUENCE SERVICECATEGORY_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 유료서비스
DROP TABLE PAIDSERVICE CASCADE CONSTRAINT;
CREATE TABLE PAIDSERVICE 
(
    PAIDSERVICE_NO        VARCHAR2(150) PRIMARY KEY,                                    -- 서비스번호
    PAIDSERVICE_NAME      VARCHAR2(80)  NOT NULL,                                       -- 서비스명
    PAIDSERVICE_EXP       CLOB          NULL,                                           -- 서비스설명
    PAIDSERVICE_STARTDATE DATE          NULL,                                           -- (광고)서비스시작일
    PAIDSERVICE_ENDDATE   DATE          NULL,                                           -- (광고)서비스종료일
    PAIDSERVICE_PRICE     NUMBER        DEFAULT 0 CHECK(PAIDSERVICE_PRICE>=0),          -- 서비스가격
    PAIDSERVICE_APPROVE   NUMBER        DEFAULT 3 CHECK(PAIDSERVICE_APPROVE IN(1,2,3)), -- (광고)승인여부
    SERVICECATEGORY_NO    NUMBER        NOT NULL REFERENCES SERVICECATEGORY(SERVICECATEGORY_NO)
                                     ON DELETE CASCADE                                  -- 서비스 카테고리번호
);

--유료서비스 테이블 시퀀스
DROP SEQUENCE PAIDSERVICE_SEQ;
CREATE SEQUENCE PAIDSERVICE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 장바구니
DROP TABLE SHOPPINGCART CASCADE CONSTRAINT;
CREATE TABLE SHOPPINGCART 
(
    SHOPPINGCART_NO     NUMBER         PRIMARY KEY,                      -- 장바구니번호
    USER_NO             NUMBER         NOT NULL REFERENCES USERS(USER_NO)
                                   ON DELETE CASCADE,                    -- 기업 회원 번호
    RESUME_NO           NUMBER          NOT NULL REFERENCES RESUMES(RESUME_NO)
                                   ON DELETE CASCADE,                    -- 이력서 번호
    SHOPPINGCART_DATE   DATE           DEFAULT SYSDATE                   -- 생성일
);

--장바구니 테이블 시퀀스
DROP SEQUENCE SHOPPINGCART_SEQ;
CREATE SEQUENCE SHOPPINGCART_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 쿠폰
DROP TABLE COUPON CASCADE CONSTRAINT;
CREATE TABLE COUPON 
(
    COUPON_NO           NUMBER       PRIMARY KEY,                    -- 쿠폰번호
    COUPON_NAME         VARCHAR2(60) NOT NULL,                       -- 쿠폰이름
    COUPON_RATE         NUMBER       NOT NULL CHECK(COUPON_RATE>=0), -- 쿠폰할인률
    COUPON_STARTDATE    DATE         NOT NULL,                       -- 쿠폰시작일
    COUPON_ENDDATE      DATE         NOT NULL                        -- 쿠폰종료일
);

--쿠폰 테이블 시퀀스
DROP SEQUENCE COUPON_SEQ;
CREATE SEQUENCE COUPON_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 주문/결제
DROP TABLE ORDERS CASCADE CONSTRAINT;
CREATE TABLE ORDERS
(
    ORDER_NO        NUMBER        PRIMARY KEY,                          -- 주문번호
    USER_NO         NUMBER        NOT NULL REFERENCES USERS(USER_NO)
                              ON DELETE CASCADE,                        -- 회원 번호
    ORDER_PAYKIND   VARCHAR2(100) NOT NULL,                             -- 결제수단
    COUPON_NO       NUMBER        NULL REFERENCES COUPON(COUPON_NO)
                              ON DELETE CASCADE,                        -- 쿠폰번호
    ORDER_DISCOUNT  NUMBER        DEFAULT 0 CHECK(ORDER_DISCOUNT>=0),   -- 할인금액
    ORDER_PAY       NUMBER        NULL CHECK(ORDER_PAY>=0),             -- 결제금액
    ORDER_DATE      DATE          DEFAULT SYSDATE                       -- 주문일자
);

--주문/결제 테이블 시퀀스
DROP SEQUENCE ORDERS_SEQ;
CREATE SEQUENCE ORDERS_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;



-- 주문상세
DROP TABLE ORDERDETAIL CASCADE CONSTRAINT;
CREATE TABLE ORDERDETAIL 
(
    ORDERDETAIL_NO  NUMBER      NOT NULL,                           -- 상품번호
    ORDER_NO        NUMBER      NOT NULL REFERENCES ORDERS(ORDER_NO)
                            ON DELETE CASCADE,                      -- 주문번호
    SERVICECATEGORY_NO   NUMBER      NOT NULL REFERENCES SERVICECATEGORY(SERVICECATEGORY_NO)
                            ON DELETE CASCADE,                      -- 서비스 카테고리번호
    CONSTRAINT PK_ORDERDETAIL PRIMARY KEY(ORDERDETAIL_NO,ORDER_NO)  --복합키
);

--주문상세 테이블 시퀀스
DROP SEQUENCE ORDERDETAIL_SEQ;
CREATE SEQUENCE ORDERDETAIL_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;




-- 쪽지
DROP TABLE MESSAGE CASCADE CONSTRAINT;
CREATE TABLE MESSAGE (
    MESSAGE_NO          NUMBER          PRIMARY KEY,                                -- 쪽지번호
    MESSAGE_TITLE       VARCHAR2(80)    NOT NULL,                                   -- 쪽지제목
    MESSAGE_CONTENT     CLOB            NOT NULL,                                   -- 쪽지내용
    MESSAGE_REGDATE     DATE            DEFAULT SYSDATE,                            -- 날짜
    SEND_DELFLAG        NUMBER          DEFAULT 2   CHECK(SEND_DELFLAG IN(1,2)),    -- 보낸회원삭제여부
    USER_NO             NUMBER          NULL REFERENCES USERS(USER_NO)
                                    ON DELETE CASCADE                               -- 보낸회원번호
);

--쪽지테이블 시퀀스
DROP SEQUENCE MESSAGE_SEQ;
CREATE SEQUENCE MESSAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

-- 쪽지 받는사람
DROP TABLE GETMESSAGE CASCADE CONSTRAINT;
CREATE TABLE GETMESSAGE (
		GETMESSAGE_NO           NUMBER PRIMARY KEY,                                     -- 쪽지시퀀스
		GETMESSAGE_READFLAG     NUMBER DEFAULT 2 CHECK(GETMESSAGE_READFLAG IN(1,2)),    -- 읽기여부
		USER_NO                 NUMBER NULL REFERENCES USERS(USER_NO)
                            ON DELETE CASCADE,                                          -- 받는회원번호
		GETMESSAGE_DELFLAG      NUMBER DEFAULT 2 CHECK(GETMESSAGE_DELFLAG  IN(1,2)),    -- 삭제여부
		GETMESSAGE_IMPFLAG      NUMBER DEFAULT 2 CHECK(GETMESSAGE_IMPFLAG  IN(1,2)),    -- 중요쪽지여부
		MESSAGE_NO              NUMBER NULL REFERENCES MESSAGE(MESSAGE_NO)
                            ON DELETE CASCADE                                           -- 쪽지번호
);


-- 쪽지 받는사람 테이블 시퀀스
DROP SEQUENCE GETMESSAGE_SEQ;
CREATE SEQUENCE GETMESSAGE_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

