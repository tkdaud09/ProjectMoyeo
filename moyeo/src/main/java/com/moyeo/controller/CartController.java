package com.moyeo.controller;

import com.moyeo.dto.CartDTO;
import com.moyeo.dto.Userinfo;
import com.moyeo.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;
    
 
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@ModelAttribute CartDTO dto, HttpSession session, Model model) {
        String userinfoId = ((Userinfo) session.getAttribute("userinfo")).getId();
        dto.setUserinfoId(userinfoId);

        // 장바구니에 이미 동일한 packIdx가 있는지 확인
        List<CartDTO> cartList = cartService.cartList(userinfoId);

        boolean alreadyExists = false;

        for (CartDTO existingItem : cartList) {
            if (existingItem.getPackIdx() == dto.getPackIdx()) {
                // 이미 동일한 packIdx가 있는 경우, 추가하지 않음
                alreadyExists = true;
                break;
            }
        }

        if (!alreadyExists) {
            // 이미 있는 상품이 아니면 추가
            cartService.addCart(dto);
            // 모델에 메시지 추가
            model.addAttribute("message", "장바구니에 상품이 추가되었습니다.");
        } else {
            // 이미 동일한 상품이 있음을 메시지로 알림
            model.addAttribute("message", "이미 장바구니에 같은 상품이 있습니다.");
        }

        return "redirect:/cart/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(HttpSession session, ModelAndView mav ) {
    	String userinfoId = ((Userinfo) session.getAttribute("userinfo")).getId();;
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartDTO> list = cartService.cartList(userinfoId);
        int sumTotal = cartService.sumTotal(userinfoId);

        map.put("list", list); 
        map.put("count", list.size());
        map.put("sumTotal", sumTotal);
        mav.setViewName("cart/cartList");
        mav.addObject("map", map);
        
        return mav;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest request) {
        String[] cartIdxArray = request.getParameterValues("cartIdx");

        if (cartIdxArray != null && cartIdxArray.length > 0) {
            for (String cartIdxStr : cartIdxArray) {
                int cartIdx = Integer.parseInt(cartIdxStr);
                cartService.deleteCart(cartIdx);
            }
        }

        return "redirect:/cart/list";
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
	    public String update(@RequestParam int[] cartIdx, 
	                         @RequestParam int[] packAdultcount, 
	                         @RequestParam int[] packChildcount, 
                         HttpSession session) {
        String userinfoId = ((Userinfo) session.getAttribute("userinfo")).getId();
        
        for (int i = 0; i < cartIdx.length; i++) {
            CartDTO dto = new CartDTO();
            dto.setUserinfoId(userinfoId);
            dto.setCartIdx(cartIdx[i]);
            dto.setPackAdultcount(packAdultcount[i]);
            dto.setPackChildcount(packChildcount[i]);

            cartService.updateCart(dto);
        }

        return "redirect:/cart/list";
    }
}
