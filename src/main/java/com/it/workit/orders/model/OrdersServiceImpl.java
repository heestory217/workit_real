package com.it.workit.orders.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersServiceImpl implements OrdersService{

	@Autowired OrdersDAO ordersDao;

	@Override
	public List<OrdersVO> selectIndivPaymentByUserno(int userNo) {
		return ordersDao.selectIndivPaymentByUserno(userNo);
	}
}
