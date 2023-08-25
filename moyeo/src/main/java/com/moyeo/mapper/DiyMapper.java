package com.moyeo.mapper;

import java.util.List;

import com.moyeo.dto.Diy;

public interface DiyMapper {
	int insertDiy(Diy diy);
	int updateDiy(Diy diy);
	int deleteDiy(String noticeNum);
	Diy selectDiy(String diyTitle);
	List<Diy> selectDiyList();
	
	// String id => 아이디 컬럼 하나만 가져와서 다른 테이블 아이디 where로 사용할수있게하고
	// 				User user로 다 가져오면모든걸 쓸수있음
	
}
