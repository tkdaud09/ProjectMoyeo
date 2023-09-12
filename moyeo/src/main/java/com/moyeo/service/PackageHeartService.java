package com.moyeo.service;

import com.moyeo.dto.PackHeart;

public interface PackageHeartService {
	void addPackageHeart(PackHeart packHeart);
	void removePackageHeart(PackHeart packHeart);
	
	PackHeart getPackageHeartById(String userinfoId);//아이디로 찜 검색
}
