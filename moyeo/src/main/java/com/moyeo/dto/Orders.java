package com.moyeo.dto;

import lombok.Data;

/*
이름              널?       유형            
--------------- -------- ------------- 
ORDERS_IDX      NOT NULL NUMBER        
USERINFO_ID              VARCHAR2(50)  
PACK_IDX                 NUMBER        
ORDERS_DATE              DATE          
PACK_PREVIEWIMG          VARCHAR2(100) 
PACK_TITLE               VARCHAR2(100) 
MERCHANT_UID             VARCHAR2(100)          
* */

@Data
public class Orders {
	private int ordersIdx;
	private String userinfoId;
	private int packIdx;//패키지 번호
	private String ordersDate;//주문일
	private String packTitle;//패키지 제목
	private String packPreviewImg;//패키지 썸네일 이미지
	private String merchantUid;//주문번호
}