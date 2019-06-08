package com.project.persistence;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.project.domain.Criteria;
import com.project.domain.ReviewVO;

public interface ReviewDAO {
    
    public void create(ReviewVO rvo) throws Exception;
    public void update(ReviewVO rvo) throws Exception;
    public void delete(Integer review_no) throws Exception;
    public List<ReviewVO> listPage(Integer product_no, Criteria cri) throws Exception;
    public int countReview(Integer product_no)throws Exception;
    public int getProduct_no(Integer rno) throws Exception;
}
