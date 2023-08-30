package com.moyeo.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.moyeo.dto.Diy;
import com.moyeo.dto.Userinfo;


@Service
public interface DiyService {

	// void insertDiy (Diy diy);
	void insertDiy(Diy diy);
	void updateDiy(Diy diy);
	void deleteDiy(int diyIdx);

	// DIY 작성 디테일 페이지
	Diy selectDiy(int diyIdx);
	
	
	// 전체 글 검색
	List<Diy> selectDiyList();
		
	// DIY 제목으로 검색, 내용은 작성 칸이 나눠져있어서 어떻게 해야할까?
	List<Diy> selectDiyList(String diyTitle);
	
	// 글에 저장된 아이디를 가져와 수정 권한을 줌
	Diy getUserinfoById(String userinfoId);
	
	// 전체 글 개수 
	int selectDiyListCount();
	
	//*** 나중에 지도 추가하기
	// *** 이미지..?
}
