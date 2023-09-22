package com.moyeo.service;

import java.util.List;

import com.moyeo.dto.Payment;

public interface PaymentService {
	//결제내역 추가
	void addPayment(Payment payment);

	//결제내역 조회
	Payment getMyPayment(String impUid, String userinfoId);

	//관리자용 결제 내역 조회
	List<Payment> getAllPayments();

	//결제상태 업데이트
	void addPaymentStatus(Payment payment);

	//액세스 토큰 받음
	String getAccessToken(Payment payment);

	//결제 정보를 조회	
	Payment getPayment(String accessToken, String impUid);

	//결제를 취소	
	String canclePayment(String accessToken, Payment payment);
}
