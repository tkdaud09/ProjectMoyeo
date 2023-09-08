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

    @Override
    public Review selectReviewByTitle(String reviewTitle) {
        return sqlSession.getMapper(ReviewMapper.class).selectReviewByTitle(reviewTitle);
    }

    @Override
    public Review selectReviewByContent(String reviewContent) {
        return sqlSession.getMapper(ReviewMapper.class).selectReviewByContent(reviewContent);
    }

    @Override
    public Review selectReview(int reviewIdx) {
        return sqlSession.getMapper(ReviewMapper.class).selectReview(reviewIdx);
    }

    @Override
    public int selectReviewCount() {
        return sqlSession.getMapper(ReviewMapper.class).selectReviewCount();
    }

    @Override
    public List<Review> selectReviewList(Map<String, Object> map) {
        return sqlSession.getMapper(ReviewMapper.class).selectReviewList(map);
    }
}
