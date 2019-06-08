package com.project.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.domain.CartVO;

public interface CartDAO {
    public void addCart(CartVO cart) throws Exception;
    public List<CartVO> cartList(String user_id);
    public void deleteCart(CartVO cvo);
    public void cartEmpty(String user_id);
}
