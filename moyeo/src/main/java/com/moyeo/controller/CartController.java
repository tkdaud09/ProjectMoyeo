package com.moyeo.controller;

import com.moyeo.dto.CartDTO;
import com.moyeo.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;
    
    private void setUserInfoId(HttpSession session) {
        session.setAttribute("userinfoId", "qwer1234");
    }

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public String insertPage(Model model, HttpSession session) {
        setUserInfoId(session); 
        String userinfoId = (String) session.getAttribute("userinfoId");
        List<Map<String, Object>> cartListWithPackages = cartService.getAllCartItemsWithPackages(userinfoId);
        model.addAttribute("cartListWithPackages", cartListWithPackages);
        return "cart/insert";
    }


    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam int packIdx, HttpSession session) {
    	System.out.println("packIdx = "+packIdx);
        setUserInfoId(session);
        String userinfoId = (String) session.getAttribute("userinfoId");
        CartDTO dto = new CartDTO();
        dto.setUserinfoId(userinfoId);
        dto.setPackIdx(packIdx);

        cartService.addCart(dto);

        return "redirect:/cart/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(HttpSession session, ModelAndView mav ) {
        setUserInfoId(session);
        String userinfoId = (String) session.getAttribute("userinfoId");
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartDTO> list = cartService.cartList(userinfoId);
        int sumMoney = cartService.sumMoney(userinfoId);

        map.put("list", list); 
        map.put("count", list.size());
        map.put("sumMoney", sumMoney);
        mav.setViewName("cart/cartList");
        mav.addObject("map", map);
        
        return mav;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam int cartIdx) {
        cartService.deleteCart(cartIdx);
        return "redirect:/cart/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam int[] packIdx, @RequestParam int[] packAdultcount, @RequestParam int[] packChildcount, HttpSession session) {
        setUserInfoId(session);
        String userinfoId = (String) session.getAttribute("userinfoId");

        for (int i = 0; i < packIdx.length; i++) {
            CartDTO dto = new CartDTO();
            dto.setUserinfoId(userinfoId);
            dto.setPackIdx(packIdx[i]);
            dto.setPackAdultcount(packAdultcount[i]);
            dto.setPackChildcount(packChildcount[i]);
            cartService.updateCart(dto);
        }

        return "redirect:/cart/list";
    }
}
