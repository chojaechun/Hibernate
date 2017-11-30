package com.spring.mvc.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
    Logger log = Logger.getLogger(this.getClass());
    
    @RequestMapping(value="/board/mainPage.do")
    public ModelAndView viewMain() throws Exception{
        
    	ModelAndView mv = new ModelAndView("/home");
        return mv;
    }
        

}
