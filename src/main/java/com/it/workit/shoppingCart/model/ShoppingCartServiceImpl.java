package com.it.workit.shoppingCart.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired private ShoppingCartDAO cartDao;

	@Override
	public int insertCart(ShoppingCartVO vo) {
		return cartDao.insertCart(vo);
	}
}
