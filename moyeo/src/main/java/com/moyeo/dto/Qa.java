package com.moyeo.dto;

import lombok.Data;

/*
이름             널?       유형             
-------------- -------- -------------- 
QA_IDX         NOT NULL NUMBER         
USERINFO_ID             VARCHAR2(50)   
QA_OPTION               VARCHAR2(1000) 
QA_TITLE                VARCHAR2(1000) 
QA_CONTENT              VARCHAR2(4000) 
QA_IMG1                 VARCHAR2(500)  
QA_IMG2                 VARCHAR2(500)  
QA_IMG3                 VARCHAR2(500)  
QA_REGDATE              DATE           
QA_MODIFYDATE           DATE                                      
* */

@Data
public class Qa {
	private int qaIdx;
	private String userinfoId;
	private String qaOption;//문의 유형
	private String qaTitle;
	private String qaContent;
	private String qaImg1;
	private String qaImg2;
	private String qaImg3;
	private String qaRegdate;//질문 날짜
	private String qaModifyDate;//수정 날짜
}
