package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.project.domain.CartVO;
import com.project.persistence.CartDAO;
@Service
public class CartServiceImpl implements CartService {
    private static Logger log = LoggerFactory.getLogger(CartServiceImpl.class);

    
    @Inject
    private CartDAO cdao;


    @Override
    public void addCart(CartVO cvo) throws Exception {
        cdao.addCart(cvo);
        
    }


    @Override
    public List<CartVO> cartList(String user_id) {
        return cdao.cartList(user_id);
    }


    @Override
    public void deleteCart(CartVO cvo) throws Exception {
        cdao.deleteCart(cvo);
        
    }


    @Override
    public void cartEmpty(String user_id) throws Exception {
        cdao.cartEmpty(user_id);
        
    }
}
