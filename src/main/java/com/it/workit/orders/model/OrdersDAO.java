package com.it.workit.orders.model;

import java.util.List;

public interface OrdersDAO {
	public List<OrdersVO> selectIndivPaymentByUserno(int userNo);
}
