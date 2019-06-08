package com.project.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.Criteria;
import com.project.domain.PageMaker;
import com.project.domain.ReviewVO;
import com.project.service.ReviewService;


@RestController
@RequestMapping("/reviews")
public class ReviewController {
    private static Logger log = LoggerFactory.getLogger(ReviewController.class);

    @Inject
    private ReviewService service;
    
    
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody ReviewVO rvo) {
        ResponseEntity<String> entity = null;
        try {
            service.addReview(rvo);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("register", e.getStackTrace());
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
    
    
    @RequestMapping(value="/{product_no}/{page}", method=RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPage(
            @PathVariable("product_no") Integer product_no,
            @PathVariable("page") Integer page){
        
        ResponseEntity<Map<String, Object>> entity=null;
        
        try {
            Criteria cri=new Criteria();
            cri.setPage(page);
            PageMaker pmk=new PageMaker();
            pmk.setCri(cri);
            
            Map<String, Object> map=new HashMap<String, Object>();
            List<ReviewVO> list=service.listReviewPage(product_no, cri);
            map.put("list", list);
            
            int replyCount=service.countReview(product_no);
            pmk.setTotalCount(replyCount);
            map.put("pmk", pmk);
            
            entity=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
            
        } catch (Exception e) {
            e.printStackTrace();
            log.error("listPage",e.getStackTrace());
            entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
        }       
        return entity;
        
    }
    
    @RequestMapping(value="/{review_no}",
            method= {RequestMethod.PUT,RequestMethod.PATCH})
    public ResponseEntity<String> modify(@PathVariable("review_no") Integer review_no,
            @RequestBody ReviewVO rvo){
        
        ResponseEntity<String> entity=null;        
        try {
            rvo.setReview_no(review_no);
            service.modifyReview(rvo);
            entity=new ResponseEntity<String>("modify_success",
                    HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("modify",e.getStackTrace());
            entity=new ResponseEntity<String>(e.getMessage(),
                    HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
            
    @RequestMapping(value="/{review_no}",method=RequestMethod.DELETE)
    public ResponseEntity<String> remove(@PathVariable("review_no") Integer review_no){
        ResponseEntity<String> entity = null;
        try {
            service.removReview(review_no);
            entity=new ResponseEntity<String>("remove_success",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("remove",e.getStackTrace());
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
            
            
            
}
