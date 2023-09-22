package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dto.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Override
	public void addPayment(Payment payment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Payment getMyPayment(String impUid, String userinfoId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Payment> getAllPayments() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addPaymentStatus(Payment payment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getAccessToken(Payment payment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Payment getPayment(String accessToken, String impUid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String canclePayment(String accessToken, Payment payment) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
