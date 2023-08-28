package com.moyeo.dto;

import lombok.Data;

/*
이름              널?       유형            
--------------- -------- ------------- 
PACK_IDX        NOT NULL NUMBER        
PACK_KIND                CHAR(1)       
PACK_NAME                VARCHAR2(50)  
PACK_PREVIEW             VARCHAR2(100) 
PACK_MAIN                VARCHAR2(100) 
PACK_CONTENT             VARCHAR2(100) 
PACK_CALENDAR            VARCHAR2(100) 
PACK_STARTDATE           DATE          
PACK_ENDDATE             DATE          
PACK_REGDATE             DATE          
PACK_PEOPLE              NUMBER        
PACK_CHILDCOUNT          NUMBER        
PACK_ADULTCOUNT          NUMBER        
PACK_CHILDPRICE          NUMBER        
PACK_ADULTPRICE          NUMBER        
PACK_TOTALPRICE          NUMBER        
PACK_LEFT                NUMBER        
PACK_STATUS              NUMBER        
PACK_HEART               VARCHAR2(500) 
 * */

@Data
public class Pack {
   private int packIdx;
   private String packKind;
   private String packTitle;
   private String packPreview;
   private String packMain;
   private String packContent;
   private String packCalendar;
   private String packStartDate;//패키지 시작일
   private String packEndDate;//패키지 종료일
   private String packRegDate;//패키지 등록일
   private int packPeople;//패키지 인원수
   private int packChildCount;
   private int packAdultCount;
   private int packAdultPrice;//패키지 성인 1인 가격
   private int packChildPrice;//패키지 소인 1인 가격
   private int packTotalPrice;
   private int packLeft;//잔여 인원수
   private int packStatus;//패키지 상태 (Default 0 : 활성화 , 1 :비활성화(결제불가))
   private String packHeart;//패키지 찜
}