package com.spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.mvc.vo.BoardVO;

public interface BoardService {
	List<BoardVO> selectBoardList(Map<String, Object> map) throws Exception;
	BoardVO selectBoardContent(int boardSeq) throws Exception;
	int getCount(HashMap<String, Object> map);
	
}