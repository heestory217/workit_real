package com.it.workit.shoppingCart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired private ShoppingCartDAO cartDao;

	@Override
	public int insertCart(ShoppingCartVO vo) {
		return cartDao.insertCart(vo);
	}

	@Override
	public List<CartViewVO> selectCartList(int userNo) {
		return cartDao.selectCartList(userNo);
	}

	@Override
	public int deleteOne(int shoppingcartNo) {
		return cartDao.deleteOne(shoppingcartNo);
	}

	@Override
	public int clearCart(int userNo) {
		return cartDao.clearCart(userNo);
	}

	@Override
	public int cartDupChk(ShoppingCartVO vo) {
		return cartDao.cartDupChk(vo);
	}
}
