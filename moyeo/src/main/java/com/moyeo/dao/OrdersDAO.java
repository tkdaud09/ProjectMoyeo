package com.moyeo.dao;

import com.moyeo.dto.Orders;

public interface OrdersDAO {
	//주문내역 추가
	void insertOrders(Orders orders);
}
