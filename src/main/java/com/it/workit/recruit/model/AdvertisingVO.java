package com.it.workit.recruit.model;
import java.util.Date;

import com.it.workit.common.SearchVO;

public class AdvertisingVO extends SearchVO{

		private int userNo;
		private int recruitannounceNo;
		private int recruitannounceUpcheck;
		private String recruitannounceTitle;
		private Date recruitannounceEnddate;
		private String productName;
		private Date adverEnddate;
		private int adCheck;
		public int getUserNo() {
			return userNo;
		}
		public void setUserNo(int userNo) {
			this.userNo = userNo;
		}
		public int getRecruitannounceNo() {
			return recruitannounceNo;
		}
		public void setRecruitannounceNo(int recruitannounceNo) {
			this.recruitannounceNo = recruitannounceNo;
		}
		public String getRecruitannounceTitle() {
			return recruitannounceTitle;
		}
		public void setRecruitannounceTitle(String recruitannounceTitle) {
			this.recruitannounceTitle = recruitannounceTitle;
		}
		public Date getRecruitannounceEnddate() {
			return recruitannounceEnddate;
		}
		public void setRecruitannounceEnddate(Date recruitannounceEnddate) {
			this.recruitannounceEnddate = recruitannounceEnddate;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public Date getAdverEnddate() {
			return adverEnddate;
		}
		public void setAdverEnddate(Date adverEnddate) {
			this.adverEnddate = adverEnddate;
		}
		public int getAdCheck() {
			return adCheck;
		}
		public void setAdCheck(int adCheck) {
			this.adCheck = adCheck;
		}
		@Override
		public String toString() {
			return "AdvertisingVO [userNo=" + userNo + ", recruitannounceNo=" + recruitannounceNo
					+ ", recruitannounceUpcheck=" + recruitannounceUpcheck + ", recruitannounceTitle="
					+ recruitannounceTitle + ", recruitannounceEnddate=" + recruitannounceEnddate + ", productName="
					+ productName + ", adverEnddate=" + adverEnddate + ", adCheck=" + adCheck + "]";
		}
		public int getRecruitannounceUpcheck() {
			return recruitannounceUpcheck;
		}
		public void setRecruitannounceUpcheck(int recruitannounceUpcheck) {
			this.recruitannounceUpcheck = recruitannounceUpcheck;
		}
		
		
		

}
