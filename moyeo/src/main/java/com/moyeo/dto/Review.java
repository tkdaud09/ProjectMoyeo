package com.moyeo.dto;

import lombok.Data;
import java.util.Date;

/*
이름                널?       유형             
----------------- -------- -------------- 
REVIEW_NUM        NOT NULL NUMBER         
ID_REVIEW                  VARCHAR2(50)   
ORDERS_NUM_REVIEW          NUMBER         
REVIEW_STAR                NUMBER         
REVIEW_TITLE               VARCHAR2(1000) 
REVIEW_CONTENT             VARCHAR2(4000) 
REVIEW_REGDATE             DATE           
	REGDATE                    DATE           

*/
@Data
public class Review {
	private int reviewNum;
	private String idReview;
	private int orderNumReview;
	private int reviewStar;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewRegdate;
}
