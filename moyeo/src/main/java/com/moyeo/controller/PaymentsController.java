package com.moyeo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moyeo.dto.CartDTO;
import com.moyeo.dto.Orders;
import com.moyeo.dto.Pack;
import com.moyeo.dto.Payment;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.security.CustomUserDetails;
import com.moyeo.service.CartService;
import com.moyeo.service.OrdersService;
import com.moyeo.service.PackageService;
import com.moyeo.service.PaymentService;
import com.moyeo.service.UserinfoService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentsController {
	private final PaymentService paymentService;
	private final CartService cartService;
	private final PackageService packageService;
	private final UserinfoService userinfoService;
	private final OrdersService ordersService;

	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String payGET(@RequestParam("cartIdx") int[] cartIdx, Model model) throws UserinfoNotFoundException {

		int sumTotal = 0;
		String sumTitle="";
		//String sumPackIdx ="";
		int[] packIdxArray = new int[cartIdx.length]; 

		List<CartDTO> cartList = new ArrayList<CartDTO>();

		CartDTO cart = new CartDTO();

		for (int i = 0; i < cartIdx.length; i++) {
			cart = cartService.getCartByIdx(cartIdx[i]);
			Pack pack = packageService.getPackageInfo(cart.getPackIdx());
			sumTotal += pack.getPackAdultPrice() * cart.getPackAdultcount()
					+ pack.getPackChildPrice() * cart.getPackChildcount();
			sumTitle+=pack.getPackTitle()+" ";
			//sumPackIdx+=pack.getPackIdx()+" ";
			packIdxArray[i] = pack.getPackIdx();
			cartList.add(cart);

		}
		model.addAttribute("userinfo", userinfoService.getUserinfoById(cart.getUserinfoId()));
		model.addAttribute("pack", packageService.getPackageInfo(cart.getPackIdx()));
		model.addAttribute("sumTotal", sumTotal);
		model.addAttribute("cartList", cartList);
		model.addAttribute("sumTitle", sumTitle);
		//model.addAttribute("sumPackIdx", sumPackIdx);
		model.addAttribute("packIdxArray", packIdxArray);

		return "payment/pay";
	}

	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	@ResponseBody
	public String payPOST(@RequestBody Payment payment, HttpSession session) {
		// 결제 관련 API를 이용하기 전에 결제 금액 검증을 위해 세션에 주문번호(이름)와 결제금액(값)을 저장
		session.setAttribute(payment.getMerchantUid(), payment.getPaymentAmount());
		return "ok";
	}
	
	// 결제 후 결제 금액을 검증하여 응답하는 요청 처리 메소드
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	@ResponseBody
	public String complete(@RequestBody Payment payment, HttpSession session, Authentication authentication) {
	    CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();

	    // 접근 토큰을 발급받아 저장
	    String accessToken = paymentService.getAccessToken(payment);

	    // 토큰과 결제고유값을 전달하여 API를 이용하여 결제정보를 반환받아 저장
	    Payment returnPayment = paymentService.getPayment(accessToken, payment.getImpUid());

	    // 세션에 저장된 결제 금액을 반환받아 저장
	    Long beforeAmount = (Long) session.getAttribute(payment.getMerchantUid());
	    session.removeAttribute(payment.getMerchantUid());

	    // 결제된 결제금액을 반환받아 저장
	    Long amount = returnPayment.getPaymentAmount();

	    returnPayment.setUserinfoId(userinfo.getId());

	    int[] packIdxArray = payment.getPackIdx();
	    String merchantUid = payment.getMerchantUid();

	    for (int packIdx : packIdxArray) {
	        Orders orders = new Orders(); 
	        orders.setUserinfoId(userinfo.getId());
	        orders.setPackIdx(packIdx);
	        orders.setMerchantUid(merchantUid);
	        ordersService.addOrders(orders); 
	    }

        if (beforeAmount == amount) {// 검증 성공
            paymentService.addPayment(returnPayment);// 테이블에 결제정보 삽입 처리
           
        } else {// 검증 실패(결제 금액 불일치) - 위변조된 결제
            paymentService.canclePayment(accessToken, returnPayment);
            return "forgery";
        }

	    return "success";
	}
	
	//결제 취소
	/*
	 @RequestMapping(value = "/cancel", method = RequestMethod.POST)
	   @ResponseBody
	   public String realCancel(@RequestBody Payment payment) {
	      Payment cancelPayment = paymentService.get
	      
	      if(cancelDonation == null) {
	         return "error";
	      }
	      
	      String accessToken = donationService.getAccessToken(cancelDonation);
	      
	      String returnValue = donationService.cancelDonation(accessToken, cancelDonation);
	      
	      if(returnValue=="success") {
	         donationService.refundDonation(cancelDonation);
	         return returnValue;
	      }
	      return "error";
	   }
	}
	*/
	
}