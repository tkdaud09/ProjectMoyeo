package com.moyeo.mapper;

import com.moyeo.dto.DiyLove;

public interface DiyLoveMapper {
	int insertDiyLove(DiyLove diyLove);
	int deleteDiyLove(DiyLove diyLove);
	
	// 아이디마다 diy글 좋아요 여부 받아오기
	DiyLove loveStatus();
}
