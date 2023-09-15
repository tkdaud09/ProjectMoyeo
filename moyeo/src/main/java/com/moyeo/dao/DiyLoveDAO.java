package com.moyeo.dao;

import com.moyeo.dto.DiyLove;

public interface DiyLoveDAO {
	int insertDiyLove(DiyLove diyLove);
	int deleteDiyLove(DiyLove diyLove);
	
	DiyLove loveStatus();
}
