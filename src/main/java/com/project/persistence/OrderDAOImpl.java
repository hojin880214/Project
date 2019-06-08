package com.project.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.project.domain.OrderVO;
@Repository
public class OrderDAOImpl implements OrderDAO {
    private static Logger log = LoggerFactory.getLogger(OrderDAOImpl.class);

    @Inject
    private SqlSession sql;
    private static String namespace="com.project.mapper.OrderMapper";
    
    @Override
    public void orderInfo(OrderVO ovo) throws Exception {
        sql.insert(namespace+".orderInfo",ovo);
        
    }

    @Override
    public List<OrderVO> orderList(OrderVO ovo) {
        return sql.selectList(namespace+".orderList",ovo);
    }

    @Override
    public List<OrderVO> orderListAll(OrderVO ovo) throws Exception {
        return sql.selectList(namespace+".orderListAll",ovo);
    }

}
