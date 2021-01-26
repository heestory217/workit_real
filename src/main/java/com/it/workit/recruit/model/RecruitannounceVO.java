package com.it.workit.recruit.model;

import java.util.Date;

public class RecruitannounceVO {
	private int recruitannounceNo;//RECRUITANNOUNCE_NO	NUMBER	NOT NULL
	private int userNo;//USER_NO	NUMBER	NOT NULL
	private int workkindNo;//workkindNo
	private int arealistNo;//arealistNo
	private int languageNo;//languageNo
	private String recruitannounceTitle;// RECRUITANNOUNCE_TITLE	VARCHAR2(100)	NULL
	private Date recruitannounceStartdate;// RECRUITANNOUNCE_STARTDATE	DATE	NULL
	private Date recruitannounceEnddate;//RECRUITANNOUNCE_ENDDATE	DATE	NOT NULL
	private String recruitannounceScarrer;//RECRUITANNOUNCE_SCARRER	VARCHAR2(100)	NULL
	private String recruitannounceSworkkind;//RECRUITANNOUNCE_SWORKKIND	VARCHAR2(100)	NOT NULL
	private String recruitannounceSpay;//RECRUITANNOUNCE_SPAY	VARCHAR2(100)	NULL
	private String recruitannounceSkill;//RECRUITANNOUNCE_SKILL	VARCHAR2(100)	NOT NULL
	private String recruitannounceWorkkind;//RECRUITANNOUNCE_WORKKIND	CLOB	NOT NULL
	private String recruitannounceWork;//RECRUITANNOUNCE_WORK	CLOB	NULL
	private int recruitannounceWantedcarrer;//RECRUITANNOUNCE_WANTEDCARRER	CLOB	NOT NULL
	private String recruitannounceUpcheckcarrer;//RECRUITANNOUNCE_UPCHECKCARRER	CLOB	NULL
	private String recruitannounceHirestep;//	CLOB	NULL
	private String recruitannounceElse;//RECRUITANNOUNCE_ELSE	CLOB	NULL
	private int recruitannounceUpcheck;//RECRUITANNOUNCE_UPCHECK	NUMBER	NOT NULL
	private int recruitannounceEndcheck;//RECRUITANNOUNCE_ENDCHECK	NUMBER	NOT NULL
	private String recruitannounceLink;//RECRUITANNOUNCE_LINK	VARCHAR2(200)	NULL
	
	
	
	
	
}
