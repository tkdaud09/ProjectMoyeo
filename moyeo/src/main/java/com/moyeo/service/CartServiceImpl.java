package com.moyeo.service;

import com.moyeo.dao.CartDAO;
import com.moyeo.dto.CartDTO;
import lombok.RequiredArgsConstructor;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

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
            return Collections.emptyList();
        }
        return cartList;
    }

    @Override
    public void updateCart(CartDTO cartDTO) {
        cartDAO.updateCart(cartDTO);
    }

    @Override
    public int sumTotal(String userinfoId) {
        if (userinfoId == null) {
            // userId가 null인 경우에 대한 예외 처리 또는 반환값 설정
            return 0; // 예시로 반환값을 0으로 설정
        }
        
        Integer sumTotal = cartDAO.sumTotal(userinfoId);
        return sumTotal != null ? sumTotal : 0; // Return 0 if totalCart is null
    }

    @Override
    public void deleteCart(int cartIdx) {
        cartDAO.deleteCart(cartIdx);
    }

    @Override
    public List<Map<String, Object>> getAllCartItemsWithPackages(String userinfoId) {
        List<Map<String, Object>> cartList = cartDAO.getAllCartItemsWithPackages(userinfoId);
        if (cartList == null) {
            // Handle case where cartList is null or empty
            // For example, you can return an empty list
            return Collections.emptyList();
        }
        return cartList;
    }

	@Override
	public CartDTO getCartByIdx(int cartIdx) {
		return cartDAO.selectCartByIdx(cartIdx);
	}
}
