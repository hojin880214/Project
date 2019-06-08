package com.project.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.project.domain.CartVO;
@Repository
public class CartDAOImpl implements CartDAO {
    private static Logger log = LoggerFactory.getLogger(CartDAOImpl.class);

    @Inject
    private SqlSession sql;
    private static String namespace="com.project.mapper.CartMapper";
    @Override
    public void addCart(CartVO cart) throws Exception {
        sql.insert(namespace+".addCart",cart);
    }
    @Override
    public List<CartVO> cartList(String user_id) {
        return sql.selectList(namespace+".cartList",user_id);
    }
    @Override
    public void deleteCart(CartVO cvo) {
        sql.delete(namespace+".deleteCart",cvo);
    }
    @Override
    public void cartEmpty(String user_id) {
        sql.delete(namespace+".cartEmpty",user_id);
        
    }
}
