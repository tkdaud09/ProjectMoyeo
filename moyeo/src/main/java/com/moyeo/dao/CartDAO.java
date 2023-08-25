package com.moyeo.dao;

import com.moyeo.dto.CartDTO;

import java.util.List;

public interface CartDAO {
    void addCart(CartDTO cartDTO);
    List<CartDTO> cartList(String userinfoId);
    void updateCart(CartDTO cartDTO);
    int totalCart(String userinfoId);
    void deleteCart(int cartIdx);
    List<CartDTO> cartListWithPackages(String userinfoId);
}
