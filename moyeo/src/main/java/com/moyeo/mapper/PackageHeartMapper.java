package com.moyeo.mapper;

import com.moyeo.dto.PackHeart;

public interface PackageHeartMapper {
	int insertPackageHeart(PackHeart packHeart);
	int deletePackageHeart(PackHeart packHeart);
	
	PackHeart selectPackageHeartById(String userinfoId);//아이디로 검색
}
