package com.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.domain.OrderVO;
import com.project.domain.ProductVO;
import com.project.domain.SearchCriteria;

public interface OrderService {
    
    public void orderInfo(OrderVO ovo) throws Exception;
    public List<OrderVO> orderList(OrderVO ovo) throws Exception;
    public List<OrderVO> orderListAll(OrderVO ovo) throws Exception;
}
