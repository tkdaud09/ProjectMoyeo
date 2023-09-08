package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Qa;
import com.moyeo.mapper.QaMapper;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class QaDAOImpl implements QaDAO {
	private final SqlSession sqlSession;
	
	/*회원*/
	
	//1:1 문의 등록
	@Override
	public int insertQa(Qa qa) {
		return sqlSession.getMapper(QaMapper.class).insertQa(qa);
	}
	
	//1:1 문의 수정
	@Override
	public int updateQa(Qa qa) {
		return sqlSession.getMapper(QaMapper.class).updateQa(qa);
	}
	
	//1:1 문의 삭제
	@Override
	public int deleteQa(int qaIdx) {
		return sqlSession.getMapper(QaMapper.class).deleteQa(qaIdx);
	}


	
	
	/* 검색 */
	
	//상세 페이지 
	@Override
	public Qa selectQaInfo(int qaIdx) {
		return sqlSession.getMapper(QaMapper.class).selectQaInfo(qaIdx);
	}
	
	
	//전체 레코드 검색
	@Override
	public int selectQaCount(String searchKeyword, String searchType) {
		return sqlSession.getMapper(QaMapper.class).selectQaCount();
	}
	
	//전체 리스트 검색
	@Override
	public List<Qa> selectQaList(Map<String, Object> map) {
		return sqlSession.getMapper(QaMapper.class).selectQaList(map);
	}
	
	//전체 리스트 검색
	/*
	@Override
	public List<Qa> selectQaList() {
		return sqlSession.getMapper(QaMapper.class).selectQaList();
	}
	*/

	
	/*관리자*/
	
	//1:1 문의 답변 등록
//	@Override
//	public int insertQaAnswer(Qa Qa) {
//		return sqlSession.getMapper(QaMppaer.class).insertQaAnswer(Qa);
//	}

}
