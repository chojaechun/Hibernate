package com.spring.mvc.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.spring.mvc.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList(map);
	}

}
