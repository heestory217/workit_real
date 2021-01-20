package com.it.workit.corp.model;

import java.util.Date;

public class CorpVO {
    private int corpNo; //NUMBER PRIMARY KEY, 기업 정보 번호
    private int userNo; //NUMBER NOT NULL REFERENCES USERS(USER_NO)
                         //ON DELETE CASCADE, 회원 번호
    private String corpName;//VARCHAR2(80) NOT NULL , 회사 이름
    private String corpIntro;// CLOB NOT NULL, 회사 소개
    private String corpImgurl;// VARCHAR2(200) NOT NULL, 로고 이미지 URL
    private int corpAvrpay;//기업1인평균급여금액 NUMBER NULL, 평균 연봉
    private String corpKind;//중소기업여부 VARCHAR2(150) NULL, 기업형태
    private int corpPnumber; //기업종업원수 NUMBER  NOT NULL CHECK(CORP_PNUMBER>=1),직원수
    private String corpHeadname;// 기업대표자성명* VARCHAR2(100) NOT NULL,대표자명
    private String corpZipcode;//기업구우편번호VARCHAR2(20)  NOT NULL 우편번호
    private String corpAddress1;//기업기본주소*CORP_ADDRESS1  VARCHAR2(150) NOT NULL, 대표 주소1
    private String corpAddress2;//기업상세주소*COL_ADDRESS2 VARCHAR2(150) NULL,  대표 주소2
    private String corpCorpaddnumber;//사업자등록번호* CORP_CORPADDNUMBER  VARCHAR2(200) NOT NULL,  사업자 등록번호
    private String corpIndustry;//기업주요사업명* CORP_INDUSTRY VARCHAR2(120) NOT NULL, 산업군
    private String corpStartdate;//기업설립일자CORP_STARTDATE DATE NOT NULL, 설립 연도
    private String corpWebaddress;//기업홈페이지URL*CORP_WEBADDRESS VARCHAR2(200) NULL, 웹사이트 주소
    private String corpTel;//기업전화번호* CORP_TEL  VARCHAR2(60)  NOT NULL,   대표번호
    private String corpOkcheck;//CORP_OKCHECK  NUMBER DEFAULT 0  승인여부
    private Date corpRegdate;
    
    
    
    public Date getCorpRegdate() {
		return corpRegdate;
	}
	public void setCorpRegdate(Date corpRegdate) {
		this.corpRegdate = corpRegdate;
	}
	public int getCorpNo() {
		return corpNo;
	}
	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public String getCorpIntro() {
		return corpIntro;
	}
	public void setCorpIntro(String corpIntro) {
		this.corpIntro = corpIntro;
	}
	public String getCorpImgurl() {
		return corpImgurl;
	}
	public void setCorpImgurl(String corpImgurl) {
		this.corpImgurl = corpImgurl;
	}
	public int getCorpAvrpay() {
		return corpAvrpay;
	}
	public void setCorpAvrpay(int corpAvrpay) {
		this.corpAvrpay = corpAvrpay;
	}
	public String getCorpKind() {
		return corpKind;
	}
	public void setCorpKind(String corpKind) {
		this.corpKind = corpKind;
	}
	public int getCorpPnumber() {
		return corpPnumber;
	}
	public void setCorpPnumber(int corpPnumber) {
		this.corpPnumber = corpPnumber;
	}
	public String getCorpHeadname() {
		return corpHeadname;
	}
	public void setCorpHeadname(String corpHeadname) {
		this.corpHeadname = corpHeadname;
	}
	public String getCorpZipcode() {
		return corpZipcode;
	}
	public void setCorpZipcode(String corpZipcode) {
		this.corpZipcode = corpZipcode;
	}
	public String getCorpAddress1() {
		return corpAddress1;
	}
	public void setCorpAddress1(String corpAddress1) {
		this.corpAddress1 = corpAddress1;
	}
	public String getCorpAddress2() {
		return corpAddress2;
	}
	public void setCorpAddress2(String corpAddress2) {
		this.corpAddress2 = corpAddress2;
	}
	public String getCorpCorpaddnumber() {
		return corpCorpaddnumber;
	}
	public void setCorpCorpaddnumber(String corpCorpaddnumber) {
		this.corpCorpaddnumber = corpCorpaddnumber;
	}
	public String getCorpIndustry() {
		return corpIndustry;
	}
	public void setCorpIndustry(String corpIndustry) {
		this.corpIndustry = corpIndustry;
	}
	public String getCorpStardate() {
		return corpStartdate;
	}
	public void setCorpStardate(String corpStartdate) {
		this.corpStartdate = corpStartdate;
	}
	public String getCorpWebaddress() {
		return corpWebaddress;
	}
	public void setCorpWebaddress(String corpWebaddress) {
		this.corpWebaddress = corpWebaddress;
	}
	public String getCorpTel() {
		return corpTel;
	}
	public void setCorpTel(String corpTel) {
		this.corpTel = corpTel;
	}
	public String getCorpOkcheck() {
		return corpOkcheck;
	}
	public void setCorpOkcheck(String corpOkcheck) {
		this.corpOkcheck = corpOkcheck;
	}
	
	@Override
	public String toString() {
		return "CorpVO [corpNo=" + corpNo + ", userNo=" + userNo + ", corpName=" + corpName + ", corpIntro=" + corpIntro
				+ ", corpImgurl=" + corpImgurl + ", corpAvrpay=" + corpAvrpay + ", corpKind=" + corpKind
				+ ", corpPnumber=" + corpPnumber + ", corpHeadname=" + corpHeadname + ", corpZipcode=" + corpZipcode
				+ ", corpAddress1=" + corpAddress1 + ", corpAddress2=" + corpAddress2 + ", corpCorpaddnumber="
				+ corpCorpaddnumber + ", corpIndustry=" + corpIndustry + ", corpStardate=" + corpStartdate
				+ ", corpWebaddress=" + corpWebaddress + ", corpTel=" + corpTel + ", corpOkcheck=" + corpOkcheck
				+ ", corpRegdate=" + corpRegdate + "]";
	}
    
}
