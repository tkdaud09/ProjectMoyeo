package com.moyeo.dto;

import lombok.Data;

@Data
public class CartDTO {
	private	int cartIdx;
	private String userinfoId;
	private int packIdx;
	private int packAdultcount;
	private int packChildcount;
	private int packAdultprice;
	private int packChildpirce;
	private String packTitle;
	private int packTotalprice;
	private String packPreviewImg;
}