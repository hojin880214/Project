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
import com.project.domain.ReviewVO;
@Repository
public class ReviewDAOImpl implements ReviewDAO {
    private static Logger log = LoggerFactory.getLogger(ReviewDAOImpl.class);

    @Inject
    private SqlSession sql;
    private static String namespace="com.project.mapper.ReviewMapper";
    
    
    @Override
    public void create(ReviewVO rvo) throws Exception {
        sql.insert(namespace+".create", rvo);
    }

    @Override
    public void update(ReviewVO rvo) throws Exception {
        sql.update(namespace+".update", rvo);
    }

    @Override
    public void delete(Integer review_no) throws Exception {
        sql.delete(namespace+".delete", review_no);
    }

    @Override
    public List<ReviewVO> listPage(Integer product_no, Criteria cri) throws Exception {
        Map<String, Object> paramMap=new HashMap<String, Object>();
        paramMap.put("product_no", product_no);
        paramMap.put("cri", cri);
        return sql.selectList(namespace+".listPage",paramMap);
    }

    
    @Override
    public int countReview(Integer product_no) throws Exception {
        return sql.selectOne(namespace+".countReview", product_no);
    }

    @Override
    public int getProduct_no(Integer rno) throws Exception {
        return sql.selectOne(namespace+".getProduct_no", rno);
    }
}
