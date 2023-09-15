package com.moyeo.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moyeo.dto.QaReply;
import com.moyeo.service.QaReplyService;
import com.moyeo.service.QaService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/reply")
public class QaReplyController {

	@Autowired
	private QaReplyService qaReplyService;
	
	@Autowired
	private QaService qaService;
	
	/* 댓글 등록 */
	
	 /*
	 @RequestMapping(value = "/write", method=RequestMethod.POST) 
	 public String addQaReplyPOST(QaReply qaReply) { 
			 
		 qaReplyService.addQaReply(qaReply);
		 
		 int qaIdx = qaReply.getQaIdx(); 
		 
		 return "redirect:/qa/detail/" + qaIdx;  
	 
	 }
	 */
	
	/* 댓글 등록 - AJAX*/
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public @ResponseBody QaReply addQaReplyPOST(QaReply qaReply) {
		
		qaReplyService.addQaReply(qaReply);

		// 댓글을 추가한 후 추가된 댓글 데이터를 반환
		QaReply response = new QaReply();
		response.setUserinfoId(qaReply.getUserinfoId());
		response.setQaReplyContent(qaReply.getQaReplyContent());
		
		return response;
	}
	
	
	/* 댓글 수정  */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyQaReplyGET(@RequestParam("qaIdx") int qaIdx 
							   	,@RequestParam("qaReplyIdx") int qaReplyIdx
							    ,Model model) {
		
		QaReply qaReply = new QaReply();
		qaReply.setQaIdx(qaIdx);
		qaReply.setQaReplyIdx(qaReplyIdx);
		
		QaReply reply = qaReplyService.getQaReply(qaReply);
		
		model.addAttribute("reply", reply);
		
		return "/qa_reply/qa_reply_modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyQaReplyPOST(QaReply qaReply) {
		
		qaReplyService.modifyQaReply(qaReply);
		
		 int qaIdx = qaReply.getQaIdx(); 
		 
		return "redirect:/qa/detail/" + qaIdx;
	}
	
	
	
	/*댓글 삭제 - AJAX*/
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteQaReply(@RequestBody QaReply qaReply) {
		
        try {
            qaReplyService.removeQaReply(qaReply);
            
            int qaIdx = qaReply.getQaIdx();
            
            // 댓글 갯수 조회
            int replyCount = qaReplyService.getQaReplyCount(qaIdx);

            // 댓글 갯수가 0인 경우 qa_reply_status를 0으로 업데이트
            if (replyCount == 0) {
              qaService.modifyReplyStatusToZero(qaIdx);
            }
            
            return new ResponseEntity<>("댓글이 성공적으로 삭제되었습니다.", HttpStatus.OK);
            
        } catch (Exception e) {
            return new ResponseEntity<>("댓글 삭제 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
