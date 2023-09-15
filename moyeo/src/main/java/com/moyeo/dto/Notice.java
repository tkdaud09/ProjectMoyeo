package com.moyeo.dto;

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