package com.moyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Payment;
import com.moyeo.mapper.PaymentMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PaymentDAOImpl implements PaymentDAO{
   private final SqlSession sqlSession;

   //결제내역 추가 
   @Override
   public void insertPayment(Payment payment) {
      sqlSession.getMapper(PaymentMapper.class).insertPayment(payment);
   }
   
   //결제내역 조회
   @Override
   public Payment selectMyPayment(String impUid, String userinfoId) {
      return sqlSession.getMapper(PaymentMapper.class).selectMyPayment(impUid, userinfoId);
   }
   
   //관리자용 결제 내역 조회
   @Override
   public List<Payment> selectAllPayments() {
      return sqlSession.getMapper(PaymentMapper.class).selectAllPayments();
   }
   
   //결제 상태 업데이트
   @Override
   public void updatePaymentStatus(Payment payment) {
      sqlSession.getMapper(PaymentMapper.class).updatePaymentStatus(payment);   
      
   }
   
   //액세스 토큰 받음
   @Override
   public String getAccessToken(Payment payment) {
      return sqlSession.getMapper(PaymentMapper.class).getAccessToken(payment);
   }
   
   //결제 정보를 조회   
   @Override
   public Payment getPayment(String accessToken, String impUid) {
      return sqlSession.getMapper(PaymentMapper.class).getPayment(accessToken, impUid);
   }
   
   //결제 취소
   @Override
   public String canclePayment(String accessToken, Payment payment) {
      return sqlSession.getMapper(PaymentMapper.class).canclePayment(accessToken, payment);
   }
   
}
