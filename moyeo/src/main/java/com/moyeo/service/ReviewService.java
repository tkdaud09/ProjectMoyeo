package com.moyeo.service;

import com.moyeo.dto.Review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
    void addReview(Review review);
    void modifyReview(Review review);
    void removeReview(int reviewIdx); 
    void viewcntReview(int reviewIdx); //후기 조회수

    Review getselectReviewByIdx(int reviewIdx); //게시글 조회
    Map<String, Object> getReviewList(Map<String, Object> map); //리스트
    
 
    List<String> getAllPackageTitles(); // 모든 패키지 제목을 가져오는 메서드
    
    //userinfo-details
    Map<String, Object> getMyReviewList(int pageNumm, String userinfoId);
}