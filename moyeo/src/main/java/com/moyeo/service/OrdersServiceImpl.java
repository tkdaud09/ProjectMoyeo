package com.moyeo.service;

import org.springframework.stereotype.Service;

import com.moyeo.dao.OrdersDAO;
import com.moyeo.dto.Orders;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {
	private final OrdersDAO ordersDAO;

	//주문내역 추가
	@Override
	public void addOrders(Orders ordesr) {
		ordersDAO.insertOrders(ordesr);
	}
}	
