package com.moyeo.dto;

import org.springframework.format.annotation.DateTimeFormat;

/*
이름             널?       유형             
——————— ———— ——————— 
NOTICE_IDX     NOT NULL NUMBER         
NOTICE_TITLE            VARCHAR2(1000) 
NOTICE_CONTENT          VARCHAR2(4000) 
NOTICE_REGDATE          DATE           
NOTICE_STATUS           NUMBER         
NOTICE_IMG              VARCHAR2(500)  - 이미지       
*/



import lombok.Data;

@Data
public class Notice {
   private int noticeIdx;
   private String userinfoId;
   private String noticeTitle;
   private String noticeContent;
   private String noticeRegDate;
   private int noticeStatus;
   private String noticeImg;
   private int noticeViewcnt;
   
      /* private int noticeIdx; 
        private String noticeTitle;
        private String noticeContent;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        private String noticeRegdate;
        private int noticeStatus;*/
}