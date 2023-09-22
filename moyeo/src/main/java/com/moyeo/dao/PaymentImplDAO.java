package com.moyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Payment;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PaymentImplDAO implements PaymentDAO{
	private final SqlSession sqlSession;

	//결제내역 추가 
	@Override
	public void addPayment(Payment payment) {
		// TODO Auto-generated method stub
		
	}
	
	//결제내역 조회
	@Override
	public Payment selectPayment(String impUid, String userinfoId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//관리자용 결제 내역 조회
	@Override
	public List<Payment> selectAllPayments() {
		// TODO Auto-generated method stub
		return null;
	}
	
	//결제 상태 업데이트
	@Override
	public void modifyPayment(Payment payment) {
		// TODO Auto-generated method stub
		
	}
	
	//액세스 토큰 받음
	@Override
	public String getAccessToken(Payment payment) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//결제 정보를 조회	
	@Override
	public Payment getPayment(String accessToken, String impUid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//결제 취소
	@Override
	public String canclePayment(String accessToken, Payment payment) {
		// TODO Auto-generated method stub
		return null;
	}
	
}


