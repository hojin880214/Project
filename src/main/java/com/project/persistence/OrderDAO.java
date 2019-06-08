package com.project.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.domain.OrderVO;

public interface OrderDAO {
    public void orderInfo(OrderVO ovo) throws Exception;
    public List<OrderVO> orderList(OrderVO ovo) throws Exception;
    public List<OrderVO> orderListAll(OrderVO ovo) throws Exception;
}
