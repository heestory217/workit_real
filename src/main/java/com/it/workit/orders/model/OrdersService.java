package com.it.workit.orders.model;

import java.util.List;

public interface OrdersService {
	public List<OrdersVO> selectIndivPaymentByUserno(int userNo);
}
