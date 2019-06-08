package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.OrderVO;
import com.project.persistence.CartDAO;
import com.project.persistence.OrderDAO;
@Service
public class OrderServiceImpl implements OrderService {
    private static Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Inject
    private OrderDAO odao;
    @Inject
    private CartDAO cdao;
    
    @Transactional
    @Override
    public void orderInfo(OrderVO ovo) throws Exception {
        odao.orderInfo(ovo);
        cdao.cartEmpty(ovo.getUser_id());
    }

    @Override
    public List<OrderVO> orderList(OrderVO ovo) throws Exception {
       return odao.orderList(ovo);
    }

    @Override
    public List<OrderVO> orderListAll(OrderVO ovo) throws Exception {
        return odao.orderListAll(ovo);
    }

}
