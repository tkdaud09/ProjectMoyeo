package com.moyeo.dao;

import java.util.List;

import com.moyeo.dto.Diy;

public interface DiyDAO {
	//int insertDiy(Diy diy);
	int insertDiy(Diy diy);
	
	int updateDiy(Diy diy);
	int deleteDiy(String diyIdx);
	// select를 뭘로하지..? 제목?
	Diy selectDiy(String diyTitle);
	List<Diy> selectDiyList();

}
