package com.project.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Criteria {
    private static Logger log = LoggerFactory.getLogger(Criteria.class);
    private int page;
    private int perPageNum;
    
    public Criteria() {
        this.page=1;
        this.perPageNum=12;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        if(page <= 0) {
            this.page=1;
            return;
        }
        this.page = page;
    }

    public int getPerPageNum() {
        return perPageNum;
    }

    public void setPerPageNum(int perPageNum) {
        if(perPageNum <=0 || perPageNum > 50) {
            this.perPageNum=10;
            return;
        }
        this.perPageNum = perPageNum;
    }
    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
    }
    
}
