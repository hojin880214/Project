package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Criteria;
import com.project.domain.ReviewVO;
import com.project.persistence.ProductDAO;
import com.project.persistence.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
    private static Logger log = LoggerFactory.getLogger(ReviewServiceImpl.class);

    @Inject
    private ProductDAO pdao;
    @Inject
    private ReviewDAO rdao;
    
    
    @Transactional
    @Override
    public void addReview(ReviewVO rvo) throws Exception {
        rdao.create(rvo);
        pdao.updateReviewCnt(rvo.getProduct_no(), 1);
    }

    @Override
    public void modifyReview(ReviewVO rvo) throws Exception {
        rdao.update(rvo);
    }
    
    @Transactional
    @Override
    public void removReview(Integer rno) throws Exception {
        int product_no=rdao.getProduct_no(rno);
        rdao.delete(rno);
        pdao.updateReviewCnt(product_no, -1);
    }

    @Override
    public List<ReviewVO> listReviewPage(Integer product_no, Criteria cri) throws Exception {
        return rdao.listPage(product_no, cri);
    }
    
    @Override
    public int countReview(Integer product_no) throws Exception {
        return rdao.countReview(product_no);
    }

    

}
