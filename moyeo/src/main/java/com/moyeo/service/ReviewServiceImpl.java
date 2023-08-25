package com.moyeo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import com.moyeo.dao.ReviewDAO;
import com.moyeo.dto.Review;
import com.moyeo.exception.ReviewNotFoundException;
import com.moyeo.util.Pager;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{
    private final ReviewDAO reviewDAO;

	@Override
	public void addReview(Review review) {
		 reviewDAO.insertReview(review);
		
	}

	@Override
	public void modifyReview(Review review) {
		reviewDAO.updateReview(review);
		
	}

	@Override
	public void removeReview(int userinfoId) {
	    Review existingReview = reviewDAO.selectReview(userinfoId);
	    if (existingReview == null) {
	        throw new ReviewNotFoundException("리뷰를 찾을 수 없습니다");
	    }
	    reviewDAO.deleteReview(userinfoId);
	}
	

	@Override
	public Review getReviewByTitle(String reviewTitle) {
		return reviewDAO.selectReviewByTitle(reviewTitle);
	}

	@Override
	public Review getReviewByContent(String reviewContent) {
		return reviewDAO.selectReviewByContent(reviewContent);
	}

	@Override
	public Review getReview(int userinfoId) {
		return reviewDAO.selectReview(userinfoId);
	}
	

	@Override
	public Map<String, Object> getReviewList(int pageNum) {
		int totalBoard=reviewDAO.selectReviewCount();
		
		Pager pager=new Pager(pageNum, totalBoard, 5, 5);
		
		Map<String, Object> pageMap=new HashMap<String, Object>();
        pageMap.put("startRow", pager.getStartRow());
        pageMap.put("endRow", pager.getEndRow());
        
        List<Review> reviewList=reviewDAO.selectReviewList(pageMap);
        
        Map<String, Object> resultMap=new HashMap<String, Object>();
        resultMap.put("reviewList", reviewList);
        resultMap.put("pager", pager);

		return resultMap;
	}


    
    
}
