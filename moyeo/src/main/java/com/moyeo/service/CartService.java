package com.moyeo.service;

import com.moyeo.dto.CartDTO;

import java.util.List;
import java.util.Map;

public interface CartService {
    void addCart(CartDTO cartDTO);
    List<CartDTO> cartList(String userinfoId);
    void updateCart(CartDTO cartDTO);
    int sumTotal(String userinfoId);
    void deleteCart(int cartIdx);
    List<Map<String, Object>> getAllCartItemsWithPackages(String userinfoId);
}
