package com.moyeo.dto;

import lombok.Data;

@Data
public class Event {
	 private int eventIdx; 
     private String eventTitle;
     private String eventContent;  
     private String eventRegdate;
     private int eventStatus;
     private String eventStartdate;
     private String eventEnddate;
     private String eventPreviewimg;
     private String eventContentimg;
}
