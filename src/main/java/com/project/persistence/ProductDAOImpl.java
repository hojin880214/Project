package com.project.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;
import com.project.domain.ReviewVO;
import com.project.domain.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {
    private static Logger log = LoggerFactory.getLogger(ProductDAOImpl.class);

    @Inject
    private SqlSession sql;
    private static String namespace="com.project.mapper.PBoardMapper";
    
    @Override
    public void create(ProductVO pvo) throws Exception {
        sql.insert(namespace+".create",pvo);

    }

    @Override
    public ProductVO read(Integer product_no) throws Exception {
        return sql.selectOne(namespace+".read", product_no);
    }

    @Override
    public void update(ProductVO pvo) throws Exception {
        sql.update(namespace+".update",pvo);
    }

    @Override
    public void delete(Integer product_no) throws Exception {
        sql.delete(namespace+".delete",product_no);
    }

 
    @Override
    public List<ProductVO> listSearch(SearchCriteria scri) throws Exception {
        return sql.selectList(namespace+".listSearch", scri);
    }

    @Override
    public int countSearchTotal(SearchCriteria scri,String product_category) throws Exception {
        Map<String, Object> paramMap=new HashMap<String, Object>();
        paramMap.put("product_category", product_category);
        paramMap.put("scri", scri);
        return sql.selectOne(namespace+".countSearchTotal",paramMap);
    }

    @Override
    public int countSearchTotal(SearchCriteria scri) throws Exception {
        return sql.selectOne(namespace+".countSearchTotalAll",scri);
    }
    
    @Override
    public List<ProductVO> cateList(SearchCriteria scri,String product_category) throws Exception {
        Map<String, Object> paramMap=new HashMap<String, Object>();
        paramMap.put("product_category", product_category);
        paramMap.put("scri", scri);
        
        return sql.selectList(namespace+".cateList", paramMap);
    }

    
    @Override
    public List<ProductVO> cateList(SearchCriteria scri) throws Exception {
        return sql.selectList(namespace+".allList",scri);
    }

    @Override
    public void updateReviewCnt(Integer product_no, int amount) throws Exception {
        Map<String, Object> paramMap=new HashMap<String, Object>();
        paramMap.put("product_no", product_no);
        paramMap.put("amount", amount);
        sql.update(namespace+".updateReviewCnt", paramMap);
        
    }


    @Override
    public void insertFile(String file_fullname) throws Exception {
        sql.insert(namespace+".insertFile", file_fullname);
    }

    @Override
    public List<String> readFiles(Integer product_no) throws Exception {
        return sql.selectList(namespace+".readFiles", product_no);
    }

    @Override
    public void deleteFile(Integer product_no) throws Exception {
        sql.delete(namespace+".deleteFile", product_no);
    }

    @Override
    public void updateFile(String file_fullname, Integer product_no) throws Exception {
        Map<String, Object> paramMap=new HashMap<String, Object>();
        paramMap.put("product_no", product_no);
        paramMap.put("file_fullname", file_fullname);
        sql.update(namespace+".updateFile", paramMap);
    }
    
    
    @Override
    public List<ProductVO> mainCateList(String product_category) throws Exception {
        return sql.selectList(namespace+".mainCateList",product_category);
    }

    @Override
    public List<ReviewVO> listReviewPage(Integer product_no, Criteria cri) throws Exception {
        Map<String, Object> paramMap=new HashMap<String, Object>();
        paramMap.put("product_no", product_no);
        paramMap.put("cri", cri);
        return sql.selectList(namespace+".listPage",paramMap);
    }
    
}