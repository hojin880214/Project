package com.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.domain.Criteria;
import com.project.domain.ReviewVO;

public interface ReviewService {
    public int countReview(Integer product_no)throws Exception;
    public void addReview(ReviewVO rvo) throws Exception;
    public void modifyReview(ReviewVO rvo) throws Exception;
    public void removReview(Integer rno) throws Exception;
    public List<ReviewVO> listReviewPage(Integer product_no, Criteria cri)throws Exception;
}
