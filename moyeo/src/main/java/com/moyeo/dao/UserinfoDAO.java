package com.moyeo.dao;

import java.util.List;

import com.moyeo.dto.Userinfo;

public interface UserinfoDAO {
	int insertUserinfo(Userinfo userinfo);
	int updateUserinfo(Userinfo userinfo);
	int deleteUserinfo(String id);
	Userinfo selectUserinfo(String id);
	List<Userinfo> selectUserinfoList();
}
