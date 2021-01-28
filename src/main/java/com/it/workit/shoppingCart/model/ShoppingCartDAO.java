package com.it.workit.shoppingCart.model;

import java.util.List;

public interface ShoppingCartDAO {
	int insertCart(ShoppingCartVO vo);
	List<CartViewVO> selectCartList(int userNo);
	int deleteOne(int shoppingcartNo);
	int clearCart(int userNo);
	int cartDupChk(ShoppingCartVO vo);
}
