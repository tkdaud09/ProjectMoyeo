package com.moyeo.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Payment {
	private String impUid;//결제 관련 Open API에서 제공되는 고유값 
	private String merchantUid;//주문번호
	private String packIdx;//주문패키지번호
	private String userinfoId;//결제 사용자 아이디
	private long paymentAmount;//결제금액
	private Date paymentDate;//결제일 
	private String paymentStatus;//결제 상태 
}