package com.moyeo.dto;

import lombok.Data;

/*
이름          널?       유형            
----------- -------- ------------- 
ID          NOT NULL VARCHAR2(50)  
PW                   VARCHAR2(50)  
NAME                 VARCHAR2(50)  
EMAIL                VARCHAR2(100) 
BIRTH                DATE          
ADDRESS              VARCHAR2(100) 
PHONE                VARCHAR2(50)  
REGDATE              DATE          
LASTLOGDATE          DATE          
STATUS               NUMBER    
 * */

@Data
public class Userinfo {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String birth;
	private String address;
	private String phone;
	private String regdate;
	private String lastlogdate;
	private int status;
}