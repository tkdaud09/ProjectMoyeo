package com.moyeo.mapper;

import com.moyeo.dto.CartDTO;

import java.util.List;
import java.util.Map;

public interface CartMapper {
    void addCart(CartDTO cart);
    List<CartDTO> cartList(String userinfoId);
    void updateCart(CartDTO cart);
    int sumTotal(String userinfoId);
    void deleteCart(int cartIdx);
    List<Map<String, Object>> getAllCartItemsWithPackages(String userinfoId);
}
