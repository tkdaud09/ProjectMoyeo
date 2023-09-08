package com.moyeo.mapper;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Review;

public interface ReviewMapper {
    int insertReview(Review review);
    int updateReview(Review review);
    int deleteReview(int reviewIdx);

    Review selectReviewByTitle(String reviewTitle);
    Review selectReviewByContent(String reviewContent);
    Review selectReview(int reviewIdx);

    int selectReviewCount();
    List<Review> selectReviewList(Map<String, Object> map);
}