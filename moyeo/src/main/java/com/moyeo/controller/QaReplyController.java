package com.moyeo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moyeo.dto.QaReply;
import com.moyeo.service.QaReplyService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/reply")
public class QaReplyController {

	@Autowired
	private QaReplyService qaReplyService;

	 /*
	 @RequestMapping(value = "/write", method=RequestMethod.POST) 
	 public String addQaReplyPOST(QaReply qaReply) { 
			 
		 qaReplyService.addQaReply(qaReply);
		 
		 int qaIdx = qaReply.getQaIdx(); 
		 
		 return "redirect:/qa/detail/" + qaIdx;  
	 
	 }
	 */
	
	/*AJAX*/
	 
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public @ResponseBody QaReply addQaReplyPOST(QaReply qaReply) {
		
		qaReplyService.addQaReply(qaReply);

		// 댓글을 추가한 후 추가된 댓글 데이터를 반환
		QaReply response = new QaReply();
		response.setUserinfoId(qaReply.getUserinfoId());
		response.setQaReplyContent(qaReply.getQaReplyContent());
		
		return response;
	}
	
	
}
