package com.moyeo.dto;

import lombok.Data;

/*
이름             널?       유형           
-------------- -------- ------------ 
PACK_HEART_IDX NOT NULL NUMBER       
USERINFO_ID             VARCHAR2(50) 
PACK_IDX                NUMBER  
 * */

@Data
public class PackHeart {
	private int packHeartIdx;
	private String userinfoId;
	private int packIdx;
}
