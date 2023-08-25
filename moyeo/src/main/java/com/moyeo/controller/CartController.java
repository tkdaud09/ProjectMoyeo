package com.moyeo.controller;

import com.moyeo.dto.CartDTO;
import com.moyeo.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public String insert(@RequestParam int packIdx, HttpSession session) {
        session.setAttribute("userinfoId", "5");
        String userinfoId = (String) session.getAttribute("userinfoId");

        CartDTO dto = new CartDTO();
        dto.setUserinfoId(userinfoId);
        dto.setPackIdx(packIdx);

        cartService.addCart(dto);

        return "redirect:/cart/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpSession session, Model model) {
        String userinfoId = (String) session.getAttribute("userinfoId");
        List<CartDTO> cartList = cartService.cartListWithPackages(userinfoId);
        int sumMoney = cartService.totalCart(userinfoId);

        Map<String, Object> map = new HashMap<>();
        map.put("cartList", cartList);
        map.put("count", cartList.size());
        map.put("sumMoney", sumMoney);

        model.addAttribute("map", map);
        return "cart/cartList";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam int cartIdx) {
        cartService.deleteCart(cartIdx);
        return "redirect:/cart/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam int[] packIdx, HttpSession session) {
        String userinfoId = (String) session.getAttribute("userinfoId");

        for (int i = 0; i < packIdx.length; i++) {
            CartDTO dto = new CartDTO();
            dto.setUserinfoId(userinfoId);
            dto.setPackIdx(packIdx[i]);
            cartService.updateCart(dto);
        }

        return "redirect:/cart/list";
    }
}
