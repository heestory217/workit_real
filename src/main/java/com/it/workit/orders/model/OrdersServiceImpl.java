package com.it.workit.orders.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersServiceImpl implements OrdersService{

	@Autowired OrdersDAO ordersDao;
}
