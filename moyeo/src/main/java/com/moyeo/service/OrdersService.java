package com.moyeo.service;

import java.util.List;

import com.moyeo.dto.Orders;

public interface OrdersService {
	// 주문내역 추가
	void addOrders(Orders ordesr);

	// 유저 아이디별 패키지 결제내역 목록 검색
	List<Orders> getUserPaymentListById(String userinfoId);
}
