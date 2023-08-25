package com.moyeo.service;

import com.moyeo.dao.CartDAO;
import com.moyeo.dto.CartDTO;
import lombok.RequiredArgsConstructor;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

    private final CartDAO cartDAO;

    @Override
    public void addCart(CartDTO cartDTO) {
        try {
            cartDAO.addCart(cartDTO);
        } catch (DataIntegrityViolationException ex) {
            ex.printStackTrace();
            throw ex; 
        }
    }

    @Override
    public List<CartDTO> cartList(String userinfoId) {
        List<CartDTO> cartList = cartDAO.cartList(userinfoId);
        if (cartList == null) {
            // Handle case where cartList is null or empty
            // For example, you can return an empty list
            return Collections.emptyList();
        }
        return cartList;
    }

    @Override
    public void updateCart(CartDTO cartDTO) {
        cartDAO.updateCart(cartDTO);
    }

    @Override
    public int totalCart(String userinfoId) {
        Integer totalCart = cartDAO.totalCart(userinfoId);
        return totalCart != null ? totalCart : 0; // Return 0 if totalCart is null
    }

    @Override
    public void deleteCart(int cartIdx) {
        cartDAO.deleteCart(cartIdx);
        
    }
    @Override
    public List<CartDTO> cartListWithPackages(String userinfoId) {
        List<CartDTO> cartList = cartDAO.cartListWithPackages(userinfoId); // 추가
        if (cartList == null) {
            // Handle case where cartList is null or empty
            // For example, you can return an empty list
            return Collections.emptyList();
        }
        return cartList;
    }
}
