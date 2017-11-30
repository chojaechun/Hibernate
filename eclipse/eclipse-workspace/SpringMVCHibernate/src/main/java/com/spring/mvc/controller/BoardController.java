package com.spring.mvc.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mvc.service.BoardService;

@Controller
public class BoardController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="boardService")
    private BoardService boardService;

    @RequestMapping(value="/board/boardList.do")
    public ModelAndView boardMain(Map<String,Object> commandMap) throws Exception{
        
    	ModelAndView mv = new ModelAndView("/board");
    	//ModelAndView mv = new ModelAndView("/board");
         
        List<Map<String,Object>> list = boardService.selectBoardList(commandMap); // json format send
        log.debug("DATA SIZE() = "+list.size());
        mv.addObject("boardList", list);
         
        return mv;
    }
    
    @RequestMapping(value="/board/boardWrite.do")
    public ModelAndView boardWrite(Map<String,Object> commandMap) throws Exception{
        
    	ModelAndView mv = new ModelAndView("/boardWriteForm");
        log.debug("인터셉터 테스트2");
         
        List<Map<String,Object>> list = boardService.selectBoardList(commandMap);
        mv.addObject("boardList", list);
         
        return mv;
    }
        

}
