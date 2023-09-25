package com.moyeo.dao;

import java.util.List;

import com.moyeo.dto.Orders;

public interface OrdersDAO {
	//주문내역 추가
	void insertOrders(Orders orders);
	
	//유저 아이디별 패키지 결제내역 목록 검색
	List<Orders> selectUserPaymentListById(String userinfoId);
}		