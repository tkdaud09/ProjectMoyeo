package com.moyeo.dao;

import com.moyeo.dto.CartDTO;
import com.moyeo.mapper.CartMapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {

    private final SqlSession sqlSession;

    @Override
    public void addCart(CartDTO cartDTO) {
        sqlSession.insert("com.moyeo.mapper.CartMapper.addCart", cartDTO);
    }

    @Override
    public List<CartDTO> cartList(String userinfoId) {
        return sqlSession.selectList("com.moyeo.mapper.CartMapper.cartList", userinfoId);
    }

    @Override
    public void updateCart(CartDTO cartDTO) {
        sqlSession.update("com.moyeo.mapper.CartMapper.updateCart", cartDTO);
    }

    @Override
    public int sumTotal(String userinfoId) {
        if (userinfoId == null) {
            // userId가 null인 경우에 대한 예외 처리 또는 반환값 설정
            return 0; // 예시로 반환값을 0으로 설정
        }
        
        Integer sumTotal = sqlSession.selectOne("com.moyeo.mapper.CartMapper.sumTotal", userinfoId);
        return sumTotal != null ? sumTotal : 0;
    }

    @Override
    public void deleteCart(int cartIdx) {
        sqlSession.delete("com.moyeo.mapper.CartMapper.deleteCart", cartIdx);
    }

    @Override
    public List<Map<String, Object>> getAllCartItemsWithPackages(String userinfoId) {
        return sqlSession.selectList("com.moyeo.mapper.CartMapper.getAllCartItemsWithPackages", userinfoId);
    }
    
	@Override
	public CartDTO selectCartByIdx(int cartIdx) {
		 return sqlSession.getMapper(CartMapper.class).selectCartByIdx(cartIdx);
	}
}