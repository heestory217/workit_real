package com.it.workit.shoppingCart.model;

import java.sql.Timestamp;

public class ShoppingCartVO {
	private int SHOPPINGCART_NO;
	private int USER_NO;
	private int RESUME_NO;
	private Timestamp SHOPPINGCART_DATE;
	
	public int getSHOPPINGCART_NO() {
		return SHOPPINGCART_NO;
	}
	public void setSHOPPINGCART_NO(int sHOPPINGCART_NO) {
		SHOPPINGCART_NO = sHOPPINGCART_NO;
	}
	public int getUSER_NO() {
		return USER_NO;
	}
	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}
	public int getRESUME_NO() {
		return RESUME_NO;
	}
	public void setRESUME_NO(int rESUME_NO) {
		RESUME_NO = rESUME_NO;
	}
	public Timestamp getSHOPPINGCART_DATE() {
		return SHOPPINGCART_DATE;
	}
	public void setSHOPPINGCART_DATE(Timestamp sHOPPINGCART_DATE) {
		SHOPPINGCART_DATE = sHOPPINGCART_DATE;
	}
	
	@Override
	public String toString() {
		return "ShoppingCartVO [SHOPPINGCART_NO=" + SHOPPINGCART_NO + ", USER_NO=" + USER_NO + ", RESUME_NO="
				+ RESUME_NO + ", SHOPPINGCART_DATE=" + SHOPPINGCART_DATE + "]";
	}
}
