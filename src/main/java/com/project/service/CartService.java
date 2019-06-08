package com.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.domain.CartVO;

public interface CartService {
    public void addCart(CartVO cvo) throws Exception;
    public List<CartVO> cartList(String user_id);
    public void deleteCart(CartVO cvo) throws Exception;
    public void cartEmpty(String user_id) throws Exception;
}
