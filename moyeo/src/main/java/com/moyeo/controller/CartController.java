package com.moyeo.controller;

import com.moyeo.dto.CartDTO;
import com.moyeo.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shop/cart/*")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @PostMapping("insert.do")
    public String insert(@ModelAttribute CartDTO dto, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        dto.setUserinfoId(userId);

        int count = cartService.cartList(userId).size();
        if (count == 0) {
            cartService.addCart(dto);
        } else {
            cartService.updateCart(dto);
        }

        return "redirect:/shop/cart/list.do";
    }

    @GetMapping("list.do")
    public String list(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        List<CartDTO> cartList = cartService.cartList(userId);
        int sumMoney = cartService.totalCart(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("cartList", cartList);
        map.put("count", cartList.size());
        map.put("sumMoney", sumMoney);

        model.addAttribute("map", map);
        return "cartList";
    }

    @PostMapping("delete.do")
    public String delete(@RequestParam int cartIdx) {
        cartService.deleteCart(cartIdx);
        return "redirect:/shop/cart/list.do";
    }

    @PostMapping("update.do")
    public String update(@RequestParam int[] packIdx, HttpSession session) {
        String userId = (String) session.getAttribute("userId");

        for (int i = 0; i < packIdx.length; i++) {
            CartDTO dto = new CartDTO();
            dto.setUserinfoId(userId);
            dto.setPackIdx(packIdx[i]);
            cartService.updateCart(dto);
        }

        return "redirect:/shop/cart/list.do";
    }
}

