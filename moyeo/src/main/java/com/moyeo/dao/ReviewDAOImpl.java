package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Review;
import com.moyeo.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReviewDAOImpl implements ReviewDAO {
	private final SqlSession sqlSession;
	
	@Override
	public int insertReview(Review review) {
		return sqlSession.getMapper(ReviewMapper.class).insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return sqlSession.getMapper(ReviewMapper.class).updateReview(review);
	}

	@Override
	public int deleteReview(int reviewIdx) {
		return sqlSession.getMapper(ReviewMapper.class).deleteReview(reviewIdx);
	}
	
	@Override //후기 조회수
	public void viewcntReview(int reviewIdx) {
	    sqlSession.getMapper(ReviewMapper.class).viewcntReview(reviewIdx);
	}

	@Override
	public Review selectReviewByIdx(int reviewIdx) {
		 return sqlSession.getMapper(ReviewMapper.class).selectReviewByIdx(reviewIdx);
	}

	@Override
	public int selectReviewCount(Map<String, Object> map) {
		 return sqlSession.getMapper(ReviewMapper.class).selectReviewCount(map);
	}

	@Override
	public List<Review> selectReviewList(Map<String, Object> map) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewList(map);
	}

	@Override
    public List<String> getAllPackageTitles() {
        //매퍼를 통해 모든 패키지 제목을 가져옴
        return sqlSession.getMapper(ReviewMapper.class).getAllPackageTitles();
    }
	
	@Override //매퍼를 통해 최신리뷰 가져온거
    public List<Review> selectLatestReviews(int count) {
        return sqlSession.getMapper(ReviewMapper.class).selectLatestReviews(count);
    }
    
	
    //userinfo-details
	@Override
	public int selectMyReviewCount(String userinfoId) {
		return sqlSession.getMapper(ReviewMapper.class).selectMyReviewCount(userinfoId);
	}

	@Override
	public List<Review> selectMyReviewList(Map<String, Object> map) {
		return sqlSession.getMapper(ReviewMapper.class).selectMyReviewList(map);
	}
}
