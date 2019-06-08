package com.project.ctrl;

import java.awt.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.OrderVO;
import com.project.domain.UserVO;
import com.project.service.OrderService;


@Controller
@RequestMapping("/order/*")
public class OrderController {
    private static Logger log = LoggerFactory.getLogger(OrderController.class);

    @Inject
    OrderService service;
    
    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String order(HttpSession session, OrderVO ovo) throws Exception {
   
     UserVO uvo = (UserVO)session.getAttribute("uvo");  
     ovo.setUser_id(uvo.getUser_id());
     
     service.orderInfo(ovo);  
     
     return "redirect:/order/orderList";
    }

    @RequestMapping(value = "/orderList", method = RequestMethod.GET)
    public void getOrderList(HttpSession session, OrderVO ovo, Model model) throws Exception {
        
     UserVO uvo = (UserVO)session.getAttribute("uvo");
     ovo.setUser_id(uvo.getUser_id());
     log.info(">>>>>>>>>>>>>>>>>>>>>>>>>"+uvo.getUser_id());
     model.addAttribute("orderList", service.orderList(ovo));
    }
    
    @RequestMapping(value = "/orderListAll", method = RequestMethod.GET)
    public void getOrderListAll(HttpSession session, OrderVO ovo, Model model) throws Exception {
        
     UserVO uvo = (UserVO)session.getAttribute("uvo");
     ovo.setUser_id(uvo.getUser_id());
     log.info(">>>>>>>>>>>>>>>>>>>>>>>>>"+uvo.getUser_id());
     model.addAttribute("orderList", service.orderListAll(ovo));
    }
}
