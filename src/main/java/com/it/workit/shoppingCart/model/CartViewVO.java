package com.it.workit.shoppingCart.model;

public class CartViewVO {
	private int shoppingCartNo;
	private int userNo;
	private int resumeNo;
	
	//장바구니 목록에 필요한 멤버변수
	private String userName;		//이력서 작성회원 이름
	private String resumeTitle;		//이력서 제목
	private String userExperience;	//경력 
	private int workkindNo;			//직무번호 => 직무이름 조회를 위해 필요
	private int paidServicePrice;	//이력서 가격 2000원으로 고정(장바구니)
	
	
	public int getShoppingCartNo() {
		return shoppingCartNo;
	}
	public void setShoppingCartNo(int shoppingCartNo) {
		this.shoppingCartNo = shoppingCartNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getUserExperience() {
		return userExperience;
	}
	public void setUserExperience(String userExperience) {
		this.userExperience = userExperience;
	}
	public int getWorkkindNo() {
		return workkindNo;
	}
	public void setWorkkindNo(int workkindNo) {
		this.workkindNo = workkindNo;
	}
	public int getPaidServicePrice() {
		return paidServicePrice;
	}
	public void setPaidServicePrice(int paidServicePrice) {
		this.paidServicePrice = paidServicePrice;
	}
	
	@Override
	public String toString() {
		return "CartViewVO [shoppingCartNo=" + shoppingCartNo + ", userNo=" + userNo + ", resumeNo=" + resumeNo
				+ ", userName=" + userName + ", resumeTitle=" + resumeTitle + ", userExperience=" + userExperience
				+ ", workkindNo=" + workkindNo + ", paidServicePrice=" + paidServicePrice + "]";
	}
	
}
