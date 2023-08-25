package com.moyeo.dto;

// import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Diy {
        private int diyIdx;
        private String userinfoId;
        private String diyStartdate;
        private String diyEnddate;
        private int diyPeople;
        private String diyLoc;
        private int diyPrice;
        private String diyMap;
        private String diyRegdate;
        private long loveIdx; //- love는 long
        private String diyTitle;
        private String diyContent1;
        private String diyContent2;
        private String diyContent3;
        private String diyContent4;
        private String diyContent5;
       //  private LocalDateTime time;
        
}