package com.moyeo.dao;

import java.util.List;

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
	
	//유저 아이디별 패키지 결제내역 목록 검색
	@Override
	public List<Orders> selectUserPaymentListById(String userinfoId) {
		return sqlSession.getMapper(OrdersMapper.class).selectUserPaymentListById(userinfoId);
	}	
}
