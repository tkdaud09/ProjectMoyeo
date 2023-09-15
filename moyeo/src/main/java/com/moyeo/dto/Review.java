package com.moyeo.dto;

import lombok.Data;
import java.util.Date;


/*
create table review (
        review_idx number primary key
        , userinfo_id varchar2(50) 
        , orders_idx number
        , review_star number 
        , pack_title varchar2(1000)
        , review_title varchar2(1000)
        , review_content varchar2(4000)
        , review_regdate date
        , review_status number
        , review_img varchar2(4000)
        , review_viewcnt number);
        
create sequence review_seq; 

ALTER TABLE review MODIFY review_viewcnt DEFAULT 0;
*/

/*
이름             널?       유형             
-------------- -------- -------------- 
REVIEW_IDX     NOT NULL NUMBER         
USERINFO_ID             VARCHAR2(50)   
ORDERS_IDX              NUMBER         
REVIEW_STAR             NUMBER         
PACK_TITLE              VARCHAR2(1000) 
REVIEW_TITLE            VARCHAR2(1000) 
REVIEW_CONTENT          VARCHAR2(4000) 
REVIEW_REGDATE          DATE           
REVIEW_STATUS           NUMBER         
REVIEW_IMG              VARCHAR2(4000) 
REVIEW_VIEWCNT          NUMBER  
           

*/
/*---------------------------------------------------------------------------*/


@Data
public class Review {
	private int reviewIdx;         //게시글번호
	private String userinfoId;     //작성자
	private int ordersIdx;         //주문번호
	private int reviewStar;        //별점
	private String packTitle;      //패키지명
	private String reviewTitle;    //제목
	private String reviewContent;  //내용
	private Date reviewRegdate;    //작성일
	private String reviewImg;      //이미지
	private int reviewViewcnt;     //조회수
	 
}
