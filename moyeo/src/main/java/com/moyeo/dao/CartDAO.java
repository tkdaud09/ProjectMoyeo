package com.moyeo.dao;

import java.util.List;

import com.moyeo.dao.CartDTO;

public interface CartDAO {
    void addToCart(CartDTO cart);
    List<CartDTO> getCartById(String id);
    List<CartDTO> getCartDetailsByUserId(String id);
}