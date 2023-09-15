package com.moyeo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import com.moyeo.dao.ReviewDAO;
import com.moyeo.dto.Review;
import com.moyeo.util.Pager;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	 private final ReviewDAO reviewDAO;
	 /*private final UserinfoDAO userinfoDAO;*/

	 
	 
	@Transactional(rollbackFor = IllegalArgumentException.class) 
	@Override
	public void addReview(Review review) {
		/*if(userinfoDAO.selectUserinfo(review.getUserinfoId()) == null) {
			throw new IllegalArgumentException("게시글 작성자를 찾을 수 없습니다.");
		}*/
		reviewDAO.insertReview(review);
	}
	
	
	
	@Transactional(rollbackFor = IllegalArgumentException.class) 
	@Override
	public void modifyReview(Review review) {
		/*if(userinfoDAO.selectUserinfo(review.getUserinfoId()) == null) {
			throw new IllegalArgumentException("게시글 작성자를 찾을 수 없습니다.");
		}*/
		
		if(reviewDAO.selectReviewByIdx(review.getReviewIdx()) == null) {
			throw new IllegalArgumentException("게시글을 찾을 수 없습니다.");
		}
		reviewDAO.updateReview(review);
	}

	
	@Transactional(rollbackFor = IllegalArgumentException.class) 
	@Override
	public void removeReview(int reviewIdx) {
		if(reviewDAO.selectReviewByIdx(reviewIdx) == null) {
			throw new IllegalArgumentException("게시글을 찾을 수 없습니다.");
		}
		reviewDAO.deleteReview(reviewIdx);
	}

	
	@Override
   public void viewcntReview(int reviewIdx) {
      reviewDAO.viewcntReview(reviewIdx);
      
   }
	
	
	@Override
	public Review getselectReviewByIdx(int reviewIdx) {
		Review review=reviewDAO.selectReviewByIdx(reviewIdx);
		if(review == null) {
			throw new IllegalArgumentException("게시글을 찾을 수 없습니다.");
		}
		review.setReviewContent(review.getReviewContent().replaceAll("\\n", "<br>"));
		return review;

	}
	
	
	

	@Override
	public Map<String, Object> getReviewList(Map<String, Object> map) {
		int pageNum=1;
		if(map.get("pageNum") != null && !map.get("pageNum").equals("")) {
			pageNum=Integer.parseInt((String)map.get("pageNum"));
		}
		int pageSize=10;
		int totalBoard=reviewDAO.selectReviewCount(map);
		int blockSize=10;
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());
		List<Review> reviewList=reviewDAO.selectReviewList(map);
		
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("pager", pager);
		result.put("reviewList", reviewList);
		
		return result;
	}


	@Override
    public List<String> getAllPackageTitles() {
        // ReviewDAO를 통해 모든 패키지 제목을 가져옴
        return reviewDAO.getAllPackageTitles();
    }

    //userinfo-details
	@Override
	public Map<String, Object> getMyReviewList(int pageNum, String userinfoId) {
		int totalBoard = reviewDAO.selectMyReviewCount(userinfoId);
		int blockSize = 5;
		int pageSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("userinfoId", userinfoId);
		
		List<Review> reviewList = reviewDAO.selectMyReviewList(pageMap);
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("reviewList", reviewList);
		reviewMap.put("pager", pager);
		
		return reviewMap;
	}
}
