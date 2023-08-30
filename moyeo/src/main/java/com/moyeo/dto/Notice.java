package com.moyeo.dto;

import org.springframework.format.annotation.DateTimeFormat;

/*
 이름             널?       유형             
-------------- -------- -------------- 
NOTICE_IDX     NOT NULL NUMBER         //게시글 번호
NOTICE_TITLE            VARCHAR2(1000) //제목
NOTICE_CONTENT          VARCHAR2(4000) //내용
NOTICE_REGDATE          DATE           //등록일
NOTICE_STATUS           NUMBER         //등록상태
*/



import lombok.Data;

@Data
public class Notice {
      /* private int noticeIdx; 
        private String noticeTitle;
        private String noticeContent;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        private String noticeRegdate;
        private int noticeStatus;*/
}