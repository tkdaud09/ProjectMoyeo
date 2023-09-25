package com.moyeo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Orders;
import com.moyeo.mapper.OrdersMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrdersDAOImpl implements OrdersDAO {
	private final SqlSession sqlSession;
	
	//주문내역 추가
	@Override
	public void insertOrders(Orders orders) {
		sqlSession.getMapper(OrdersMapper.class).insertOrders(orders);
	}
	
}
