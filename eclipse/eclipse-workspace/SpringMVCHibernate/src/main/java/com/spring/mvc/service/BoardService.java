package com.spring.mvc.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
}
