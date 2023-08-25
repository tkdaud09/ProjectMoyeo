package com.moyeo.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.moyeo.dto.Diy;


@Service
public interface DiyService {

	// void insertDiy (Diy diy);
	void insertDiy(Diy diy);
	void updateDiy(Diy diy);
	void deleteDiy(String diy);

	Diy getDiy(String diy);
	List<Diy> getDiyList();
}
