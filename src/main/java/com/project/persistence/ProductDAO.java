package com.project.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;
import com.project.domain.ReviewVO;
import com.project.domain.SearchCriteria;

public interface ProductDAO {

    public void create(ProductVO pvo) throws Exception;
    public ProductVO read(Integer product_no) throws Exception;
    public void update(ProductVO pvo) throws Exception;
    public void delete(Integer product_no) throws Exception;

    
    
  //For SearchBoard
    public List<ProductVO> listSearch(SearchCriteria scri) throws Exception;
    public List<ProductVO> cateList(SearchCriteria scri)throws Exception;
    public List<ProductVO> cateList(SearchCriteria scri,String product_category) throws Exception;
    public int countSearchTotal(SearchCriteria scri)throws Exception;
    public int countSearchTotal(SearchCriteria scri,String product_category) throws Exception;
    
  //For Review
    public void updateReviewCnt(Integer product_no, int amount) throws Exception;
    public List<ReviewVO> listReviewPage(Integer product_no, Criteria cri)throws Exception;
    
    
  //For File
    public void insertFile(String file_fullname) throws Exception;
    public List<String> readFiles(Integer product_no) throws Exception;
    public void deleteFile(Integer product_no) throws Exception;
    public void updateFile(String file_fullname, Integer product_no) throws Exception;
    public List<ProductVO> mainCateList(String product_category) throws Exception;
 
    
}
