package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dao.PaymentDAO;
import com.moyeo.dto.Payment;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {
	
	private final PaymentDAO paymentDAO;
	
	@Override
	public void addPayment(Payment payment) {
		paymentDAO.insertPayment(payment);
	}

	@Override
	public Payment getMyPayment(String impUid, String userinfoId) {
		return paymentDAO.selectMyPayment(impUid, userinfoId);
	}

	@Override
	public List<Payment> getAllPayments() {
		return paymentDAO.selectAllPayments();
	}

	@Override
	public void addPaymentStatus(Payment payment) {
		paymentDAO.updatePaymentStatus(payment);
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
