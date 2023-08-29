package com.moyeo.dto;

// import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Diy {
        private Integer diyIdx;
        private String userinfoId;
        private String diyStartdate;
        private String diyEnddate;
        private int diyPeople;
        private String diyLoc;
        private int diyPrice;
        private String diyMap;
        private String diyRegdate;
        private String diyModifydate;
        private long loveIdx; //- love는 long
        private String diyTitle;
        private String diyIntroduction;
        private String diyThumbnail;
        private String diyContent1Img;
        private String diyContent1;
        private String diyContent2Img;
        private String diyContent2;
        private String diyContent3Img;
        private String diyContent3;
        private String diyContent4Img;
        private String diyContent4;
       //  private LocalDateTime time;
        
}