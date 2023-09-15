package com.moyeo.service;

import com.moyeo.dto.DiyLove;

public interface DiyLoveService {
	void insertDiyLove(DiyLove diyLove);
	void deleteDiyLove(DiyLove diyLove);
	
	DiyLove loveStatus();
}
