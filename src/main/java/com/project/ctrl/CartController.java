package com.project.ctrl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.CartVO;
import com.project.domain.UserVO;
import com.project.service.CartService;


@Controller
@RequestMapping("/cart")
public class CartController {
    private static Logger log = LoggerFactory.getLogger(CartController.class);

    @Inject
    private CartService service;

    @ResponseBody
    @RequestMapping(value="/addCart", method = RequestMethod.POST)
    public int addCart(@RequestBody CartVO cvo, HttpSession session) throws Exception {
        int result = 0;
        UserVO uvo = (UserVO)session.getAttribute("uvo");
        log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+uvo);
        if (uvo != null) {
            cvo.setUser_id(uvo.getUser_id());
            log.info(cvo.getUser_id());
            service.addCart(cvo);
            result = 1;
        }
        return result;
       }
    
    
    
    @RequestMapping(value = "/cartList", method = RequestMethod.GET)
    public void getCartList(HttpSession session, Model model) throws Exception {
     
         UserVO uvo = (UserVO)session.getAttribute("uvo");
         log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+uvo);
         String uid = uvo.getUser_id();
         List<CartVO> cartList = service.cartList(uid);
         model.addAttribute("cartList", cartList);
     
    }
    
    
    

    @ResponseBody
    @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
    public int deleteCart(HttpSession session,
                        @RequestParam(value = "chbox[]") List<String> chArr, CartVO cvo)
                        throws Exception {

        UserVO uvo=(UserVO) session.getAttribute("uvo");
        String uid=uvo.getUser_id();

        int result=0;
        int cart_no=0;

        if (uvo!=null) {
            cvo.setUser_id(uid);

            for (String i:chArr) {
                cart_no = Integer.parseInt(i);
                cvo.setCart_no(cart_no);
                service.deleteCart(cvo);
            }
            result = 1;
        }
        return result;
    }
    
    
}
