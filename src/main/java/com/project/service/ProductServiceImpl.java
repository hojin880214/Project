package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;
import com.project.domain.ReviewVO;
import com.project.domain.SearchCriteria;
import com.project.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
    private static Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);

    @Inject
    private ProductDAO pdao;

    @Transactional
    @Override
    public void regist(ProductVO pvo) throws Exception {
        pdao.create(pvo);
        String[] files=pvo.getFiles();
        log.info(">>>>>>>>>>>>>"+files.toString());
        if(files != null) {
            for(String file_fullname : files) {
                pdao.insertFile(file_fullname);
            }
        }
    }

    @Override
    public ProductVO read(Integer product_no) throws Exception {
        return pdao.read(product_no);
    }

    @Transactional
    @Override
    public void modify(ProductVO pvo) throws Exception {
        pdao.update(pvo);
        Integer product_no=pvo.getProduct_no();
        pdao.deleteFile(product_no);
        String[] files=pvo.getFiles();
        if(files !=null) {
            for(String file_fullname : files) {
                pdao.updateFile(file_fullname, product_no);
            }
        }
    }

    
    @Transactional
    @Override
    public void remove(Integer product_no) throws Exception {
        pdao.deleteFile(product_no);
        pdao.delete(product_no);
    }

    

    @Override
    public List<String> getFileList(Integer product_no) throws Exception {
        return pdao.readFiles(product_no);
    }
    
  

    
/*     @Override
     public List<ProductVO> listSearch(SearchCriteria scri) throws Exception { 
         return pdao.listSearch(scri);
    }*/
     
     

    @Override
    public int countSearchList(SearchCriteria scri, String product_category) throws Exception {
        // TODO Auto-generated method stub
        return pdao.countSearchTotal(scri, product_category);
    }

    @Override
    public List<ProductVO> cateList(SearchCriteria scri, String product_category) throws Exception {
        return pdao.cateList(scri, product_category);
    }

    @Override
    public List<ProductVO> cateList(SearchCriteria scri) throws Exception {
        return pdao.cateList(scri);
    }

    @Override
    public int countSearchList(SearchCriteria scri) throws Exception {
        return pdao.countSearchTotal(scri);
    }

    @Override
    public List<ProductVO> mainList(String product_category) throws Exception {
        return pdao.mainCateList(product_category);
    }

    @Override
    public List<ReviewVO> listReviewPage(Integer product_no, Criteria cri) throws Exception {
        return pdao.listReviewPage(product_no, cri);
    }



   

}
