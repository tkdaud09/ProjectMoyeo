package com.moyeo.dao;

import java.util.List;

import com.moyeo.dto.Payment;

public interface PaymentDAO {
	//결제내역 추가
	void insertPayment(Payment payment);

	//결제내역 조회
	Payment selectMyPayment(String impUid, String userinfoId);

	//관리자용 결제 내역 조회
	List<Payment> selectAllPayments();

	//결제상태 업데이트
	void updatePaymentStatus(Payment payment);

	//액세스 토큰 받음
	String getAccessToken(Payment payment);

	//결제 정보를 조회	
	Payment getPayment(String accessToken, String impUid);

	//결제를 취소	
	String canclePayment(String accessToken, Payment payment);
}