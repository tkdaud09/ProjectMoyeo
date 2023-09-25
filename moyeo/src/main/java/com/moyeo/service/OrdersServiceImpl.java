package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dao.OrdersDAO;
import com.moyeo.dto.Orders;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {
	private final OrdersDAO ordersDAO;

	// 주문내역 추가
	@Override
	public void addOrders(Orders ordesr) {
		ordersDAO.insertOrders(ordesr);
	}

	// 유저 아이디별 패키지 결제내역 목록 검색
	@Override
	public List<Orders> getUserPaymentListById(String userinfoId) {
		return ordersDAO.selectUserPaymentListById(userinfoId);
	}
}
