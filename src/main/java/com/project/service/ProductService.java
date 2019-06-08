package com.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;
import com.project.domain.ReviewVO;
import com.project.domain.SearchCriteria;

public interface ProductService {

    public void regist(ProductVO pvo) throws Exception;
    public ProductVO read(Integer product_no) throws Exception;
    public void modify(ProductVO pvo) throws Exception;
    public void remove(Integer product_no) throws Exception;
   

    public List<ReviewVO> listReviewPage(Integer product_no, Criteria cri)throws Exception;
    
    //For File
    public List<String> getFileList(Integer product_no) throws Exception;
    
    //For Search Board
    public List<ProductVO> cateList(SearchCriteria scri) throws Exception;
    public int countSearchList(SearchCriteria scri) throws Exception;   
    public List<ProductVO> cateList(SearchCriteria scri,String product_category) throws Exception;
    public int countSearchList(SearchCriteria scri,String product_category) throws Exception;
    public List<ProductVO> mainList(String product_category) throws Exception;
   
}
