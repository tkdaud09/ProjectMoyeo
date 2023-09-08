package com.moyeo.dto;

import lombok.Data;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/*
이름             널?       유형             
-------------- -------- -------------- 
REVIEW_IDX     NOT NULL NUMBER         
USERINFO_ID             VARCHAR2(50)   
ORDERS_IDX              NUMBER         
REVIEW_STAR             NUMBER         
REVIEW_TITLE            VARCHAR2(1000) 
REVIEW_CONTENT          VARCHAR2(4000) 
REVIEW_REGDATE          DATE      

*/


@Data
public class Review {
	private int reviewIdx;
	private String userinfoId;
	private int ordersIdx;
	private int reviewStar;
	private String reviewTitle;
	private String reviewContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reviewRegdate;
}
