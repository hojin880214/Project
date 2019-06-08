package com.project.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.PageMaker;
import com.project.domain.ProductVO;
import com.project.domain.SearchCriteria;
import com.project.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
    private static Logger log = LoggerFactory.getLogger(ProductController.class);

    @Inject
    private ProductService service;
    
    @RequestMapping(value="/register", method=RequestMethod.GET)
    public void registerGET() {
        log.info(">>>>>>>>>registerGET");
    }
    
    @RequestMapping(value="/register", method=RequestMethod.POST)
    public String registerPOST(ProductVO pvo,
                                @RequestParam("product_category") String product_category,
                                RedirectAttributes rttr) throws Exception {
        log.info(">>>>>>>>>registerPOST(...)");
        service.regist(pvo);
        rttr.addFlashAttribute("msg","success");
        rttr.addAttribute("product_category", product_category);
        return "redirect:/product/catelist";
    }
    

    @RequestMapping(value="/catelist", method=RequestMethod.GET)
    public void cateList(@ModelAttribute("scri") SearchCriteria scri,
                        @ModelAttribute("product_category") String product_category,
                        Model model)throws Exception {
        log.info(scri.toString());
        log.info(">>>>>>"+product_category);
        if(!product_category.equals("all")) {
            model.addAttribute("list",service.cateList(scri,product_category));
            PageMaker pmk=new PageMaker();
            pmk.setCri(scri);
            pmk.setTotalCount(service.countSearchList(scri,product_category));
            model.addAttribute("pmk", pmk);
            model.addAttribute("product_category", product_category);
            
        }else {
            model.addAttribute("list",service.cateList(scri));
            PageMaker pmk=new PageMaker();
            pmk.setCri(scri);
            pmk.setTotalCount(service.countSearchList(scri));
            model.addAttribute("pmk", pmk);
            model.addAttribute("product_category", product_category);
            
        }
    }
    
    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("product_no") int product_no,
                    @ModelAttribute("scri") SearchCriteria scri, Model model)
                    throws Exception {
        model.addAttribute("pvo", service.read(product_no));
        Criteria cri=new Criteria();
        int page=1;
        cri.setPage(page);
        PageMaker pmk=new PageMaker();
        pmk.setCri(cri);
        model.addAttribute("rlist",service.listReviewPage(product_no, cri));
    }
    
    @RequestMapping(value="/modify", method=RequestMethod.GET)
    public void modifyGET(@RequestParam("product_no") int product_no,
                            @ModelAttribute("scri") SearchCriteria scri,
                            Model model) throws Exception {
        log.info(">>> modifyGET(...) >>> " + product_no);
        model.addAttribute("pvo", service.read(product_no));
    }
    
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String modifyPOST(ProductVO pvo,
                            SearchCriteria scri, 
                            @RequestParam("product_category") String product_category,
                            RedirectAttributes rttr) throws Exception {
        log.info(">>> modifyPOST(...) >>>");
        service.modify(pvo);
        
        rttr.addAttribute("page", scri.getPage());
        rttr.addAttribute("perPageNum",scri.getPerPageNum());
        rttr.addAttribute("searchType", scri.getSearchType());
        rttr.addAttribute("keyword", scri.getKeyword());
        rttr.addAttribute("product_category", product_category);
        rttr.addFlashAttribute("msg", "modify_success");
        return "redirect:/product/read?page="+scri.getPage()+"&perPageNum="+
        scri.getPerPageNum()+"&searchType="+scri.getSearchType()+"&keyword="+
        scri.getKeyword()+"&product_no="+pvo.getProduct_no();
    }
    
    
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("product_no") int product_no,
                        @RequestParam("product_category") String product_category,
                        SearchCriteria scri, RedirectAttributes rttr) throws Exception {
        log.info(">>> remove(...) >>> " + product_no);
        service.remove(product_no);
        rttr.addAttribute("page", scri.getPage());
        rttr.addAttribute("perPageNum", scri.getPerPageNum());
        rttr.addAttribute("searchType", scri.getSearchType());
        rttr.addAttribute("keyword", scri.getKeyword());
        rttr.addAttribute("product_category", product_category);
        rttr.addFlashAttribute("msg", "remove_success");
        return "redirect:/product/catelist?product_category="+product_category;
    }
    
    @RequestMapping("/getFiles/{product_no}")
    @ResponseBody
    public List<String> getFiles(@PathVariable("product_no") Integer product_no) throws Exception {
        return service.getFileList(product_no);
    }
    
    @RequestMapping(value="/mainCateList", method=RequestMethod.GET)
    public void mainCateList( Model model)throws Exception {
        String product_category[]= {"cpu","mb","ram","vga","power","ssd","case","keyboard","mouse"};
        for (int i = 0; i < product_category.length; i++) {
            model.addAttribute("list"+i,service.mainList(product_category[i]));
        }
                  
    }
   
}
