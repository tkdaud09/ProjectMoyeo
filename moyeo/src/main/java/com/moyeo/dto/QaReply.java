package com.moyeo.dto;

import lombok.Data;

/*
이름               널?       유형             
---------------- -------- -------------- 
QA_REPLY_IDX     NOT NULL NUMBER         
QA_IDX                    NUMBER         
USERINFO_ID               VARCHAR2(50)   
QA_REPLY_CONTENT          VARCHAR2(4000) 
QA_REPLY_REGDATE          DATE  
 * */

@Data
public class QaReply {
	private int qaReplyIdx;
	private int qaIdx;
	private String userinfoId;
	private String qaReplyContent;
	private String qaReplyRegdate;
}
