package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Userinfo;
import com.moyeo.mapper.UserinfoMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserinfoDAOImpl implements UserinfoDAO {
   private final SqlSession sqlSession;

   /* 회원가입 */

   // 회원가입
   @Override
   public int insertUserinfo(Userinfo userinfo) {
      return sqlSession.getMapper(UserinfoMapper.class).insertUserinfo(userinfo);
   }

   // 아이디 중복검사
   @Override
   public int idCheck(String id) {
      return sqlSession.getMapper(UserinfoMapper.class).idCheck(id);
   }
   
   // 이메일 중복 검사
   @Override
   public int emailCheck(String email) {
      return sqlSession.getMapper(UserinfoMapper.class).emailCheck(email);
   }

   /* 로그인 */

   @Override
   public Userinfo userinfoLogin(Userinfo userinfo) {
      return sqlSession.getMapper(UserinfoMapper.class).userinfoLogin(userinfo);
   }

   @Override
   public int updateLogdate(String id) {
      return sqlSession.getMapper(UserinfoMapper.class).updateLogdate(id);
   }

   @Override
   public void updateUserToRest(String id) {
       sqlSession.update("userinfo.updateUserToRest", id);
   }
   
   @Override
   public void updateUserStatus(Userinfo userinfo) {
       sqlSession.update("userinfo.updateUserStatus", userinfo);
   }

   /* 아이디 찾기 */
   @Override
   public Userinfo findUserByEmail(String email) {
      //return sqlSession.selectOne("userinfoMapper.findUserByEmail", email);
      return sqlSession.getMapper(UserinfoMapper.class).findUserByEmail(email);
   }

   /* 마이페이지 */

   // 회원정보변경
   @Override
   public int updateUserinfo(Userinfo userinfo) {
      return sqlSession.getMapper(UserinfoMapper.class).updateUserinfo(userinfo);
   }

   // 회원탈퇴
   @Override
   public int outUser(String id) {
      return sqlSession.getMapper(UserinfoMapper.class).outUser(id);
   }

   // 아이디로 유저 검색
   @Override
   public Userinfo selectUserinfoById(String id) {
	   return sqlSession.getMapper(UserinfoMapper.class).selectUserinfoById(id);
   }

   // 비밀번호 변경
   @Override
   public int updatePw(Userinfo userinfo) {
	   return sqlSession.getMapper(UserinfoMapper.class).updatePw(userinfo);
   }

   /* 관리자 */

   @Override
   public int selectUserinfoCount() {
	   return sqlSession.getMapper(UserinfoMapper.class).selectUserinfoCount();
   }

   // 아이디로 유저 검색
   @Override
   public Userinfo selectUserinfo(String id) {
	   return sqlSession.getMapper(UserinfoMapper.class).selectUserinfoById(id);
   }

   // 전체 유저 검색
   @Override
   public List<Userinfo> selectUserinfoList(Map<String, Object> map) {
	   return sqlSession.getMapper(UserinfoMapper.class).selectUserinfoList(map);
   }

   // 마지막 로그인 시간 표시
   @Override
   public Userinfo selectUserinfobyRegdate(String regdate) {
	   return sqlSession.getMapper(UserinfoMapper.class).selectUserinfobyRegdate(regdate);
   }

}