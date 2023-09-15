package com.moyeo.mapper;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Review;

public interface ReviewMapper {
    int insertReview(Review review);
    int updateReview(Review review);
    int deleteReview(int reviewIdx);
    int viewcntReview(int reviewIdx); //후기 조회수

    Review selectReviewByIdx(int reviewIdx); //해당게시물 조회
    int selectReviewCount(Map<String, Object> map); //게시물 수 조회, 검색조건
    List<Review> selectReviewList(Map<String, Object> map); //게시물 목록 조회, 검색조건, 페이지
    
    List<String> getAllPackageTitles(); // 모든 패키지 제목을 가져오는 메서드
    
    //userinfo-details
    int selectMyReviewCount(String userinfoId);
    List<Review> selectMyReviewList(Map<String, Object> map);
}