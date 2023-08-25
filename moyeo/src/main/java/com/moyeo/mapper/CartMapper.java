package com.moyeo.mapper;

import com.moyeo.dto.CartDTO;

import java.util.List;

public interface CartMapper {
    void addCart(CartDTO cart);
    List<CartDTO> cartList(String userinfoId);
    void updateCart(CartDTO cart);
    int totalCart(String userinfoId);
    void deleteCart(int cartIdx);
    List<CartDTO> getAllCartItemsWithPackages(String userinfoId);
}
