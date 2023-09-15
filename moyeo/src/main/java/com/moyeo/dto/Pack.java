package com.moyeo.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

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
   private int packIdx;//패키지 번호
   private String packKind;//패키지 종류
   private String packTitle;//패키지 제목
   private String packStartDate;//패키지 시작일
   private String packEndDate;//패키지 종료일
   private String packRegDate;//패키지 등록일
   private int packPeople;//패키지 인원수
   private int packChildPrice;//성인 가격
   private int packAdultPrice;//소인 가격
   private String packHeartCnt;//패키지 하트
   /*이미지*/
   private String packPreviewImg;
   private String packSlideImg1;
   private String packSlideImg2;
   private String packSlideImg3;
   private String packContentImg1;
   private String packContentImg2;
   private String packContentImg3;
   private String packCalendarImg;
   //패키지 상태 (Default 0 : 활성화 , 1 :비활성화(결제불가))
   private int packStatus;
   
}