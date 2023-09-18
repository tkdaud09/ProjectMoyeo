package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Review;

public interface ReviewDAO {
    int insertReview(Review review);
    int updateReview(Review review);
    int deleteReview(int reviewIdx); 
    void viewcntReview(int reviewIdx); //후기 조회수

    Review selectReviewByIdx(int reviewIdx); //해당게시물 조회
    int selectReviewCount(Map<String, Object> map); //게시물 수 조회, 검색조건
    List<Review> selectReviewList(Map<String, Object> map); //게시물 목록 조회, 검색조건, 페이지
 
    List<String> getAllPackageTitles(); // 모든 패키지 제목을 가져오는 메서드
    
    List<Review> selectLatestReviews(int count); //메인에 최신리뷰 3개
    
    //userinfo-details
    int selectMyReviewCount(String userinfoId);
    List<Review> selectMyReviewList(Map<String, Object> map);
    
    /* 마이페이지 */
    List<Review> selectUserReviewListById(String userinfoId);//유저별 Review 목록 조회 - 페이징 X
}