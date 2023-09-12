package com.moyeo.dao;

import com.moyeo.dto.PackHeart;

public interface PackageHeartDAO {
	int insertPackageHeart(PackHeart packHeart);
	int deletePackageHeart(PackHeart packHeart);
	
	PackHeart selectPackageHeartById(String userinfoId);//아이디로 검색
}
