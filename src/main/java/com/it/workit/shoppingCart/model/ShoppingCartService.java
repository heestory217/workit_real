package com.it.workit.shoppingCart.model;

import java.util.List;
import java.util.Map;

public interface ShoppingCartService {
	int insertCart(ShoppingCartVO vo);
	List<Map<String, Object>> selectCartList(int userNo);
	int deleteOne(int shoppingcartNo);
	int clearCart(int userNo);
}
