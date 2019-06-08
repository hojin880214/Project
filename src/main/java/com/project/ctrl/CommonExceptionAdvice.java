package com.project.ctrl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {
    private static Logger log = LoggerFactory.getLogger(CommonExceptionAdvice.class);

    @ExceptionHandler(Exception.class)
    private ModelAndView errorOccured(Exception ex) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("error_occured");
        mav.addObject("exception", ex);
        return mav;        
    }
}
